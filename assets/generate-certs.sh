#!/usr/bin/env bash

CERT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
CERT_HOSTS=(
  "localhost"
  "127.0.0.1"
  "::1"
  "*.dev.localhost"
  "*.dev.internal"
  "host.docker.internal"
  "host.containers.internal"
)

# generate root CA
mkcert -install

# generate legacy cert with mkcert
mkcert -key-file $CERT_DIR/localhost-key.pem -cert-file $CERT_DIR/localhost.pem "${CERT_HOSTS[@]}"
mkcert -pkcs12 -p12-file $CERT_DIR/localhost-legacy.pfx "${CERT_HOSTS[@]}"

# re-export with modern algorithm and blank the password
openssl pkcs12 -in $CERT_DIR/localhost-legacy.pfx -legacy -passin pass:changeit -nodes -out $CERT_DIR/cert-and-key.pem
openssl pkcs12 -export -in $CERT_DIR/cert-and-key.pem -out $CERT_DIR/localhost.pfx -passout pass:

rm $CERT_DIR/localhost-legacy.pfx $CERT_DIR/cert-and-key.pem
