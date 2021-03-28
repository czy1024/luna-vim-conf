#!/bin/bash
docker pull sonatype/nexus3

docker run -d -p 8081:8081 --name nexus sonatype/nexus3

sudo docker cp nexus:/nexus-data   ~/nexus-data

sudo chown -R 200 ~/nexus-data

docker stop nexus

docker rm nexus

docker run -d \
    -p 8081:8081 \
    --name nexus \
    --privileged=true \
    --restart always \
    -v ~/nexus-data:/nexus-data  \
    sonatype/nexus3
