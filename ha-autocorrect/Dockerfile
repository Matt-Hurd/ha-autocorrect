ARG BUILD_FROM
FROM $BUILD_FROM

ARG TYPESENSE_VER="0.25.2"
ARG TYPESENSE_VER

# Install typesense-server with md5sum workaround
ARG BUILD_ARCH

RUN apk add --no-cache coreutils curl

WORKDIR /usr/local/sbin
RUN curl -o typesense-server.tar.gz https://dl.typesense.org/releases/${TYPESENSE_VER}/typesense-server-${TYPESENSE_VER}-linux-${BUILD_ARCH}.tar.gz && \
    tar xf typesense-server.tar.gz && echo -n '  typesense-server' >> typesense-server.md5.txt \
    md5sum -c typesense-server.md5.txt && rm typesense-server*.*

WORKDIR /app

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache pip install -r requirements.txt

COPY rootfs /

EXPOSE 9000

HEALTHCHECK \
    CMD /usr/bin/entrypoint.sh