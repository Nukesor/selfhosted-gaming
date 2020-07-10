+++
title = "Trouble in Terrorist Town"
sort_by = "weight"
insert_anchor_links = "right"
date = 2020-06-28

[taxonomies]
tags = ["garrys mod", "trouble in terroristtown"]
categories = ["fps", "first-person-shooter", "fun"]
authors = ["Arne Beer"]
+++


This section deals with setting up a Garry's Mod server for the game mode _Trouble in Terrorist Town_ (TTT).  
Before you start with this setup, please make sure you followed the instructions for [Garry's Mod server](/garrys_mod/).

## Installation

Since TTT builds upon CS:Source game content, the game won't work properly without downloading and installing these files.

1. Go to [this link](https://gmodcontent.com/)
2. Download the `Counter Strike: Source Game Content`.
3. Unzip the downloaded file into `$GAME_DIR/garrys/addons/`
    It should look something like this afterwards.
```text
$GAME_DIR
    └─garrys
        └─addons
            └─css-content-gmodcontent
```

## Configuration

TTT offers some [extensive docs](http://www.troubleinterroristtown.com/config-and-commands/convars) on which variables exist and what they do.  
You can also find a mirror of complete configuration description [over here](@/garrys_mod/ttt/configuration.md).

Many mods and workshop collections bring their own variables for configuration.
You have to read those and inform yourself about the possible configuration options.

## Run the Server

For the server to run, you have to know the map name of at least **one** map that's compatible with TTT.  
An example map name is `ttt_rooftops_a2`. They usually begin with `ttt_`.
This will be referred to as `$MAP_NAME`.

Starting the server with a steam workshop collection:
```bash
cd $GAME_DIR

./srcds_run \
    -game garrysmod \
    -usercon \
    -authkey $STEAM_WEB_API_KEY \
    +gamemode terrortown \
    +hostname IN_GAME_THE_SERVER \
    +map $MAP_NAME \
    +host_workshop_collection $WORKSHOP_ID
```

Starting the server without steam workshop collection:
```bash
cd $GAME_DIR

./srcds_run \
    -game garrysmod \
    -usercon \
    +gamemode terrortown \
    +hostname IN_GAME_THE_SERVER \
    +map $MAP_NAME
```
