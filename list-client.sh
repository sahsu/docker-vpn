#!/usr/bin/env bash
OVPN_DATA="ovpn-data"

docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ls -l /etc/openvpn/pki/issued/ | grep -ivE "total" | awk '{print $NF}' |sed -e 's;.crt;;g'
