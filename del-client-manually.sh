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
  echo "delete keys for client $1"
  docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn /bin/rm /etc/openvpn/pki/issued/$1.crt /etc/openvpn/pki/private/$1.key  /etc/openvpn/pki/reqs/$1.req
