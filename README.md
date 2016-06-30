# Docker image for murmur (mumble-server)

## Base Docker Image

- [ubuntu](https://registry.hub.docker.com/_/ubuntu/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. Download docker image: `docker pull gravufo/mumble`

## Usage

To launch it, just type:

```
docker run -d --name mumble-server --restart unless-stopped -p 64738:64738 -p 64738:64738/udp -v [your config folder]:/data gravufo/mumble
```
