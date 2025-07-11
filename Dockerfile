FROM ubuntu:24.04 AS base

ARG VER=1.22.2
RUN apt-get update -y && \
    apt-get install -yqq \
        ca-certificates \
        wget \
        curl \
        telnet \
        gpg \
        apt-transport-https && \
        apt clean

RUN wget https://github.com/rigelminer/rigel/releases/download/$VER/rigel-$VER-linux.tar.gz && \
    tar -xzf rigel-$VER-linux.tar.gz && \
    rm rigel-$VER-linux.tar.gz && \
    mv rigel-$VER-linux rigel-miner

RUN ln -s libnvidia-ml.so.1 /lib/x86_64-linux-gnu/libnvidia-ml.so

WORKDIR rigel-miner

COPY startup.sh /rigel-miner

RUN chmod +x startup.sh

# Add in start.up to read env variables
CMD ["./startup.sh"]