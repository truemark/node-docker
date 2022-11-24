ARG NODE_VERSION
FROM node:${NODE_VERSION}-alpine AS builder
RUN npm install -g pnpm esbuild typescript

FROM alpine:latest
COPY --from=builder /usr/local/ /usr/local/
