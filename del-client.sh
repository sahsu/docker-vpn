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

# delete client compose way
echo "deleting client $1"
docker-compose run --rm openvpn-server ovpn_revokeclient $1 remove #https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md, search Revoke a client certificate
if [ $? -eq 0 ] ; then
  echo "client $1 is removed, restarting compose"
  docker-compose stop; docker-compose rm -f; docker-compose up -d
else
  echo "seems something wrong. please check."
fi




#echo
#echo "deleting client $1"
#docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa revoke $1
#if [ $? -eq 0 ] ; then
#  echo 'revoke ok, moving to delete keys'
#  docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn /bin/rm /etc/openvpn/pki/issued/$1.crt /etc/openvpn/pki/private/$1.key  /etc/openvpn/pki/reqs/$1.req
#fi
#echo
