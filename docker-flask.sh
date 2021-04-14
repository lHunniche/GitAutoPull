#!/bin/bash

# pull the latest repo. This is used to build the react js app
cd /home/lklev16/github/Bandim-HDSS
sudo git reset --hard
sudo git pull "https://lHunniche:pengepung22@github.com/Xrosby/Bandim-HDSS.git"


# build the react js app
cd /home/lklev16/github/GitAutoPull
bash build_bandim_react_app.sh /home/lklev16/github/Bandim-HDSS/bandim-app

#this copies the built react app into the docker volume the webserver looks at
cd /home/lklev16/github/Bandim-HDSS-dev/webserver/build
docker run --rm -v $PWD:/source -v react-app:/dest -w /source alpine cp -r * /dest

# finally the new image is pulled down, and run
docker pull hunniche/bandim-flask:1.0
docker run --name flask-master-container -d -p 443:443 -v react-app:/app/build hunniche/bandim-flask:1.0
