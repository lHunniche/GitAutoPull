#!/bin/bash

cd /home/lklev16/github/Bandim-HDSS-dev
sudo git reset --hard
sudo git pull "https://lHunniche:pengepung22@github.com/Xrosby/Bandim-HDSS.git" development

sudo chmod u+x webserver/_misc/safe_dump.sh
sudo chmod u+x webserver/_misc/mysql2sqlite
sudo chmod u+x SurveyApplication/gradlew

cd /home/lklev16/github/GitAutoPull
bash build_bandim_react_app.sh /home/lklev16/github/Bandim-HDSS-dev/bandim-app

#cd /home/lklev16/github/Bandim-HDSS-dev/webserver/build

# this line copies the built react app into the docker volume the webserver looks at
#docker run --rm -v $PWD:/source -v react-app-dev:/dest -w /source alpine cp -r * /dest
