FROM ubuntu:latest

ENV VERSION 9.12.4

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y wget vim gcc python3-pip libssl-dev && \
    pip3 install --upgrade pip && \
    pip3 install argparse ply

RUN cd /usr/local/src && \
    wget ftp://ftp.isc.org/isc/bind9/${VERSION}/bind-${VERSION}.tar.gz && \
    tar zxvf bind-${VERSION}.tar.gz && \
    mv bind-${VERSION} bind && \
    rm bind-${VERSION}.tar.gz
RUN cd /usr/local/src/bind && \
    ./configure && \
    chown -R root:root /usr/local/src/bind && \
    make && \
    make install

WORKDIR /etc/bind
RUN wget ftp://ftp.nic.ad.jp/internet/rs.internic.net/domain/named.root
RUN rndc-confgen -a && chown root:root /etc/rndc.key
ADD ./config/named.conf /etc/bind/named.conf
ADD ./config/progfay.com.zone /etc/bind/progfay.com.zone

EXPOSE 53 953
ENTRYPOINT [ "/usr/local/sbin/named", "-g", "-c", "/etc/bind/named.conf" ]