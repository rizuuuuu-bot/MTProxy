#!/bin/bash

# Default values (can be overridden via Render)
SECRET=${PROXY_SECRET:-$(openssl rand -hex 16)}
PORT=${PROXY_PORT:-10000}
AD_TAG=${PROXY_AD_TAG:-""}

echo "Starting MTProto Proxy..."
echo "Secret: $SECRET"
echo "Port: $PORT"
echo "AD_TAG: $AD_TAG"

/app/objs/bin/mtproto-proxy \
    -u nobody \
    -p 8888 \
    -H $PORT \
    -S $SECRET \
    --aes-pwd proxy-secret proxy-multi.conf \
    -M 1 \
    --tag=$AD_TAG
