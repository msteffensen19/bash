#!/bin/sh
# SETUP

echo "-- Copying .bashrc to user home directory"
cp ~/.bashrc ~/bashrc.orig
dos2unix ./bashrc ./dockerstopall.sh
cp ./bashrc ~/.bashrc

echo "-- Allowing dockerstopall to be executable"
chmod +x ./dockerstopall.sh

echo "-- Removing local git repository"
rm -rf ~/.git

echo "-- Done."
