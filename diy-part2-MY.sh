#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
# Default theme 
sed -i 's/luci-theme-bootstrap/luci-theme-opentomcat/g' feeds/luci/collections/luci/Makefile
# readd cpufreq for aarch64 & Change to system
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
sed -i 's/services/system/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua
# replace coremark.sh with the new one lean目录已无此文件
#rm package/lean/coremark/coremark.sh
#cp $GITHUB_WORKSPACE/general/coremark.sh package/lean/coremark/

# 移除不用软件包
rm -rf feeds/packages/net/smartdns
#rm -rf feeds/packages/net/kcptun
#rm -rf package/lean/luci-theme-argon

# 添加额外软件包
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/linkease/nas-packages.git package/nas
git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
git clone https://github.com/sirpdboy/luci-app-advanced package/luci-app-advanced
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
git clone https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-ipsec-server package/luci-app-ipsec-server
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-pptp-server package/luci-app-pptp-server
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-services-wolplus package/luci-app-services-wolplus
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-fileassistant package/luci-app-fileassistant
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-filebrowser package/luci-app-filebrowser
svn co https://github.com/immortalwrt/packages/trunk/utils/filebrowser package/filebrowser
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-gost package/luci-app-gost
svn co https://github.com/immortalwrt/packages/trunk/net/gost package/gost
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-ssr-mudb-server package/luci-app-ssr-mudb-server
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-syncthing package/luci-app-syncthing0703
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-dnsfilter package/luci-app-dnsfilter
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos package/luci-app-eqos
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash package/luci-app-openclash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/luci-app-smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/smartdns #lean中包含,目录feeds/packages/net
svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns-le package/smartdns-le #未选择

#git clone https://github.com/rufengsuixing/luci-app-autoipsetadder.git package/luci-app-autoipsetadder
#git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
#git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman #未选择
#svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-socat package/luci-app-socat
#git clone https://github.com/jerrykuku/luci-app-ttnode.git package/luci-app-ttnode
#git clone https://github.com/mchome/openwrt-dogcom.git package/openwrt-dogcom #未选择

# 添加vssr
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb #git lua-maxminddb 依赖 vssr

# 添加ssr-plus&passwall 优先：lean>helloworld>xiaorouji
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/kcptun package/kcptun #lean中包含,目录feeds/packages/net,passwall最新,替换无CONFIG_PACKAGE_kcptun-config=y
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/shadowsocksr-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks
svn co https://github.com/fw876/helloworld/trunk/tcping package/tcping #lean中包含,目录package/lean/tcpping,helloworld最新
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
svn co https://github.com/fw876/helloworld/trunk/v2ray-core package/v2ray-core # ssr-plus passwall 都未选则
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/xray-core package/xray-core
svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/xray-plugin

#git clone https://github.com/xiaorouji/openwrt-passwall package/xiaorouji # 与lean重复删除
#rm -rf package/xiaorouji/dns2socks
#rm -rf package/xiaorouji/ipt2socks
#rm -rf package/xiaorouji/microsocks
#rm -rf package/xiaorouji/pdnsd-alt
#rm -rf package/xiaorouji/simple-obfs
#rm -rf package/xiaorouji/tcping
#rm -rf package/xiaorouji/trojan

# 添加argon-config 最新argon v1.x.x 适配18.06和Lean Openwrt
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
svn co https://github.com/jerrykuku/luci-theme-argon/branches/18.06 package/luci-theme-argon

# 添加themes
svn co https://github.com/apollo-ng/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/luci-theme-darkmatter
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argon_new package/luci-theme-argon_new
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial package/luci-theme-atmaterial
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-edge package/luci-theme-edge
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-ifit package/luci-theme-ifit
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentomato package/luci-theme-opentomato
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentomcat package/luci-theme-opentomcat
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentopd package/luci-theme-opentopd

# 添加subweb&subconverter
#svn co https://github.com/immortalwrt/immortalwrt/trunk/package/ctcgfw/subweb package/subweb
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/quickjspp package/quickjspp
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/jpcre2 package/jpcre2
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/libcron/ package/libcron
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/rapidjson package/rapidjson
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/subconverter package/subconverter

# 修改vssr的makefile
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-alt/shadowsocksr-libev-ssr-redir/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-server/shadowsocksr-libev-ssr-server/g' {}

# 修改bypass的makefile
find package/luci-app-bypass/* -maxdepth 8 -path "*" | xargs -i sed -i 's/smartdns-le/smartdns/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

# 修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

./scripts/feeds update -a
./scripts/feeds install -a