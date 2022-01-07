# Setup Details

## SteamCMD

`sudo apt install steamcmd`

Some more 32 bit packages are needed as well.

Then, run `steamcmd`

Games are installed in `~/.steam/steamcmd/steam_install_dir` using `force_install_dir ./steam_install_dir`

Then, `login anonymous`

## Garry's Mod

For GMOD, install gmod with `app_update 4020 validate`

For CSS, install CSS dedicated server with `app_update 232330 validate`

Then, uncomment the game in cfg/mount.cfg with the path to the folder of those games (`~/.steam/steamcmd/steam_install_dir/game`)

Copy server.cfg with preferred settings (including password)
Copy autoexec.cfg with preferred settings (including gamemode)

Start server with (located in the `force_install_dir` path, so `~/.steam/steamcmd/steam_install_dir`):
`./srcds_run +host_workshop_collection <workshop_collection_id> -authkey <auth_key> -console -game garrysmod +map 5cplazaNov14 +max_players 50`

Run on the server:
`ulx adduser <steam_account_name> superadmin`

## Updating List of Workshop Items

1. Navigate to the workshop collection link
2. Run this to copy workshop ids, then update workshop.lua:

```javascript
ignore = new Set(["ulx", "ulib", "server"]);

await navigator.clipboard.writeText(
  Array.from(document.querySelectorAll(".workshopItemTitle"))
    .map((i) => {
      const url = i.parentNode.href;
      if (url && !ignore.has(i.textContent.toLowerCase())) {
        return new URLSearchParams(new URL(url).search).get("id");
      }
      return null;
    })
    .filter((i) => i)
    .map((j) => `resource.AddWorkshop(${j})`)
    .join("\n")
);
```

## Dynamic DNS

Enable dynamic dns in DNS configuration and get the dynamic dns password. Then:

`sudo apt install ddclient`

`sudo vim /etc/ddclient.conf`

```ini
protocol=namecheap
use=web, web=dynamicdns.park-your-domain.com/getip
server=dynamicdns.park-your-domain.com
login=<domain_name.ca>
password=<insert_dynamic_dns_password>
<host (e.g: @, www, ...)>
```
