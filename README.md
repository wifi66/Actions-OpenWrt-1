# Actions-OpenWrt

使用GitHub Actions 构建 OpenWrt 镜像 （注：此仓库FOK于 [HoldOnBro](https://github.com/HoldOnBro/Actions-OpenWrt)）

感谢 ***HoldOnBro***、***P3TERX***、***bin20088*** 和 ***8flippy***，这只是他们工作的结合。

发布的固件适用于S9xxx设备、amd64设备。

## How to Use
你需要添加5个（至少第一个）secrets 才能使 Actions 正常工作。

1. **RELEASES_TOKEN**, which should be your Github **Personal Access Token** with at least the *public_repo* checked.
~~2. **DOCKER_USERNAME**(Optional, if you don't need an aarch64 docker img) is your dockerhub username.~~
~~3. **DOCKER_PASSWORD**(Optional, if you don't need an aarch64 docker img) , which is actually not the password for your dockerhub account but the **Access Token** generated from dockerhub Account Settings.~~
4. **Telegram notify secrets**(Optional, but remember to comment out relational action in ymls) , **TELEGRAM_TOKEN** for your bot token and **TELEGRAM_TO** for your personal id. [click here for more information](https://github.com/marketplace/actions/telegram-notify)

[P3TERX大佬写的中文教程|Usage Guide in Chinese](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


## Some Hints

### NetData
  如果 NetData 不能正常工作，以N1为例:

  SSH 进入容器并运行命令 :``chown -R root:root /usr/share/netdata/``

  然后刷新``IP:19999``，它应该可以正常工作了。
  
### IP and Password
  这些设备的默认 IP 可以在与它们关联的 bash scripts（``DEVICE_NAME.sh``）中找到。
  
  默认密码为``password``。
  
### aarch64
~~这些arch有三个版本的固件。~~
  
~~带有 ``NA-`` 前缀的不包含 Acc 应用程序。~~
  
~~命名为 ``S-*`` 的是 SFE 类型，它们速度更快但未经过全面测试，可能存在一些不稳定问题。~~
  
~~还有左边名 ``F-*`` 是flowoffload类型的，稳定但有点慢。~~
  
~~如果您喜欢冒险，请选择 ``S-*`` 类型，或为方便起见使用其他类型。~~