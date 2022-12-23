# Setup Details

## SteamCMD

### Packages probably needed

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install mailutils util-linux tmux lib32gcc1 libstdc++6 \
libstdc++6:i386 libcurl4-gnutls-dev:i386 \
lib32gcc1 lib32gcc1 libstdc++6 libstdc++6:i386 \
libcurl4-gnutls-dev:i386 libbz2-1.0:i386 libcurl4 \
```

`sudo apt install steamcmd`

Then, run `steamcmd`

Games are installed in `~/.steam/steamcmd/steam_install_dir` using `force_install_dir ./steam_install_dir`

Then, `login anonymous`

## Garry's Mod

For GMOD, install gmod with `app_update 4020 validate`

For CSS, install CSS dedicated server with `app_update 232330 validate`

IMPORTANT: reinstall GMOD with `app_update 4020 validate`

Start server with `server-scripts/start.sh`

```bash
#!/bin/bash
set -euo pipefail

WORKSHOP_COLLECTION_ID=
MAP=

~/.steam/steamcmd/steam_install_dir/garrysmod/server-scripts/start.sh $WORKSHOP_COLLECTION_ID $MAP
```

Run on the server:
`ulx adduser <steam_account_name> superadmin`

## Updating List of Workshop Items

1. Navigate to the workshop collection link
2. Run `server-scripts/workshop.js` to copy workshop ids, then update workshop.lua

## Dynamic DNS

Enable dynamic dns in DNS configuration and get the dynamic dns password. Then:

`sudo apt install ddclient`

`sudo vim /etc/ddclient.conf`

```ini
protocol=namecheap
use=web, web=dynamicdns.park-your-domain.com/getip
server=dynamicdns.park-your-domain.com
login=<domain_name.ca>
password='<insert_dynamic_dns_password>'
gmod
```
