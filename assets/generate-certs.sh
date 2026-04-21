#!/usr/bin/env bash

CERT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
CERT_HOSTS="localhost 127.0.0.1 ::1 *.dev.localhost *.dev.internal host.docker.internal host.containers.internal"

# generate root CA
mkcert -install

mkcert -key-file $CERT_DIR/localhost-key.pem -cert-file $CERT_DIR/localhost.pem $CERT_HOSTS
mkcert -pkcs12 -p12-file $CERT_DIR/localhost.pfx $CERT_HOSTS
