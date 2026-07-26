#!/usr/bin/env python3
"""Generate bank-ui/src/schema/ (TypeScript) from docs/BM archival Version 9.xlsx.

The workbook is the BM archival data dictionary: one sheet per table, each
listing Index | Column | Size | Datatype | Format | Name | Description | Key…
Re-run after the workbook changes:

    python3 bank-ui/scripts/extract-schema.py

Uses only the Python stdlib (no openpyxl).
"""

import json
import re
import shutil
import sys
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
XLSX_PATH = REPO_ROOT / "docs" / "BM archival Version 9.xlsx"
OUT_DIR = REPO_ROOT / "bank-ui" / "src" / "schema"

NS_MAIN = "http://schemas.openxmlformats.org/spreadsheetml/2006/main"
NS_REL = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
NS = {"m": NS_MAIN}

NON_TABLE_SHEETS = {"Version History", "MasterSheet"}

TYPE_MAP = {
    "string": "string",
    "date": "date",
    "timestamp": "timestamp",
    "numeric": "numeric",
    "number": "numeric",
}


def load_workbook(path):
    z = zipfile.ZipFile(path)
    shared = []
    try:
        root = ET.fromstring(z.read("xl/sharedStrings.xml"))
        for si in root.findall("m:si", NS):
            shared.append("".join(t.text or "" for t in si.iter(f"{{{NS_MAIN}}}t")))
    except KeyError:
        pass
    wb = ET.fromstring(z.read("xl/workbook.xml"))
    rels = ET.fromstring(z.read("xl/_rels/workbook.xml.rels"))
    relmap = {rel.get("Id"): rel.get("Target") for rel in rels}
    sheets = {}
    for sh in wb.iter(f"{{{NS_MAIN}}}sheet"):
        target = relmap[sh.get(f"{{{NS_REL}}}id")]
        if not target.startswith("xl/"):
            target = "xl/" + target.lstrip("/")
        sheets[sh.get("name")] = target
    return z, shared, sheets


def col_index(ref):
    n = 0
    for ch in ref:
        if ch.isalpha():
            n = n * 26 + ord(ch.upper()) - 64
        else:
            break
    return n


def read_rows(z, shared, target):
    """Return list of (rownum, {colnum: text}) for non-empty cells."""
    root = ET.fromstring(z.read(target))
    rows = []
    for row in root.iter(f"{{{NS_MAIN}}}row"):
        cells = {}
        for c in row.findall("m:c", NS):
            t = c.get("t")
            v = c.find("m:v", NS)
            if t == "inlineStr":
                is_el = c.find("m:is", NS)
                val = (
                    "".join(x.text or "" for x in is_el.iter(f"{{{NS_MAIN}}}t"))
                    if is_el is not None
                    else ""
                )
            elif v is None:
                val = ""
            elif t == "s":
                val = shared[int(v.text)]
            else:
                val = v.text or ""
            if val.strip():
                cells[col_index(c.get("r"))] = val
        if cells:
            rows.append((int(row.get("r")), cells))
    return rows


def clean_text(value):
    """Normalize whitespace but keep meaningful line breaks (valid-value lists)."""
    value = value.replace("\r\n", "\n").replace("\r", "\n")
    lines = [re.sub(r"[ \t]+", " ", ln).strip() for ln in value.split("\n")]
    return "\n".join(ln for ln in lines if ln).strip()


def header_key(text):
    t = re.sub(r"\s+", "", text).lower()
    if t in ("index",):
        return "index"
    if t in ("column", "columnname"):
        return "column"
    if t == "size":
        return "size"
    if t in ("datatype", "type"):
        return "datatype"
    if t == "format":
        return "format"
    if t == "name":
        return "name"
    if t == "description":
        return "description"
    m = re.fullmatch(r"key(\d*)", t)
    if m:
        return f"k{m.group(1) or '1'}"
    return None


def parse_key(header, value):
    """Parse 'K1,2' / 'K2,1' / 'K,1,4' into (keyName, position)."""
    nums = re.findall(r"\d+", value)
    if not nums:
        return None
    pos = int(nums[-1])
    key = f"k{nums[0]}" if len(nums) >= 2 else header
    return key, pos


def parse_sheet(z, shared, target):
    rows = read_rows(z, shared, target)
    header_map = None
    max_header_col = 0
    fields = []
    for _, cells in rows:
        if header_map is None:
            keys = {header_key(v) for v in cells.values()}
            if "index" in keys and "column" in keys:
                header_map = {}
                for col, v in cells.items():
                    hk = header_key(v)
                    if hk:
                        header_map[col] = hk
                        max_header_col = max(max_header_col, col)
            continue
        row = {}
        extras = []
        for col, v in cells.items():
            hk = header_map.get(col)
            if hk:
                row[hk] = v
            elif col > max_header_col:
                extras.append(v)
        colname = (row.get("column") or "").strip()
        if not colname:
            continue
        field = {"name": colname}
        label = clean_text(row.get("name", "")).replace("\n", " ")
        if label:
            field["label"] = label
        dtype = row.get("datatype", "").strip().lower()
        if dtype:
            field["type"] = TYPE_MAP.get(dtype, dtype)
        size = row.get("size", "").strip()
        if size.isdigit():
            field["size"] = int(size)
        elif size:
            field["size"] = size
        fmt = clean_text(row.get("format", ""))
        if fmt:
            field["format"] = fmt
        keydefs = {}
        for hk in ("k1", "k2", "k3"):
            if hk in row:
                parsed = parse_key(hk, row[hk])
                if parsed:
                    keydefs[parsed[0]] = parsed[1]
        if keydefs:
            field["keys"] = keydefs
        desc = clean_text(row.get("description", ""))
        if desc:
            field["description"] = desc
        note = clean_text(" ".join(extras))
        if note:
            field["note"] = note
        fields.append(field)
    return fields


def parse_master_sheet(z, shared, target):
    """MasterSheet: File Name | File Description | STATUS."""
    info = {}
    for _, cells in read_rows(z, shared, target):
        name = (cells.get(1) or "").strip()
        if not name or name.lower() == "file name":
            continue
        info[name] = {
            "description": clean_text(cells.get(2, "")),
            "status": clean_text(cells.get(3, "")),
        }
    return info


def js_string(value):
    return json.dumps(value, ensure_ascii=False)


def field_js(field):
    parts = [f"name: {js_string(field['name'])}"]
    for key in ("label", "type", "size", "format"):
        if key in field:
            val = field[key]
            parts.append(f"{key}: {val if isinstance(val, int) else js_string(val)}")
    if "keys" in field:
        keys = ", ".join(f"{k}: {v}" for k, v in sorted(field["keys"].items()))
        parts.append(f"keys: {{ {keys} }}")
    for key in ("description", "note"):
        if key in field:
            parts.append(f"{key}: {js_string(field[key])}")
    return "    { " + ", ".join(parts) + " },"


def main():
    if not XLSX_PATH.exists():
        sys.exit(f"workbook not found: {XLSX_PATH}")
    z, shared, sheets = load_workbook(XLSX_PATH)
    master = parse_master_sheet(z, shared, sheets["MasterSheet"])
    # MasterSheet names occasionally differ from sheet names in case only
    # (e.g. srvfeeCtl vs srvfeectl), so match case-insensitively.
    master_ci = {name.lower(): meta for name, meta in master.items()}

    tables_dir = OUT_DIR / "tables"
    if tables_dir.exists():
        shutil.rmtree(tables_dir)
    tables_dir.mkdir(parents=True)

    banner = (
        "// Generated by bank-ui/scripts/extract-schema.py from\n"
        f"// {XLSX_PATH.relative_to(REPO_ROOT)}\n"
        "// Do not edit by hand — re-run the script after the workbook changes.\n"
    )

    written = []
    for sheet_name, target in sheets.items():
        if sheet_name in NON_TABLE_SHEETS:
            continue
        fields = parse_sheet(z, shared, target)
        if not fields:
            print(f"warning: no fields parsed for sheet {sheet_name!r}, skipped", file=sys.stderr)
            continue
        meta = master_ci.get(sheet_name.lower(), {})
        lines = [
            banner,
            "import type { SchemaTable } from '../types'",
            "",
            f"const {sheet_name}: SchemaTable = {{",
            f"  name: {js_string(sheet_name)},",
        ]
        if meta.get("description"):
            lines.append(f"  description: {js_string(meta['description'])},")
        if meta.get("status"):
            lines.append(f"  status: {js_string(meta['status'])},")
        lines.append("  fields: [")
        lines.extend(field_js(f) for f in fields)
        lines.append("  ],")
        lines.append("}")
        lines.append("")
        lines.append(f"export default {sheet_name}")
        (tables_dir / f"{sheet_name}.ts").write_text("\n".join(lines) + "\n")
        written.append((sheet_name, len(fields)))

    index_lines = [banner]
    for name, _ in written:
        index_lines.append(f"export {{ default as {name} }} from './tables/{name}'")
    index_lines.append("")
    index_lines.append("export const TABLE_NAMES: string[] = [")
    for name, _ in written:
        index_lines.append(f"  {js_string(name)},")
    index_lines.append("]")
    (OUT_DIR / "index.ts").write_text("\n".join(index_lines) + "\n")

    total_fields = sum(n for _, n in written)
    print(f"wrote {len(written)} tables ({total_fields} fields) to {OUT_DIR.relative_to(REPO_ROOT)}")
    unmatched = {n for n in master if n.lower() not in {w.lower() for w, _ in written}}
    if unmatched:
        print(f"MasterSheet entries with no sheet: {sorted(unmatched)}", file=sys.stderr)


if __name__ == "__main__":
    main()
