+++
title = "Trouble in Terrorist Town"
sort_by = "date"
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

## Configuration and Workshop Items

This section will deal with the configuration of the server and will probably take up the most of the setup time.

Furthermore, it's a really good idea, to either use or create a steam workshop collection.
This way, you have an easy way of adding and removing workshop content via the web interface.

Otherwise you would have to manually download, copy, delete and update your server every time something changes.

Another side-effect is that your friends can easily download your required mods via Steam, which is at least a **HUNDRED** times faster than via Garry's Mod.
Their download speed is excruciatingly slow.

If you still don't want to use workshop collections, please skip the next sub section.

### Setting up Steam Workshop Collections

1. Get your Steam Web API key.
    - Read the section `Optaining an Steam Web API Key` over [here](https://steamcommunity.com/dev)
    - Click on `by filling out this form`.
    - Fill out the form and get your Web API Key. We'll reference this key as `$STEAM_WEB_API_KEY`

1. Create a Steam workshop collection.
    - Click on `Community` and select `Workshop`.
    - Search for "Garry's Mod".
    - Click on `Browse` directly beneath the Garry's Mod Header and select `Collections`.
    - Click `Create Collection` on the right.
    - You can now add workshop items to your collection

1. You can find your own collections like this:
    - Go to your home (`https://steamcommunity.com/id/YOUR_USERNAME/home/`
    - Click on `My workshop` on the right navigation
    - Click on `Collections`

1. Get your workshop collection ID
    - After finding your collections in the last step, select your collection
    - Now get the id that's in the URL. 
        The URL looks like this `https://steamcommunity.com/sharedfiles/filedetails/?id=2090357275`.
        The id for this workshop ID is `2090357275`.
        This ID will be referenced as `$WORKSHOP_ID`.

With this you can now create workshop collections.
You could have, for instance, a collection for TTT and another one for Prophunt.
This way you can neatly organize your content and all your friends 


### Configuration of the Server.

You can configure any available variable of the game to your liking.
This is done via the file located at `$GAME_DIR/garrysmod/cfg/server.cfg`.

The configuration always has the same pattern: `name_of_option value`.
```txt
// Base time per round
ttt_haste_starting_minutes 4

// Percentage of base time gained per kill
ttt_haste_minutes_per_death 0.35

// Preparation time each round
ttt_preptime_seconds 15

// Preparation time when changing to a new map
ttt_firstpreptime 30

// Time after each round
ttt_posttime_seconds 10

// ttt_roundinfo_pre_announce_distribution: Show user role distribution. Used for TTT2 Round Info
ttt_roundinfo_pre_announce_distribution 0
```

Everything that starts with `//` is a comment and solely for giving you some context.
The game completely ignores these lines.


TTT offers some [extensive docs](http://www.troubleinterroristtown.com/config-and-commands/convars) on which variables exist and what they do.


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
    -net_port_try 1 \
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
    -net_port_try 1 \
    +gamemode terrortown \
    +hostname THIS_IS_THE_SERVER_NAME_THATS_DISPLAYED_IN_GAME  \
    +map $MAP_NAME \
```
