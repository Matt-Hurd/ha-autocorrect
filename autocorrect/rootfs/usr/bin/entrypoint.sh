#!/usr/bin/with-contenv bashio
set -e

jq -r 'to_entries[] | "\(.key | ascii_upcase)=\(.value)"' /data/options.json > config.env
# Add supervisor token to config.env from existing env var
echo "SUPERVISOR_TOKEN=${SUPERVISOR_TOKEN}" >> config.env

# Log level - acceptable values are debug, info, warning, error, critical. Suggest info or debug.
LOG_LEVEL=${LOG_LEVEL:-info}

RUN_MODE=${RUN_MODE:-prod}

set -a

if [ "$RUN_MODE" == "dev" ]; then
    echo "Running in dev mode. Make sure you have Typesense started on host!"
    LOG_LEVEL="debug"
    uvicorn wac:app --host 0.0.0.0 --port 9000 --reload --log-config /usr/share/autocorrect/uvicorn-log-config.json \
        --log-level "$LOG_LEVEL" --loop uvloop --timeout-graceful-shutdown 5 \
        --no-server-header --env-file config.env
else
    uvicorn wac:app --host 0.0.0.0 --port 9000 --log-config /usr/share/autocorrect/uvicorn-log-config.json \
        --log-level "$LOG_LEVEL" --loop uvloop --timeout-graceful-shutdown 5 \
        --no-server-header --env-file config.env
fi