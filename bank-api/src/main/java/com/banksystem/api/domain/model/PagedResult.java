package com.banksystem.api.domain.model;

import java.util.List;

/**
 * Paged fetch: at most PAGE_SIZE rows per request; a full page means more
 * may exist. (The legacy server used 20 via lastRecCount; the revamp
 * standardises on 10 per page.)
 *
 * <p>{@code incomplete} carries the legacy's incompleteFlag contract
 * (cbbranch.c:1742-1756): when the C could not finish a scan it flushed what it
 * had, set {@code incompleteFlag = '1'} and still returned SUCCESS — so the
 * operator was told the list was cut rather than silently shown a partial one.
 * The C's trigger was an alarm(searchTimeOut), not a row count (its only
 * row-count guard, :1735-1740, is commented out); this port's trigger is the
 * MAX_ROWS cap the repositories apply to protect the Hive views. Different
 * cause, same promise: a truncated result never passes as a whole one.
 */
public record PagedResult<T>(List<T> rows, boolean hasMore, boolean incomplete) {

    public static final int PAGE_SIZE = 10;

    public static <T> PagedResult<T> page(List<T> all, int page) {
        return page(all, page, false);
    }

    /** @param incomplete true when the underlying scan was truncated. */
    public static <T> PagedResult<T> page(List<T> all, int page, boolean incomplete) {
        int from = Math.min(page * PAGE_SIZE, all.size());
        int to = Math.min(from + PAGE_SIZE, all.size());
        return new PagedResult<>(all.subList(from, to), to < all.size(), incomplete);
    }
}
