#!/bin/bash

mkdir -p /proxmark3

# Do an initial git clone if /proxmark3/git doesn't contain a git repo
[ ! -d /proxmark3/git/.git ] && git clone https://github.com/RfidResearchGroup/proxmark3.git /proxmark3/git

# Cleanup source dir and pull latest
cd /proxmark3/git
make clean
git pull -u origin master
