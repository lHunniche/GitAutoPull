#!/bin/bash

cd /home/lklev16/github/Bandim-HDSS
sudo git reset --hard
sudo git pull "https://lHunniche:pengepung22@github.com/Xrosby/Bandim-HDSS.git" development

chmod u+x webserver/_misc/safe_dump.sh
chmod u+x webserver/_misc/mysql2sqlite

cd /home/lklev16/github/GitAutoPull
bash build_bandim_react_app.sh /home/lklev16/github/Bandim-HDSS/bandim-app
