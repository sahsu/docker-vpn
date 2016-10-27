#!/usr/bin/env bash
OVPN_DATA="ovpn-data"

docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ls /etc/openvpn/pki/issued/ | sed -e 's;.crt;;g'
