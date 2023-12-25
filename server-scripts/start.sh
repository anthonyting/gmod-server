#!/bin/bash

set -euo pipefail

WORKSHOP_COLLECTION_ID=$1
MAP=$2
GAMEMODE="${3:-terrortown}"

cd ~/.local/share/Steam/steamcmd/steam_install_dir

cd garrysmod
git pull
cd ..

COMMAND="./srcds_run +host_workshop_collection $WORKSHOP_COLLECTION_ID -console -game garrysmod +map $MAP -gamemode $GAMEMODE -max_players 50"

echo "$COMMAND"
eval $COMMAND
