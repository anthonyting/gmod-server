#!/bin/bash

set -euo pipefail

WORKSHOP_COLLECTION_ID=$1
MAP=$2

cd ~/.steam/steamcmd/steam_install_dir

cd garrysmod
git pull
cd ..

./srcds_run +host_workshop_collection $WORKSHOP_COLLECTION_ID -console -game garrysmod +map $MAP -gamemode terrortown -max_players 50
