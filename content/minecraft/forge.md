+++
title = "Mods with Forge"
weight = 2
date = 2020-08-28

[taxonomies]
tags = ["minecraft", "modding", "server", "forge"]
categories = ["open-world"]
authors = ["Arne Beer"]
+++

Running minecraft with your own mods on a headless server can be super nice.

This allows you to add some quality-of-life mods, such as [Morpheus](https://www.curseforge.com/minecraft/mc-mods/morpheus/).

## Installation

First of all, make sure to complete the setup of the vanilla Minecraft server and start the server once.

You can also do this installation on any existing minecraft server of your own without problems.

**However**, make a backup first, just to be sure!

1. Download the [Forge Installer](https://files.minecraftforge.net/maven/net/minecraftforge/forge/index_1.16.2.html) to your `$GAME_DIR. **Make sure to pick the Minecraft right version**.
1. Run the installer with `java -jar  forge-*-installer.jar --installServer`. This will install everything.

## Get Mods

Forge is now installed and you can add your mods.

1. Create the `$GAME_DIR/mods` folder.
2. Download all of your mods. **Be careful that the mod is for the correct minecraft version.** Some mods also come with support for another mod loader. Be sure to pick the _Forge_ version.
3. Copy those mod files into the `$GAME_DIR/mods` folder.

## Start the Server

Starting the server is now only a simple task of calling
