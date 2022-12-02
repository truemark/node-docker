ARG OS_NAME
ARG OS_VERSION
FROM $OS_NAME:$OS_VERSION AS build
ARG OS_NAME
ARG NODE_VERSION
RUN if [ "${OS_NAME}" = "debian" ] || [ "${OS_NAME}" = "ubuntu" ]; then \
      apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -qq curl ca-certificates python3 gcc g++ make; \
    elif [ "${OS_NAME}" = "amazonlinux" ]; then \
      yum install -y -q tar gzip gcc g++ make; \
    elif [ "${OS_NAME}" = "alpine" ]; then \
      apk add curl python3 gcc make g++ linux-headers; \
    fi
RUN mkdir /src && curl -sSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz -o - | tar -zxf - -C /src --strip-component 1
WORKDIR /src
RUN ./configure --prefix=/usr/local
RUN make -j4
RUN make install

FROM $OS_NAME:$OS_VERSION AS test
ARG OS_NAME
COPY --from=build /usr/local/ /usr/local/
RUN if [ "${OS_NAME}" = "alpine" ]; then \
      apk add libstdc++; \
    fi
RUN if [ "$(echo "console.log('test');" | /usr/local/bin/node)" != "test" ]; then echo "Test failed"; exit 1; fi

FROM scratch
COPY --from=test /usr/local/ /usr/local/
