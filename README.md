# docker-compose base on kylemanna/openvpn

1. simple run ./run.sh to initial + run openvpn as docker container
1. `Enter PEM pass phrase:` your PEM key
1. `Verifying - Enter PEM pass phrase:` re-enter again your PEM key
1. `Common Name (eg: your user, host, or server name) [Easy-RSA CA]:` your server FQDN ( domain name able to reach docker port udp 1194 )

```
1st run
FQDN=[YOUR_FQDN] ./run.sh
```

1. add client by add-client.sh

```
./add-client.sh [client-name]
```

2. show all clients
```
./list-client.sh
```

3. delete a client
```
./del-client.sh
( manually way )
  ./del-client-manually.sh
```
4. in reboot
4. you shouldn't need touch anything docker-compose will automatic run w/ normally

# FAQ
1.  if you seeing `failed to update database TXT_DB error number2` when you try to use `./add-client.sh`
 1. login your docker openvpn container
 1. vi /etc/openvpn/pki/index.txt
 1. remove unuse client name e.g. CLIENT_NAME
 1. start over to ./add-client.sh

``
./add-client.sh CLIENT_NAME


adding client CLIENT_NAME
Generating a 2048 bit RSA private key
..........+++
..........................................................................................................+++
writing new private key to '/etc/openvpn/pki/private/CLIENT_NAME.key.XXXXNklHfb'
-----
Using configuration from /usr/share/easy-rsa/openssl-1.0.cnf
Enter pass phrase for /etc/openvpn/pki/private/ca.key:
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName            :ASN.1 12:'CLIENT_NAME'
Certificate is to be certified until Nov 12 13:20:16 2027 GMT (3650 days)
failed to update database
TXT_DB error number 2

Easy-RSA error:

signing failed (openssl output above may have more detail)

exporting client info to CLIENT_NAME.ovpn
Error opening Certificate /etc/openvpn/pki/issued/CLIENT_NAME.crt
140481787513740:error:02001002:system library:fopen:No such file or directory:bss_file.c:402:fopen('/etc/openvpn/pki/issued/CLIENT_NAME.crt','r')
140481787513740:error:20074002:BIO routines:FILE_CTRL:system lib:bss_file.c:404:
unable to load certificate

open w/ openvpn client, remeber enable 1194/udp in your server
``
