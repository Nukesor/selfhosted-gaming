+++
title = "Garry's Mod"
sort_by = "weight"
+++

Valve's game servers are not known to have the most user friendly interfaces and documentation.
This main article will give you an idea on how to setup up a Garry's Mod server.

Mods and specific game modes have their own section and can be found either via the navigation or our search function.

## Prerequisites

First of all you need to install `steamcmd`.
`steamcmd` is used to install games from the commandline without any kind of visual user interface.

## Installation

1. Create a directory where you want your game server to be. This will be referred to as `$GAME_DIR`.
1. Install the server via `steamcmd`.
   **IMPORTANT:** `$GAME_DIR` has to be the **absolute** path of the directory.

```bash
steamcmd +login anonymous \
    +force_install_dir $GAME_DIR \
    +app_update 4020 validate \
    +quit
```

That's it. This is the basic installation setup for a Garry's Mod server.
If you want to start a specific game mode or mod, please check the specialized guides on the left.

## Configuration of the Server

You can configure any available variable of the game to your liking.
This is done via the file located at `$GAME_DIR/garrysmod/cfg/server.cfg`.

**DISCLAIMER:** Whenever you change something in the configuration file, you have to restart the server for changes to take effect.

The configuration always has the same pattern: `name_of_option value`.

**Example:**

```txt
// Base time per round
ttt_haste_starting_minutes 4

// Percentage of base time gained per kill
ttt_haste_minutes_per_death 0.35

```

Everything that starts with `//` is a comment and solely for giving you some context.
The game completely ignores these lines.

Every mod and game mode brings their own configuration variables.
You therefore might need to do some researching yourself, depending on which kind of workshop content you decide to add.

## Setting up Steam Workshop Collections

It's a really good idea, to either use or create a steam workshop collection.
This way, you have an easy way of adding and removing workshop content via the web interface.
Otherwise you would have to manually download, copy, delete and update your server every time something changes.

Another side-effect is that your friends can easily download your required mods via Steam, which is **at least** a hundred times faster than via Garry's Mod.
Their download speed is excruciatingly slow.

If you still don't want to use workshop collections, please skip to the next sub section.
Otherwise, here's what you have to do:

**1. Get your Steam Web API key**

- Read the section `Optaining an Steam Web API Key` over [here](https://steamcommunity.com/dev)
- Click on `by filling out this form`.
- Fill out the form and get your Web API Key. We'll reference this key as `$STEAM_WEB_API_KEY`

**2. Create a Steam workshop collection.**

- Click on `Community` and select `Workshop`.
- Search for "Garry's Mod".
- Click on `Browse` directly beneath the Garry's Mod Header and select `Collections`.
- Click `Create Collection` on the right.
- You can now add workshop items to your collection

**3. Go to your owned collection page.**

- Go to your steam home page `https://steamcommunity.com/id/YOUR_USERNAME/home/`
- Click on `My workshop` on the right navigation
- Click on `Collections`

**4. Get your workshop collection ID**

- After finding your collections in the last step, select your collection
- Now get the id that's in the URL.
  The URL looks like this `https://steamcommunity.com/sharedfiles/filedetails/?id=2090357275`.
  The Id for this workshop is `2090357275`.
  This Id will be referred to as `$WORKSHOP_ID`.

You are now capable of creating workshop collections.
You could have, for instance, a collection for TTT and another one for Prophunt.

This way you can neatly organize your content depending on your wanted mod

**DISCLAIMER:** Whenever you change something in your workshop collection, you have to restart the server for changes to take effect.
