#!/bin/bash

wget $(curl -s https://api.github.com/repos/rq1025330/Actions-OpenWrt/releases/latest | grep browser_download_url | cut -d '"' -f 4)
