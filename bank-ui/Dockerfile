# bank-ui — the React SPA, served by nginx.
#
# nginx does two jobs: it serves the built static assets, and it reverse-proxies
# /api/ to the bank-api container. That second job is what keeps the browser on
# a SINGLE ORIGIN, which in turn means:
#   - no CORS configuration in production (BANK_CORS_ORIGINS stays dev-only),
#   - no API hostname compiled into the bundle, so one image runs in every
#     environment (src/api.ts resolves BASE to '' in a production build),
#   - the JWT Bearer flow and the X-Refresh-Token sliding refresh work exactly
#     as they do today under the single-jar deployment.
#
# Build from the bank-ui directory:
#   docker build -t bank-ui:0.1.0 .

# ---------------------------------------------------------------- build ----
# Vite 8 requires Node 20.19+ / 22.12+; 22 is the current LTS line.
FROM node:22-alpine AS build
WORKDIR /build

# Dependencies in their own layer, so editing a component does not re-install
# node_modules. `npm ci` installs exactly what package-lock.json pins.
COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

# -------------------------------------------------------------- runtime ----
FROM nginx:alpine

# Replaces nginx's stock localhost server block.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Only the built output ships — no node_modules, no source, no toolchain.
COPY --from=build /build/dist /usr/share/nginx/html

EXPOSE 80
