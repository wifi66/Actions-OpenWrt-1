#!/bin/bash

cp -f /home/xyz/lede/ARMv8*.config /home/xyz/Actions-OpenWrt/aarch64/

cd /home/xyz/Actions-OpenWrt/
git add ./*
echo -n "now enter commit title:"
read COMMIT
#echo -ne "you entered $COMMIT\n"
git commit -m "$COMMIT"
git commit -a
git push origin master
