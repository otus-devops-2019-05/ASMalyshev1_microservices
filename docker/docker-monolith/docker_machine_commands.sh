#!/bin/sh

export GOOGLE_PROJECT=docker-254217
docker-machine create --driver google \
 --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntuos-cloud/global/images/family/ubuntu-1604-lts \
 --google-machine-type n1-standard-1 \
 --google-zone europe-west1-b \
 docker-host

docker-machine ls
eval $(docker-machine env docker-host)
