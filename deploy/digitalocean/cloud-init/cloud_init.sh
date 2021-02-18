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
cp ../../common-files/docker-compose.yml $OMLDIR/$OMLCOMP
cp ../../common-files/redis.service /etc/systemd/system

if [[ "$INSTALL_DOCKER" == "TRUE" ]]
then
chmod +x ../../common-files/install_docker.sh
sh ../../common-files/install_docker.sh
fi

cd $OMLDIR/$OMLCOMP
docker-compose up -d
