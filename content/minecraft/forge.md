+++
title = "Mods with Forge"
weight = 2
#date = 2020-08-28

#[taxonomies]
#tags = ["minecraft", "modding", "server", "forge"]
#categories = ["open-world"]
#authors = ["Arne Beer"]
+++

Running Minecraft with your own mods on a headless server can be super nice.

This allows you to add some quality-of-life mods.

## Installation

First of all, make sure to complete the setup of the vanilla Minecraft server and start the server at least once. \
You can also do this installation on any existing Minecraft server.

**However**, make a backup first, just to be sure!

1. Download the [Forge Installer](https://files.minecraftforge.net/maven/net/minecraftforge/forge/index_1.16.2.html) to your `$GAME_DIR. **Make sure to pick the installer for your Minecraft version**.
2. Run the installer with `java -jar  forge-*-installer.jar --installServer`. This will install everything.

## Get Mods

Forge is now installed and you can add your mods.

1. Create the `$GAME_DIR/mods` folder.
2. Download all of your mods. **Be careful that the mod is for the correct minecraft version.** Some mods also come with support for another mod loader. Be sure to pick the _Forge_ version.
3. Copy those mod files into the `$GAME_DIR/mods` folder.

## Start the Server

Just call the `forge-$version.jar` as if you would call the original Minecraft server jar.

```
java -Xmx1024M -Xms1024M -jar minecraft_server.1.16.5.jar nogui 
```

## How To Install Mods

1. Download the mod's `*.jar` file.
2. Copy the `*.jar` file to the `$GAME_DIR/mods/` directory

## List of Useful (Server-Side only) Mods

- [Morpheus](https://www.curseforge.com/minecraft/mc-mods/morpheus/) Only a percentage of all users need to lie in Beds for the next day to begin.
- [FallingTree](https://www.curseforge.com/minecraft/mc-mods/falling-tree) Instant Tree feller.
- [SimpleHarvest](https://www.curseforge.com/minecraft/mc-mods/simpleharvest) Instant right click harvesting.
