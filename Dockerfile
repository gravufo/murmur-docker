FROM ubuntu:xenial
MAINTAINER Christian Artin <gravufo@gmail.com>

RUN useradd -u 1000 mumble \
 && apt-get update \
 && apt-get install -y software-properties-common \
 && add-apt-repository ppa:mumble/release \
 && apt-get update \
 && apt-get install -y mumble-server

VOLUME ["/data"]
EXPOSE 64738 64738/udp

USER mumble
ENTRYPOINT ["/usr/sbin/murmurd", "-fg", "-ini", "/data/murmur.ini"]
