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
    rm -Rf .git && \
    sed  -i 's/compress: yes/compress: no/' pystemon.yaml

COPY main.sh /main.sh

# Pastes folder
VOLUME /pystemon/pystemon/archive
VOLUME /pystemon/pystemon/alerts

ENTRYPOINT ["/main.sh"]
