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
echo "deleting client $1"
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa revoke $1
echo
