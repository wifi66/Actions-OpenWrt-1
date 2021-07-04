# Actions-OpenWrt

Build OpenWrt image using GitHub Actions （注：此仓库FOK于 [HoldOnBro](https://github.com/HoldOnBro/Actions-OpenWrt)）

Credit to ***P3TERX***, ***bin20088*** and ***flippy***，this is just a combination of their work.

The firmwares released are for S9xxx devices, amd64 device.

## How to Use

You need to add 5(at least the first one) secrets to make Actions work properly.

1. **RELEASES_TOKEN**, which should be your Github **Personal Access Token** with at least the *public_repo* checked.
2. **DOCKER_USERNAME**(Optional, if you don't need an aarch64 docker img) is your dockerhub username.
3. **DOCKER_PASSWORD**(Optional, if you don't need an aarch64 docker img) , which is actually not the password for your dockerhub account but the **Access Token** generated from dockerhub Account Settings.
4. **Telegram notify secrets**(Optional, but remember to comment out relational action in ymls) , **TELEGRAM_TOKEN** for your bot token and **TELEGRAM_TO** for your personal id. [click here for more information](https://github.com/marketplace/actions/telegram-notify)

[P3TERX大佬写的中文教程|Usage Guide in Chinese](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


## Some Hints

### NetData
  If NetData doesn't work correctly,

  Take N1 as an example,

  SSH into container and run command :``chown -R root:root /usr/share/netdata/``

  then refresh the ``IP:19999``, it should be working properly.

### IP and Password
  Default IPs for those devices can be found in bash scripts (``DEVICE_NAME.sh``) associated with them.
  
  Password by default is ``password``.
  
### aarch64
~~There are three versions of firmware for this arch.~~
  
~~The ones with ``NA-`` prefix contain No Acc applications.~~
  
  Those named as ``S-*`` are SFE type, they are faster but not fully tested, may have some instability issues.
  
~~And the left ones named as ``F-*`` are flowoffload type, stable but a little bit slower.~~
  
~~Choose ``S-*`` type if you feel adventurous or use the other ones for convenience.~~
