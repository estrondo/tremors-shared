#!/bin/bash


echo "Okay friend, let's create the certificates to you be able to test tremors properly."

OUT_DIR="server/ssl-certs"
PEM_FILE="$OUT_DIR/tremors.pem"
SUBJ="/CN=estrondo.one/O=estrondo/C=BR"

mkdir -p "$OUT_DIR"
openssl req -new -nodes -keyout "$PEM_FILE" -subj $SUBJ -x509 -days 365 -out "$PEM_FILE" > /dev/null 2>&1
chmod a=r "$PEM_FILE" > /dev/null 2>&1
