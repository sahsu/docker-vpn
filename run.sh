#!/usr/bin/env bash
OVPN_DATA="ovpn-data"

test -z $FQDN> /dev/null
if [ $? -eq 0  ]; then
    echo "Usage:

      FQDN={YOUR_VPN_FQDN} OVPN_DATA=${YOUR_OPENVPN_DATA_DIRECTORY} ./$0.sh
        "
          exit 0
        fi

echo $2 | grep -iE "^$" || export OVPN_DATA=$2

docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://${FQDN}

echo
echo "prepare KEY for OVPN"
echo
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki

echo
echo "starting OPENVPN as docker"
echo
docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn

