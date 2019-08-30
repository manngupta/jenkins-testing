#!/bin/bash
if [ -z "$1" ]
then 
echo "Usage: ./create-cert.sh sitename.cloudapps.lab.com"
exit
fi

echo "Generating a private key..."
openssl genrsa -out $1.key 2048
echo

echo "Generating a CSR..."
openssl req -new -key $1.key -out $1.csr -subj "/C=US/ST=NC/L=Raleigh/O=RedHat/OU=RHT/CN=$1"
echo

echo "Generating a certificate..."
openssl x509 -req -days 366 -in $1.csr -signkey $1.key -out $1.crt
echo
echo  "DONE."
echo
