# Docker image for murmur (mumble-server)

This image uses the static linux binary from the official Mumble website, making it extremely small (~14 MB).

## Base Docker Image

- [busybox](https://registry.hub.docker.com/_/busybox)

## Installation

1. [Install Docker](https://www.docker.com/).

2. Download docker image: `docker pull gravufo/mumble`

## Usage

To launch it, just type:

```
docker run -d --name mumble-server --restart unless-stopped -p 64738:64738 -p 64738:64738/udp -v [your config folder]:/data gravufo/murmur
```

Or, with Compose:

```
git clone https://github.com/gravufo/murmur-docker
cd murmur-docker
docker-compose up -d
```
