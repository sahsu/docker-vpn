# docker-compose base on kylemanna/openvpn

1. simple run ./run.sh to initial + run openvpn as docker container
1. `Enter PEM pass phrase:` your PEM key
1. `Verifying - Enter PEM pass phrase:` re-enter again your PEM key
1. `Common Name (eg: your user, host, or server name) [Easy-RSA CA]:` your server FQDN ( domain name able to reach docker port udp 1194 )

```
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
```
