
ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

ARG TYPESENSE_VER="0.25.2"

RUN apt install curl tar

RUN curl -LO https://dl.typesense.org/releases/${TYPESENSE_VER}/typesense-server-${TYPESENSE_VER}-linux-${BUILD_ARCH}.tar.gz && \
    tar xfz typesense-server-${TYPESENSE_VER}-linux-${BUILD_ARCH}.tar.gz && \
    mv typesense-server /opt/typesense-server && \
    rm typesense-server-${TYPESENSE_VER}-linux-${BUILD_ARCH}.tar.gz

RUN chmod +x /opt/typesense-server

EXPOSE 8108

CMD /opt/typesense-server --data-dir /data --api-key testing