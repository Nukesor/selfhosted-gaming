+++
title = "Server commands"
weight = 2
date = 2021-02-11

#[taxonomies]
#tags = ["source", "cs:go", "server-setup"]
#categories = ["fps", "first-person-shooter", "competetive"]
#authors = ["Arne Beer"]
+++


First of all, enable the console in the CS:GO game settings. \
Afterwards, you can open the console via the `~` key.

## Team commands

- `mp_limitteams 0` Removes team limits. \
    This lets you have as many players as you want on one team.
- `mp_autoteambalance 0` Turns off automatic team balance.

## Round commands

- `mp_roundtime 60` Maximum roundtime set to 60 minutes.
- `mp_roundtime_defuse 60` Another command for roundtime, which you need to use when playing `de_*` maps
- `mp_freezetime 0` No freezetime in the beginning of each round.
- `mp_warmuptime 10` Set the warmup time to 10 seconds.
- `mp_warmup_end` End warmup.
- `mp_endwarmup_player_count 4` Stops warmup, when there're at least 5 players on the server.
- `mp_restartgame 1` The server will restart the game after 1 second.

## Kills/Bans

- `removeallids` Unban all people
- ``

## Bot commands

Bot's don't work in `competetive` and `wingman` mode.
They'll just stay around and do nothing at spawn.

- `bot_kick` Kicks all bots.
- `bot_quota $amount` The maximum number of bots your server is allowed to have at any given time.
- `bot_add_t` Adds a bot in the Terrorist team.
- `bot_add_ct` Adds a bot in the Counter-Terrorist team.

## Map commands

- `map [name] [gamemode]` Use this console command to instantly change the map you're currently playing to a different map.

#### Map names

- Cache: `de_cache`
- Dust II: `de_dust2`
- Mirage: `de_mirage`
- Overpass: `de_overpass`
- Nuke: `de_nuke`
- Inferno: `de_inferno`
- Train: `de_train`
- Cobblestone: `de_cbble`
- Canals: `de_canals`
- Subzero: `de_subzero`
- Shortdust: `de_shortdust`
- Shortnuke: `de_shortnuke`
- Agency: `cs_agency`
- Assault: `cs_assault`
- Italy: `cs_italy`
- Office: `cs_office`
- Austria: `de_austria`
- Biome: `de_biome`
- Baggage: `ar_baggage`
- Lake: `de_lake`
- Monastery: `ar_monastery`
- Safehouse: `de_safehouse`
- Shoots: `ar_shoots`
- St Marc: `de_stmarc`
- Bank: `de_bank`
- Sugarcane: `de_sugarcane`
- Dizzy: `ar_dizzy`
- Rialto: `gd_rialto`

#### Game modes

- Casual (default): `casual`
- Competitive/Scrimmage: `competitive`
- Wingman `scrimcomp2v2`
- Weapon Expert: `scrimcomp5v5`
- Arms Race: `armsrace` or `gungameprogressive`
- Demolition: `demolition` or `gungametrbomb`
- Deathmatch: `deathmatch`
- Training: `training`
- Guardian: `guardian` or `cooperative`
- Co-op Strike: `coop` `coopstrike` `coopmission`
- Skirmish: `skirmish`
- Danger Zone: `survival`

## Fun commands

- `mp_maxmoney 99999` Sets maximum money to 99 999 instead of 16 000
- `mp_startmoney 99999` Your starting money will be set to 99 999
- `mp_buytime 9999` Increases the buytime so you don’t need to worry about it.
- `mp_buy_anywhere 1` You can open the buy menu and buy from anywhere on the map.
- `sv_infinite_ammo 1` Gives you infinite ammo and no reload. If you’re going to practice spray control, you might want to set this to sv_infinite_ammo 2. This way you will have to reload but still have infinite ammo.
- `ammo_grenade_limit_total 5` Increasese grenade slots so that you can have all grenade types.

## Training/Debug

- `sv_cheats 1` Enables “cheats”. Required for a lot of different practice commands.
- `sv_showimpacts 1` Show bullet impacts, this can help when practicing spray control.
- `sv_showimpacts_time 10` Sets the time the bullet impacts are shown. In this case 10 seconds.
- `sv_showimpacts_penetration 1` Useful for testing wall bangs. Will show you if the bullets go through, how much damage they’d do, the travel distance and what material you’re shooting through.
- `sv_grenade_trajectory 1` Shows a trajectory when you throw grenades. Especially useful when practicing different grenades. Doesn’t work on dedicated servers.
- `sv_grenade_trajectory_time 10` Sets the time the trajectories are shown. In this case 10 seconds
