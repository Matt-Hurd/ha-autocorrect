
ARG BUILD_FROM
FROM typesense/typesense:0.25.2 AS source

FROM $BUILD_FROM

ARG BUILD_ARCH

COPY --from=source /opt/typesense-server /opt/typesense-server
RUN chmod +x /opt/typesense-server

RUN apk add --no-cache ca-certificates

EXPOSE 8108

HEALTHCHECK \
    CMD curl http://localhost:8108/health