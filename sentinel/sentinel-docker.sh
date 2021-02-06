#! /bin/bash

docker pull bladex/sentinel-dashboard

docker run --name sentinel -d -p 8858:8858 -p 8780:8791 --restart=always  bladex/sentinel-dashboard