+++
title = "Minecraft"
sort_by = "weight"
date = 2020-07-10

[taxonomies]
tags = ["minecraft", "gaming", "server", "self-hosted"]
categories = ["open-world"]
authors = ["Arne Beer"]
+++

I guess nobody needs an introduction to Minecraft.

Running a vanilla Minecraft server is surprisingly easy.
Pretty much everything you need is a relatively modern Java Runtime Environment.

## Installation

1. Install Java, so you can run the `java -h` command on your command line.
1. Go to Minecraft's official [server download website](https://www.minecraft.net/en-us/download/server/)
1. Create the directory where you want your Minecraft server to live in.
    This will be referred to as `$GAME_DIR`.
1. Copy the `server.jar` into `$GAME_DIR`.

## Start the Server

Before you can actually use or configure the server, you need to start it once.
This initializes some crucial files, such as the `eula.txt` and the server configuration file `server.properties`.

To start the server, go into `$GAME_DIR` and run this command:

```bash
java -Xmx1024M -Xms1024M -jar server.jar nogui
```

Explanation of parameters:

- `-Xmx` This is the maximum amount of RAM your Minecraft server is allowed to use.
        For a normal vanilla world 1GB (1024M) should be enough.
        If you're running into problems, try increasing it, but there's no need to always increase this value.
- `-Xms` This is the amount of allocated RAM the Server starts with and the minimum of RAM the Server will allocate.
        It's recommended to set this to the same value as `Xmx`.
        This results in the Server ALWAYS using a fix amount of RAM, but also might speed up your server.
- `server.jar` This is the server file you previously downloaded.
- `nogui` Since this will most likely run on headless server, you have to specify `nogui`.
        The server will otherwise try to open a graphical user interface.

To be able to run the server, you need to accept the end-user license agreement.
To do so, open the generated `eula.txt`. It should look something like this:

```text
#By changing the setting below to TRUE you ...
#Fri Jul 10 15:22:48 CEST 2020
eula=false
```

To accept to their terms, update the `eula` value in this file to `eula=true`.

When running the command again, the server should now start up and create a new world.

## Server Configuration

Minecraft offers a configuration file named `server.properties`.

A detailed description on every option can be found on the [minecraft wiki](https://minecraft.gamepedia.com/Server.properties#Java_Edition_3).

However, the most important variables for setting up the server will be cover over here as well.

### Operational

- `server-ip` Leave blank, if you want to serve your server on all interfaces.
    If you want to only serve from specific interface, specify the IP of that interface.
- `server-port` The port your server accepts connections from.
    Default is `25565`.
    If you change it to another value than `25565`, you'll have to specify the port on the client when adding the server via address. \
    This might look something like this: `ip_address:port`, e.g. `192.168.178.45:25566`.
- `white-list` A white list specifies a list of users that's allowed to connect.
    **ONLY** these specified users can connect to the server, if this is set to `true`.
    However, administrator (OPs) are always white-listed.
- `max-players` The maximum amount of concurrent users.
- `level-name` This is the name of the folder your world will be stored in. Default is `world`.
- `online-mode` If set to `true` the server will query Mojang and only allow users with verified accounts to connect to your server.
    If you have friends with cracked Minecraft versions, set this to `false`.
- `motd` The name of the server that will be shown to your clients.

### Gameplay

- `level-seed` In case you want to play a specific world, enter your seed before starting the server and agreeing to the `eula`.
    If you already created a world, either delete the existing world folder (default name is `world`) or change the `level-name` parameter.
- `gamemode` Either a `survival`, `creative`, `adventure` or `spectator`.
- `view-distance` The radius of chunks a user can load. Has a direct impact on player's viewing distance.

### Whitelisting

If you enabled whitelisting on your server, only whitelisted users will be able to connect.
To add a user to your whitelist, start the server and add them via the server cli interface with `/whitelist add USERNAME`.

You can also enable/disable the whitelist on the live server with `/whitelist on/off`.

Whenever you add/remove a user to/from the whitelist, the `$GAME_DIR/whitelist.json` file will be automatically updated.
