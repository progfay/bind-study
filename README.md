# BIND 9 Study

https://github.com/isc-projects/bind9

```sh
docker build -t bind-study .
docker run --rm --name bind -it -p 53:53/udp bind-study

dig @127.0.0.1 www.progfay.com
```

