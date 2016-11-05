# docker-pystemon
[![Docker Pulls](https://img.shields.io/docker/pulls/strm/docker-pystemon.svg?style=plastic)](https://hub.docker.com/r/strm/docker-pystemon/)
![License](https://img.shields.io/badge/License-GPL-blue.svg?style=plastic)

Pystemon is a software that collects pastes from several websites.

## Run

docker run -d --restart=always --name pystemon -v $(pwd)/alerts:/pystemon/alerts -v $(pwd)/archive:/pystemon/archive strm/docker-pystemon

## Build

docker build -t strm/docker-pystemon .
