FROM cm2network/steamcmd

COPY ./server-scripts /server-scripts

RUN /home/steam/steamcmd/steamcmd.sh +runscript /server-scripts/update-gmod-ds.txt

COPY ./cfg /home/steam/steamcmd/steam_install_dir/garrysmod/cfg
COPY ./data /home/steam/steamcmd/steam_install_dir/garrysmod/data
COPY ./lua /home/steam/steamcmd/steam_install_dir/garrysmod/lua

WORKDIR /home/steam/steamcmd/steam_install_dir

CMD ./srcds_run +host_workshop_collection $WORKSHOP_COLLECTION_ID -console -game garrysmod +map $MAP -gamemode $GAMEMODE -max_players 50
