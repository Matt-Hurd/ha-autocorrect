ARG BUILD_FROM
FROM $BUILD_FROM

ARG TYPESENSE_VER="0.25.2"
ARG TYPESENSE_VER

# Install typesense-server with md5sum workaround
ARG BUILD_ARCH

RUN apk add --no-cache coreutils curl python3 py3-pip jq

WORKDIR /app

COPY requirements.txt .

RUN pip install --break-system-packages -r requirements.txt

COPY rootfs /

RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 9000

CMD /usr/bin/entrypoint.sh