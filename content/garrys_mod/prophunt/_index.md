+++
title = "Prophunt"
sort_by = "weight"
insert_anchor_links = "right"
date = 2020-07-01

[taxonomies]
tags = ["garrys mod", "trouble in terroristtown", "hide-and-seek"]
categories = ["fps", "first-person-shooter", "fun"]
authors = ["Arne Beer"]
+++

This section deals with setting up a Garry's Mod server for the game mode _Prophunt_.
Before you start with this setup, please make sure that you followed the installation instruction for Garry's Mod server in the [Garry's Mod](/garrys_mod/) section.

## Installation

Since parts of Prophunt might built upon CS:Source game content, the game might not work properly without downloading and installing these files.

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

I couldn't find any configuration details for Prophunt.

Please create an issue or a pull request, if you can find any information about this.

## Run the Server

For the server to run, you have to know the map name of at least one map that's compatible with prophunt.
Such a map name is for instance `ph_indoorpool`. They usually begin with `ph_`.
This will be referred to as `$MAP_NAME`.

CLI-configuration:

- `usercon` Allows verified users to execute server commands from the client, which is good for ad hoc configuration.

Starting the server with a steam workshop collection:

```bash
cd $GAME_DIR

./srcds_run \
    -game garrysmod \
    -usercon \
    -authkey $STEAM_WEB_API_KEY \
    +gamemode prop_hunt \
    +hostname IN_GAME_THE_SERVER \
    +map $MAP_NAME \
    +host_workshop_collection $WORKSHOP_ID \
```

Starting the server without steam workshop collection:

```bash
cd $GAME_DIR

./srcds_run \
    -game garrysmod \
    -usercon \
    +gamemode prop_hunt \
    +hostname IN_GAME_THE_SERVER  \
    +map $MAP_NAME \
```
