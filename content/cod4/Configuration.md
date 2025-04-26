+++
title = "Configuration"
weight = 1
+++

## Introduction

Now you've started your very first own Cod4X server, you of course want to configure it.

In general, you can pass arguments to the binary using:

- Adding `+set value_name value` when calling the binary
- Having `set value_name value` set in a configuration file
  That configuration file is then executed via `+exec $path_to_config`

## Configuration

### Startup-only commands

We will call the config file `server.cfg` for now, but this can be anything you want.
Although most variables can be configured in the configuration file, not every variable can.

You will need to specify the following in the startup command:

```
+set dedicated 2
+set sv_punkbuster 0
+set sv_maxclients 12
+map_rotate
```

- `+set dedicated` tells the server if it should run as dedicated or not. 1 = lan, 2 = dedicated
- `+set sv_punkbuster` specifies if Punkbuster anti-cheat should be enabled.
  Since Punkbuster does not support Cod4 anymore, it's recommended to set it at 0.
- `+set sv_maxclients` specifies the maximum amount of players that can connect at the same time.
  This *includes* the private slots specified later on.
- `+map_rotate` tells the server to start the map rotation.
  Although this is not necessarily needed, it won't start a map without it, which prevents player from joining.

### Config file

The location of this config file depends on if you're going to run mods or not.
If you're going to run a server without mods place the config file in `/main`.
If your server *is* going to run mods, place it in `$SERVER_DIR/mods/$modname` instead.

The config file should include the following minimum content (note that `set` is not required here):

```ini
sv_hostname "Servername"

rcon_password "rcon password"
g_password "server password"
sv_privatePassword "private slot passwords"
sv_privateclients "amount of private slots"

sv_floodProtect "1"
sv_reconnectLimit "amount of reconnects allowed per player"

sv_cheats "1"
sv_voice "1"
scr_teambalance "1"
g_allowvote "1"
sv_authorizemode "1"
```

- `sv_hostname` The name of the server that appears in the server list. Colors are supported (note that the ^ is required).
  - ^0 = Black
  - ^1 = Red
  - ^2 = Green
  - ^3 = Yellow
  - ^4 = Blue
  - ^5 = Cyan
  - ^6 = Pink/Magenta
  - ^7 = White
- `rcon_password` Rcon stands for remote connection.
  This allows admin to manage the server from within the game.
  This variable sets the password needed for admins to authenticate.
  It must be **at least** 8 characters long.
- `g_password` A server password.
  If set, requires players to enter a password before they join the server.
  If you don't want this, leave it empty.
- `sv_privatePassword` The password a player needs for private slots.
  Private slots are kept open to allow admins to join even when the server is on it's player limit.
- `sv_privateclients` The amount of slots the server should reserve for admins.
- `sv_floodProtect` **TODO**
- `sv_reconnectLimit` The amount of times a client is allowed to try reconnecing on disconnect or failures
- `sv_cheats` Are cheats enabled or not.
  A cheat could be no-clip, god mode or unlimited ammonution.
- `sv_voice` If voice chat is enabled or not. 1 is on, 0 is off.
- `scr_teambalance` Tells the server if it should try to balance teams if not an even number is in all teams.
- `g_allowvote` Allow the players to vote for maps or not.

Cod4 also has the possibility to load other config files from the current config file.
To do this add `exec configfilename.cfg` somewhere in your config file. I would recommend adding them all either on top or on the bottom to keep your config readable.

## Extra variables by Cod4X

Cod4X adds a few extra variables for more control over your server:

- `sv_modStats` If the server is modded, use seperate player stats (levels, challenges, etc) for the mod or not. Setting this to 0 uses the non-modded stats.
- `sv_authorizemode` Require player authentication. 1 only allows players with legal copies to join, 0 allows cracked players, and -1 allows both types of players while the Activison authentication server is down.
- `sv_showasranked` Show the server as a non-modded server, even if the player has modded servers filtered out
- `sv_statusfile` **TODO**
- `g_friendlyPlayerCanBlock` Will walking into a friendly player block your or not. Settings this to 0 allows a player to walk through his teammates which can help in case of players blocking paths on purpose
- `g_FFAPlayerCanBlock` Same as above, but for FFA. Allow players to walk through enemies or not
- `sv_autodemorecord` **TODO** automatically record demo's of each player for administration purposes
- `sv_demoCompletedCmd` **TODO** run a command after recording of a demo is completed
- `sv_screenshotArrivedCmd` **TODO** run a command after a server-side screenshot is taken
- `sv_mapDownloadCompletedCmd` **TODO** run a command after a map download of a player is complete
- `sv_updatebackendname` **TODO**

## Map and gamemode rotation

After the main part of the server is setup, we require to add a so-called "map rotation". This variable just tells the server what maps to run and with what gamemodes. I would recommend putting this in a seperate config file as it may become very long.

The variable is called `sv_mapRotation` and follows a specific format. First you require to tell the server what gametype to run, for example `gametype dm` (deathmatch, also known as free-for-all).
You can use the following gametypes:

- dm, deathmatch (free-for-all)
- tdm, team deathmatch
- dom, domination
- sd, search and destroy
- koth, king of the hill (headquarters)
- sab, sabotage

Some mods add extra gamemodes. Note that custom maps may not support all gamemodes listed here.

After specifying the gamemode your server is going to be running, you have to tell the server what maps it should rotate through. This is done using `map mp_mapname`. For example `map mp_killhouse`. Place it *after* the gametype, so `gametype dm map mp_killhouse`. If you want more maps just add `map mp_mapname` after what you already have.

You can rotate through multiple gamemodes and maps by first specifying the gamemode, and then the maps that should be run with *that* gamemode. For any extra gamemodes you just add them to the list. An example would be:

```
set sv_mapRotation "gametype dm map mp_backlot map mp_block map mp_broadcast gametype sd map mp_shipment map mp_countdown gametype dom map mp_backlot map mp_shipment"
```

This tells the server to run the gamemode free-for-all with the maps mp_backlot, mp_block and mp_broadcast, the gamemode search and destroy with the maps mp_shipment, mp_countdown, and the gamemode domination with the maps mp_backlot and mp_shipment.

## Plugins

Cod4X (note, not the base game Cod4) allows the use of server-side plugins. **TODO link to "writing a plugin" tutorial**.

After downloading or compiling a plugin, place the files in `serverdirectory/plugins`. For Windows servers you will need `.dll` files, for Linux `.so` files.

You can load individual plugins by using `loadplugin pluginname` in the console (either rcon or on the live server output). The pluginname is the name of the plugin file without the file extension. Of course you can also specify this in a config file upon server startup (which is recommended) by just adding the command.

## Mods

Cod4 also has support for mods. These are written by mod developers in a script language called Codscript. You can only use one of them at the same time.

Place your mods and server config file in `serverdirectory/mods` so you end up with the following file structure:

```
serverdirectory
    /mods
         /modname
             mod.ff
             anyextrafiles.iwd
             server.cfg
```

Load them by adding `set fs_game mods/modname` to **the server launch parameters**.

*Note:* the server config file should be in the mod directory, instead of in `serverdirectory/main`. This is because this way you can use different config files per mod.
