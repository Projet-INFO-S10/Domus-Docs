#!/bin/bash

IP="172.25.0.2" # IP or DNS name of the broker
SUBJECT_CA="/C=FR/ST=Grenoble/L=Grenoble/O=himinds/OU=CA/CN=$IP"
SUBJECT_SERVER="/C=FR/ST=Grenoble/L=Grenoble/O=himinds/OU=Server/CN=$IP"
SUBJECT_CLIENT="/C=FR/ST=Grenoble/L=Grenoble/O=himinds/OU=Client/CN=$IP"
BROKER_OUTDIR="broker_certs/"
CLIENT_OUTDIR="client_certs/"


function generate_CA () { # Generate CA certificate and key
   echo "$SUBJECT_CA"
   openssl req -x509 -nodes -sha256 -newkey rsa:2048 -subj "$SUBJECT_CA"  -days 3650 -keyout ca.key -out ca.crt
   chmod +r ca.crt ca.key
}

function generate_server () { # Generate server certificate and key
   echo "$SUBJECT_SERVER"
   openssl req -nodes -sha256 -new -subj "$SUBJECT_SERVER" -keyout server.key -out server.csr
   openssl x509 -req -sha256 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650
   chmod +r server.crt server.key
}

function generate_client () { # Generate client certificate and key
   echo "$SUBJECT_CLIENT"
   openssl req -new -nodes -sha256 -subj "$SUBJECT_CLIENT" -out client.csr -keyout client.key 
   openssl x509 -req -sha256 -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 3650
   chmod +r client.crt client.key
}

function move_server_files () { # Move server files to the broker directory
   mv ca.key ca.crt server.csr server.key $BROKER_OUTDIR
}

function move_client_files () { # Move client files to the client directory
   mv client.key client.crt client.csr $CLIENT_OUTDIR
   cp $BROKER_OUTDIR/ca.crt $CLIENT_OUTDIR
}

generate_CA
generate_server
# generate_client
move_server_files
# move_client_files
