#!/bin/bash


echo "Okay friend, let's create the certificates to you be able to test tremors properly."

OUT_DIR="server/ssl-certs"
KEY_FILE="$OUT_DIR/tremors.key"
PEM_FILE="$OUT_DIR/tremors.pem"
CERT_FILE="$OUT_DIR/tremors.crt"

SUBJ="/CN=estrondo.one/O=estrondo/C=BR"
ALT_NAMES="DNS:*.estrondo.one"

rm -f "$KEY_FILE" "$PEM_FILE" "$CERT_FILE"

mkdir -p "$OUT_DIR"
openssl req -new -nodes -keyout "$KEY_FILE" -subj $SUBJ -x509 -days 365 -out "$PEM_FILE" -addext "subjectAltName=$ALT_NAMES" > /dev/null 2>&1
openssl x509 -outform der -in "$PEM_FILE" -out "$CERT_FILE" > /dev/null 2>&1