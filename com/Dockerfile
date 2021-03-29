FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade && apt-get install -y bind9 dnsutils vim

WORKDIR /etc/bind
RUN rndc-confgen -a && chown root:root rndc.key
RUN mkdir -p /etc/bind/slave
ADD ./config/named.conf /etc/bind/named.conf
ADD ./config/com.zone /etc/bind/com.zone

EXPOSE 53 953
ENTRYPOINT [ "/usr/sbin/named", "-g", "-4", "-c", "/etc/bind/named.conf" ]