FROM ubuntu:latest
MAINTAINER Jan Sanchez, joejansanchez@gmail.com

RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
#  build-essential \
#  libssl-dev \
  && rm -rf /var/lib/apt/lists/*

ENV NODE_VERSION 6.9.5
ENV NODE_ARCH x64

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.xz /tmp/
RUN tar -xJf /tmp/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.xz -C /opt/ && rm /tmp/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.xz

RUN mkdir -p /opt/
RUN mv /opt/node-v$NODE_VERSION-linux-$NODE_ARCH /opt/node

RUN ln -sf /opt/node/bin/node /usr/bin/node
RUN ln -sf /opt/node/bin/npm /usr/bin/npm
