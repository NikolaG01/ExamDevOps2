#!/bin/bash
echo "* Install Python3 ..." 
apt-get update -y && apt-get install -y python3 python3-pip
echo "* Install Python docker module ..."
pip3 install docker