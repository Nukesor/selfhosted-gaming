+++
title = "Unreal Tournament 2004"
sort_by = "weight"
date = 2020-07-08

[taxonomies]
tags = ["arena-shooter", "ut2004", "Unreal-Tournament"]
categories = ["fps", "first-person-shooter"]
authors = ["Arne Beer"]
+++

Unreal Tournament 2004 is a timeless classic arena shooter.
People loved it back in the day and there's still a quite active community and full servers.

It's fast paced, action-packed and fun to play.
Especially on LANs or online with your friends.

The server setup however can be a little tricky.

## Prerequisites

First of all you need to install these prerequisites:

- `lib32-libstdc++5`

## Installation

1. Download the dedicated server version of UT2004 from [fileplanet](https://www.fileplanet.com/archive/p-18877/Unreal-Tournament-2004-Server-v3186) or the locally [mirrored file](https://github.com/Nukesor/selfhosted-gaming/releases/download/ut2004/DedicatedServer3339-BonusPack.zip).  
    The original software has been developed by Epic Games & Digital Extremes. The license included in the archive allows to "... exchange the Server-Only Software at no charge among other end-users and distribute them to others over the Internet, ...".
1. Create a new folder, where you want the game installed.
1. Unzip the downloaded archive into this folder.
1. You now need to get a Server CD Key for your Server. Go to this [website](https://www.epicgames.com/unrealtournament/forums/cdkey.php?2004) and request a new server CD key.

## Starting the Server

The server is started via the `ucc-bin` binary.

The first parameter is the name of the map in combination with all game configuration parameters, which are added using the pattern `?name=value`.

E.g. `"DM-Asbestos?game=XGame.xCTFGame?modifier=BonusPack.MutCrateCombo"`.

The full command looks like this:

``` bash
./ucc-bin server \
    "DM-Asbestos?game=XGame.xCTFGame?modifier=BonusPack.MutCrateCombo" \
    ini=UT2004.ini \
    -nohomedir
```

## Configuration

### Map Names

You can find all available map names in the `$GAME_DIR\System\UT2004.ini` file.
There's a list of maps for each game mode.

The following is the list for all maps of the game mode `DeathMatch`:

```ini
[XInterface.MapListDeathMatch]
Maps=DM-RRAJIGAR
Maps=DM-RANKIN
Maps=DM-DE-GRENDELKEEP
Maps=DM-DE-IRONIC
Maps=DM-DE-OSIRIS2
Maps=DM-GESTALT
Maps=DM-IRONDEITY
Maps=DM-METALLURGY
Maps=DM-Compressed
...
...
```

### Game Modes

The current game mode is specified with the `?game=value` parameter. E.g. `?game=Onslaught.ONSOnslaughtGame`

This is the official list of game modes:

- `BonusPack.xLastManStandingGame`
- `BonusPack.xMutantGame`
- `Onslaught.ONSOnslaughtGame`
- `SkaarjPack.Invasion`
- `UT2k4Assault.ASGameInfo`
- `XGame.xBombingRun`
- `XGame.xCTFGame`
- `XGame.xDeathMatch`
- `XGame.xDoubleDom`
- `XGame.xTeamGame`
- `XGame.xVehicleCTFGame`
- `XGame.InstagibCTF`

### Modifiers

Modifiers can be added by adding `?modifier=MODIFIER_NAME` to the command.
Multiple modifiers can be added this way.

This is the official list of modifiers:

- `BonusPack.MutCrateCombo` Bonus Combos
- `Onslaught.MutBigWheels` BigWheels
- `Onslaught.MutLightweightVehicles` Lightweight Vehicles
- `Onslaught.MutOnslaughtWeapons` Onslaught Weapons
- `Onslaught.MutWheeledVehicleStunts` Stunt Vehicles
- `OnslaughtFull.MutVehicleArena` Vehicle Arena
- `UTClassic.MutUTClassic` UT Classic
- `UTClassic.MutUseLightning` Lightning Guns
- `UTClassic.MutUseSniper` Sniper Rifles
- `UTV2004s.utvMutator` UTV2004S
- `UnrealGame.MutBerserk` Super Berserk
- `UnrealGame.MutBigHead` BigHead
- `UnrealGame.MutGameSpeed` Game Speed
- `UnrealGame.MutLowGrav` LowGrav
- `UnrealGame.MutMovementModifier` Air Control
- `XGame.MutFastWeapSwitch` UT2003 Style
- `XGame.MutInstaGib` InstaGib
- `XGame.MutNoAdrenaline` No Adrenaline
- `XGame.MutQuadJump` QuadJump
- `XGame.MutRegen` Regeneration
- `XGame.MutSlomoDeath` Slow Motion Corpses
- `XGame.MutSpeciesStats` Species Statistics
- `XGame.MutUDamageReward` UDamage Reward
- `XGame.MutVampire` Vampire
- `XGame.MutZoomInstagib` Zoom InstaGib
- `XWeapons.MutArena` Arena
- `XWeapons.MutNoSuperWeapon` No SuperWeapons

### Setting up UT2004 Webadmin System

UT2004's Webadmin supports to modes.

**Basic mode:**  
A single admin user who has access to everything and can change every aspect of the server.

**XAdmin System:**  
UT2004 also has an advanced system, called XAdmin, which allows you to have multiple user accounts and passwords.
Each user has it's own permissions.
For instance, one user could have access to kick but not ban, while another user could have access to do everything except setting the server password.


First of all, we will setup the necessary options for both systems.

Find this section in your `$GAME_DIR/System/UT2004.ini` file:

```ini
[UWeb.WebServer]
Applications[0]=xWebAdmin.UTServerAdmin
ApplicationPaths[0]=/ServerAdmin
Applications[1]=xWebAdmin.UTImageServer
ApplicationPaths[1]=/images
bEnabled=False
ListenPort=80
```

Change `bEnabled=False` to `True`

You may also wish to change ListenPort=80 to another value, as this will be the port the XAdmin webserver will be served.

### Basic Admin System

A simple WebAdmin setup can be desirable, if you only want a single admin on your server.
To enable WebAdmin from the command line, add this to your commandline configuration:

```text
?AdminName=XXXX?AdminPassword=XXX
```

### XAdmin System

To fully enable the Xadmin system, find the section `[Engine.GameInfo]` and change the value of `AccessControlClass=` to `XAdmin.AccessControlIni`.
Afterwards, restart your server.

You might notice a new file is created in your system folder called `xadmin.ini`.
This is where all your admin user/passwords/levels are stored.

**It's highly recommended to not edit this file directly, but rather add your admins via the webadmin interface.**

You can now open the web admin interface of your server with `http://ip-address:port` e.g. `http://192.168.178.78:80`
You will be prompted for a user and password.

The default is set to `Admin/Admin`, which is **case sensitive**!
You should now be able to access the admin and groups menu on the top right of the website.

The first thing you have to do, is to change the default password to a secure password!

When logging in via the in-game console, you will have use the format:
```text
adminlogin user password
```


### Full example command

``` bash
./ucc-bin server \
    "DM-Asbestos?game=XGame.xDeathMatch?AdminName=your_name?AdminPassword=your_pass?modifier=XGame.MutRegen \
    ini=UT2004.ini \
    -nohomedir
```
