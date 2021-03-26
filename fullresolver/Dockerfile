FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade && apt-get install -y bind9 dnsutils vim

WORKDIR /etc/bind
RUN rndc-confgen -a && chown root:root rndc.key
ADD ./config/named.conf /etc/bind/named.conf

EXPOSE 53 953
ENTRYPOINT [ "/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf" ]