#!/bin/bash

set -eu

KEYS_DIRECOTRY="/etc/bind/keys"
ZONE="."
ZONE_FILE="/etc/bind/root.zone"
OUT_FILE="/etc/bind/root.signed"

mkdir -p $KEYS_DIRECOTRY
cd $KEYS_DIRECOTRY
dnssec-keygen -f KSK -a RSASHA256 -b 4096 -n ZONE $ZONE
dnssec-keygen -a RSASHA256 -b 2048 -n ZONE $ZONE
dnssec-signzone -a -S -x -K $KEYS_DIRECOTRY -f $OUT_FILE -o $ZONE $ZONE_FILE
