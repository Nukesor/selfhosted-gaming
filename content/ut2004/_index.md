+++
title = "Unreal Tournament 2004"
sort_by = "weight"
date = 2020-07-08

[taxonomies]
tags = ["arena-shooter", "ut2004", "Unreal-Tournament"]
categories = ["fps", "first-person-shooter"]
authors = ["Arne Beer"]
+++

Unreal Tournament 2k4 is a timeless classic arena shooter.
People loved it back in the day and there's still a quite active community and full servers.

It's fast paced, action-packed and fun to play.
Especially on lans or online with your friends.

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

UT2004 can use one of two admin systems. The first is like Unreal Tournament or like most other games, one admin user and password which allows you access to everything. This we will call the basic admin system.

UT2004 also has an XAdmin system which allows you to have multiple user accounts and passwords each with different admin levels. For example, one user could have access to kick but not ban while another user could have access to everything but setting a game password.

First, we will setup the generic options needed for both systems

Find in your UT2004.ini file this section:

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

You may also wish to change ListenPort=80 to annother value. As this will be the port which you run your webserver on

### Basic Admin System

To enable WebAdmin from the command line, for instance, if you only want a single admin user/password combination, add this to your commandline configuration:

```text
?AdminName=XXXX?AdminPassword=XXX
```

### XAdmin System

To enable the Xadmin system find the section `[Engine.GameInfo]` and change the value of `AccessControlClass=` to `XAdmin.AccessControlIni`.

Now start your server and you will notice a new file is created in your system folder called xadmin.ini.
This is where all your admin user/passwords/levels are stored. We strongly recommend you do not edit this file directly but that you set your admins up via webadmin.

Now browser to your server `http://ip-address:port` e.g. `http://192.168.178.78:80` and you will be prompted for a user and password.
This is default set to `Admin/Admin` and it is case sensitive.
You will now be able to access the admins and groups menu on the top right of the screen.

We strongly recommend one of the first things you do is to change the default password.
Also, note that you will have to login via console with your username in the format:

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
