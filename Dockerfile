FROM debian:jessie

MAINTAINER opsxcq <opsxcq@thestorm.com.br>

# Base packages
RUN apt-get update && \
    apt-get -y install \
    git \
    curl \
    python python-yaml python-beautifulsoup 

# Clone pystemon repository
RUN cd / && \
    git clone https://github.com/cvandeplas/pystemon && \
    cd pystemon && \
    rm -Rf .git

ADD ./monitor.sh /monitor.sh

# Pastes folder
VOLUME /pystemon/pystemon/archive
VOLUME /pystemon/pystemon/alerts

