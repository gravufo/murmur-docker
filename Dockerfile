FROM busybox:latest
MAINTAINER Christian Artin <gravufo@gmail.com>

ENV version=1.3.0

# Download statically compiled murmur and install it to /opt/murmur
RUN mkdir /opt && cd /opt && \
    wget https://github.com/mumble-voip/mumble/releases/download/${version}/murmur-static_x86-${version}.tar.bz2 && \
    bzcat /opt/murmur-static_x86-${version}.tar.bz2 | tar -x -C /opt -f - && \
    rm /opt/murmur-static_x86-${version}.tar.bz2 && \
    mv /opt/murmur-static_x86-${version} /opt/murmur && \
    adduser -S -u 1000 mumble

# Read murmur.ini and murmur.sqlite from /data/
VOLUME ["/data"]

# Forward apporpriate ports
EXPOSE 64738/tcp 64738/udp

# Run murmur
USER mumble
ENTRYPOINT ["/opt/murmur/murmur.x86", "-fg", "-ini", "/data/murmur.ini"]
