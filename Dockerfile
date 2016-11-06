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
    git clone git@github.com:opsxcq/pystemon.git && \
    cd pystemon && \
    rm -Rf .git

COPY main.sh /main.sh

# Pastes folder
VOLUME /pystemon/pystemon/archive
VOLUME /pystemon/pystemon/alerts

ENTRYPOINT ["/main.sh"]
