FROM ianblenke/wine

ENV OXIDE_SERVER_OWNER "Default"
ENV OXIDE_SERVER_OWNER_STEAMID="12345678890"
ENV OXIDE_SERVER_HOSTNAME "A new Linux Rust server!"
ENV OXIDE_SERVER_PORT "28015"
ENV OXIDE_RCON_PORT "28017"
ENV OXIDE_SERVER_MAXPLAYERS "100"
ENV OXIDE_RCON_PASSWORD "changeme"
ENV OXIDE_SERVER_VERSION "5369"

RUN apt-get install -y lib32gcc1 libc6 xvfb

# Install SteamCMD
RUN mkdir /steamcmd && mkdir /rust; \
    cd /steamcmd ; \
    curl http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
    | tar -xvz ;\
    ./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous \
    +force_install_dir /rust +app_update 258550 +quit
    
    
