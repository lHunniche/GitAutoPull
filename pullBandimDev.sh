#!/bin/bash

cd /home/lklev16/github/Bandim-HDSS-dev/Bandim-HDSS
sudo git reset --hard
sudo git pull "https://lHunniche:pengepung22@github.com/Xrosby/Bandim-HDSS.git" development

sudo chmod u+x webserver/_misc/safe_dump.sh
sudo chmod u+x webserver/_misc/mysql2sqlite
sudo chmod u+x SurveyApplication/gradlew

cd /home/lklev16/github/GitAutoPull
bash build_bandim_react_app.sh /home/lklev16/github/Bandim-HDSS-dev/Bandim-HDSS/bandim-app