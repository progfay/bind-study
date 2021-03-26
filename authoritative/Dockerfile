FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade && apt-get install -y bind9 dnsutils curl vim

WORKDIR /etc/bind
RUN curl -o named.root ftp://ftp.nic.ad.jp/internet/rs.internic.net/domain/named.root
RUN rndc-confgen -a && chown root:root rndc.key
ADD ./config/named.conf /etc/bind/named.conf
ADD ./config/auth.com.zone /etc/bind/auth.com.zone

EXPOSE 53 953
ENTRYPOINT [ "/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf" ]