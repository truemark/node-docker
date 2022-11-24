ARG NODE_VERSION
FROM node:${NODE_VERSION}-alpine AS builder
RUN npm install -g pnpm esbuild

FROM alpine:latest
COPY --from=builder /usr/local/ /usr/local/
