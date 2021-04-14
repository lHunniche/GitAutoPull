#!/bin/bash

# pull the latest repo. This is used to build the react js app
cd /home/lklev16/github/Bandim-HDSS
sudo git reset --hard
sudo git pull "https://lHunniche:pengepung22@github.com/Xrosby/Bandim-HDSS.git"


# build the react js app
cd /home/lklev16/github/GitAutoPull
bash build_bandim_react_app.sh /home/lklev16/github/Bandim-HDSS/bandim-app

#this copies the built react app into the docker volume the webserver looks at
cd /home/lklev16/github/Bandim-HDSS/webserver/build
docker run --rm -v $PWD:/source -v react-app:/dest -w /source alpine cp -r * /dest

# finally the new image is pulled down, and run
docker pull hunniche/bandim-flask:1.0
CONTAINER=flask-master-container # name of the container we will be checking/starting

if [[ $(docker ps | grep $CONTAINER) ]]; then
    docker stop $CONTAINER
    docker rm $CONTAINER
    docker run --name $CONTAINER -d -p 443:443 -v react-app:/app/build hunniche/bandim-flask:1.0
fi

docker run --name $CONTAINER --network="host" -d -p 443:443 -v react-app:/app/build hunniche/bandim-flask:1.0
