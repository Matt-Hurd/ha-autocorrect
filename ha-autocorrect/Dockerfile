ARG BUILD_FROM
FROM $BUILD_FROM

ARG TYPESENSE_VER="0.25.2"
ARG TYPESENSE_VER

# Install typesense-server with md5sum workaround
ARG BUILD_ARCH

RUN apk add --no-cache coreutils curl python3 py3-pip

WORKDIR /app

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache pip install -r requirements.txt

COPY rootfs /

EXPOSE 9000

HEALTHCHECK \
    CMD /usr/bin/entrypoint.sh