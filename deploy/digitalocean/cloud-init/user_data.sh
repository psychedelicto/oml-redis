#!/bin/bash

OMLCOMP=redis
RELEASE=main
OMLDIR=/opt/omnileads/
INSTALL_DOCKER=TRUE

cd /var/tmp
git clone https://github.com/psychedelicto/oml-redis.git
cd oml-redis
git checkout $RELEASE

mkdir -p $OMLDIR/$OMLCOMP
cp ./deploy/common-files/docker-compose.yml $OMLDIR/$OMLCOMP
cp ./deploy/common-files/redis.service /etc/systemd/system

if [[ "$INSTALL_DOCKER" == "TRUE" ]]
then
chmod +x ./deploy/common-files/install_docker.sh
sh ./deploy/common-files/install_docker.sh
fi

cd $OMLDIR/$OMLCOMP
docker-compose up -d
