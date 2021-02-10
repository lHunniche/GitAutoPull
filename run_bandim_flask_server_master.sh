#!/bin/bash

cd /root/github/Bandim-HDSS-master/Bandim-HDSS/webserver
. ./venv/bin/activate
pip3 install -r ./_misc/requirements.txt
python server.py -m

