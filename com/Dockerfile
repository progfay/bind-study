FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade && apt-get install -y bind9 dnsutils vim

WORKDIR /etc/bind
RUN rndc-confgen -a && chown root:root rndc.key
ADD ./config/named.conf /etc/bind/named.conf
ADD ./config/com.zone /etc/bind/com.zone

ENTRYPOINT [ "/usr/sbin/named", "-g", "-4", "-c", "/etc/bind/named.conf" ]