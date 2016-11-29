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
    git clone https://github.com/opsxcq/pystemon && \
    cd pystemon && \
    rm -Rf .git

COPY main.sh /main.sh

# All Pastes 
VOLUME /pystemon/pystemon/archive

# Just pastes that matched our alerts
VOLUME /pystemon/pystemon/alerts

ENTRYPOINT ["/main.sh"]
