#!/usr/bin/env bash
OVPN_DATA="ovpn-data"

test -z $1 > /dev/null
if [ $? -eq 0  ]; then
    echo "Usage:

      $0 [client-name]
        "
          exit 0
        fi

echo $2 | grep -iE "^$" || export OVPN_DATA=$2

echo
echo "adding client $1"
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $1 nopass
echo
echo "exporting client info to $1.ovpn"
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $1 > $1.ovpn

echo
echo "open w/ openvpn client, remeber enable 1194/udp in your server"
echo

