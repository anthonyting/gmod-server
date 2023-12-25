#!/bin/bash

set -euo pipefail

cd ~/.local/share/Steam/steamcmd/steam_install_dir/garrysmod

./server-scripts/start.sh <WORKSHOP_COLLECTION_ID> <MAP> <GAMEMODE?>
