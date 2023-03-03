#!/bin/bash

IP="172.25.0.2"
SUBJECT_CA="/C=FR/ST=Grenoble/L=Grenoble/O=himinds/OU=CA/CN=$IP"
SUBJECT_SERVER="/C=FR/ST=Grenoble/L=Grenoble/O=himinds/OU=Server/CN=$IP"
SUBJECT_CLIENT="/C=FR/ST=Grenoble/L=Grenoble/O=himinds/OU=Client/CN=$IP"
BROKER_OUTDIR="broker_certs/"
CLIENT_OUTDIR="client_certs/"


function generate_CA () {
   echo "$SUBJECT_CA"
   openssl req -x509 -nodes -sha256 -newkey rsa:2048 -subj "$SUBJECT_CA"  -days 3650 -keyout ca.key -out ca.crt
   chmod +r ca.crt ca.key
}

function generate_server () {
   echo "$SUBJECT_SERVER"
   openssl req -nodes -sha256 -new -subj "$SUBJECT_SERVER" -keyout server.key -out server.csr
   openssl x509 -req -sha256 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650
   chmod +r server.crt server.key
}

function generate_client () {
   echo "$SUBJECT_CLIENT"
   openssl req -new -nodes -sha256 -subj "$SUBJECT_CLIENT" -out client.csr -keyout client.key 
   openssl x509 -req -sha256 -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 3650
   chmod +r client.crt client.key
}

function move_files () {
   mv *.key *.crt *.csr $BROKER_OUTDIR
}

generate_CA
generate_server
# generate_client
move_files
