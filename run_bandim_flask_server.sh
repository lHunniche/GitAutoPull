#!/bin/bash

cd /root/github/Bandim-HDSS/webserver
. ./venv/bin/activate
pip3 install -r ./_misc/requirements.txt
python server.py -d
# -d : for development branch (runs with SSL on port 5000)
# -p/-m : for master branch (runs with SSL on port 443, and has debug mode disabled)
