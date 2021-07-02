#!/bin/bash

wget $(curl -s https://api.github.com/repos/rq1025330/Actions-OpenWrt/releases/45591339 | grep browser_download_url | cut -d '"' -f 4)
