+++
title = "Trouble in Terrorist Town"
sort_by = "weight"
insert_anchor_links = "right"
+++


# Trouble in Terrorist Town


This section deals with setting up a Garry's Mod server for the game mode _Trouble in Terrorist Town_ (TTT).


## Prerequisites

Follow the installation instruction for Garry's Mod server in the [Garry's Mod section](/garrys_mod/).

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

You can find a mirror of this site on the left in the navigation menu.

Many mods and workshop collections bring their own variables for configuration.
You have to read those and inform yourself about the possible configuration options.

## Run the Server

For the server to run, you have to know the map name of at least one map that's compatible with TTT.
Such a map name is for instance `ttt_rooftops_a2`. They usually begin with `ttt_`.
This will be referenced as `$MAP_NAME`.

Starting the server with a steam workshop collection:
```bash
cd $GAME_DIR

./srcds_run \
    -game garrysmod \
    -usercon \
    -authkey $STEAM_WEB_API_KEY \
    +gamemode terrortown \
    +hostname THIS_IS_THE_SERVER_NAME_THATS_DISPLAYED_IN_GAME \
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
    +hostname THIS_IS_THE_SERVER_NAME_THATS_DISPLAYED_IN_GAME  \
    +map $MAP_NAME \
```
