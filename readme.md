# How to use

## Make a Dockerfile
```
FROM ubuntu:latest
MAINTAINER Jan Sanchez, joejansanchez@gmail.com

RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  && rm -rf /var/lib/apt/lists/*

ENV NODE_VERSION 6.9.5
ENV NODE_ARCH x64

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.xz /tmp/
RUN tar -xJf /tmp/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.xz -C /opt/ && rm /tmp/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.xz

RUN mkdir -p /opt/
RUN mv /opt/node-v$NODE_VERSION-linux-$NODE_ARCH /opt/node

RUN ln -sf /opt/node/bin/node /usr/bin/node
RUN ln -sf /opt/node/bin/npm /usr/bin/npm
```

## Build docker image of Ubuntu + Node
```
docker build -t jansanchez/node-ubuntu .
```

## Run docker image of Ubuntu + Node in a container
```
docker run -it -d jansanchez/node-ubuntu
```

## To go inside the last created container
```
docker exec -it $(docker ps | grep "node" | cut -c1-12) /bin/bash
```

## Kill the last created container
```
docker kill $(docker ps | grep "node" | cut -c1-12)
```

# Other Commands


## list docker images
```
docker images
```

## Build an image
```
docker build -t {newImageName} .
```

## Run a Docker image
```
docker run -p {clientPort}:{serverPort} -d {imageName}
```

## Remove a container
```
docker rm {containerName}
```

## Remove an docker image
```
docker rmi {imageName}
```

## List docker containers
```
docker ps
```

## To go inside the container
```
docker exec -it {containerID} /bin/bash
```

## Kill one or more running containers
```
docker kill {containerID}
```
