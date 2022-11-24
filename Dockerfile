FROM amazonlinux:2 AS builder
ARG NODE_VERSION
ARG TARGETARCH
RUN yum install -y tar gzip
RUN rm -rf /usr/local/*
RUN curl -sSL "https://nodejs.org/dist/latest-v$(echo ${NODE_VERSION} | sed "s/\..*//g").x/node-v${NODE_VERSION}-linux-${TARGETARCH}.tar.gz" -o - | tar -zxf - -C /usr/local --strip-component 1
RUN rm -f /usr/local/*.md
RUN npm install -g pnpm esbuild

FROM scratch
COPY --from=builder /usr/local/ /usr/local/
