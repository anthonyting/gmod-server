# Setup Details

## Easy mode (docker in WSL2)

0. Install [docker desktop](https://docs.docker.com/desktop/setup/install/windows-install/)

1. Run `docker-compose up --build`

2. Make sure your 27015 and 27005 ports are forwarded for TCP and UDP

3. Connect to the WSL 2 VM IP address

## Hard mode (manual)

#### Packages

0. Prereqs

- https://developer.valvesoftware.com/wiki/SteamCMD#Debian-Based_Distributions_.28Ubuntu.2C_Mint.2C_etc..29

1. Install packages

```bash
sudo add-apt-repository multivers
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steamcmd
```

2. Start `steamcmd` to verify it works

```bash
steamcmd
quit
```

## Garry's Mod

1. Install gmod and cs source

```bash
steamcmd +runscript /home/$USER/.local/share/Steam/steamcmd/steam_install_dir/garrysmod/server-scripts/update-gmod-ds.txt
```

> Note: Games should be installed in `~/.local/share/Steam/steamcmd/steam_install_dir`. If they are not, find it with `cd ~ && find -name garrysmod`

2. Install packages needed to run the server

```bash
sudo apt update
sudo apt install libncurses5:i386 tmux
```

3. Start server in tmux

```bash
tmux new-session -s gmod-server
```

> Note: quit server with `quit`

4. Give admin to a user after they are connected

```bash
ulx adduser <steam_account_name> superadmin
```

## Updating List of Workshop Items

1. Navigate to the workshop collection link
2. Run `server-scripts/workshop.js` to copy workshop ids, then update `lua/autorun/server/workshop.lua`

## Nginx

```bash
sudo apt install nginx
sudo cp server-scripts/gmod.conf /etc/nginx/sites-available/gmod.conf
sudo ln -s /etc/nginx/sites-available/gmod.conf /etc/nginx/sites-enabled/gmod.conf
sudo systemctl reload nginx
```

## Dynamic DNS

Enable dynamic dns in DNS configuration and get the dynamic dns password. Then:

```bash
sudo apt install ddclient
sudo vim /etc/ddclient.conf
```

```ini
protocol=namecheap
use=web, web=dynamicdns.park-your-domain.com/getip
server=dynamicdns.park-your-domain.com
login=<domain_name.ca>
password='<insert_dynamic_dns_password>'
gmod
```

## In WSL

1. Enable Hyper-V optional features and restart computer
2. Go to Hyper-V Manager and create an external network switch in Action -> Virtual Switch Manager
  - Use your computer's network switch
3. Edit `~/.wslconfig` on Windows machine

```ini
[wsl2]
memory=24GB  
processors=12
networkingMode=bridged
vmSwitch=<name of bridge you created>
```

> Note: maybe need to add dhcp false?

3. Restart wsl

```
wsl --shutdown
wsl
```

4. Assign a new IP address

```bash
sudo ip addr flush eth0
sudo dhclient eth0
```

5. Verify IP address for eth0 is correct for the subnet

```bash
ip -a
```
