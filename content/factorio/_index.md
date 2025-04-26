+++
title = "Factorio"
sort_by = "weight"
+++

Factorio's server setup is super straight forward. They offer a free dedicated server download, that can be downloaded by everyone.

You can find the download on their [homepage](https://factorio.com/download).

## Installation

1. Pick a directory where you want your game server to be located. This directory will be referred to as`$PARENT_DIR`.
1. You might need to install the `xz` compression utility.
1. Untar the downloaded archive into this folder with `tar -xf factorio_headless_x64_*.tar.xz -C $PARENT_DIR`.
1. Your server should now be located in the `$PARENT_DIR/factorio` directory. The `factorio` directory will be referred to as `$GAME_DIR`.
1. The binary for starting the server is located at `$GAME_DIR/bin/x64/factorio`.

## Server Configuration

The server has a configuration file at `$GAME_DIR/config/server-settings.json`.

There's a `_comment_*` field for pretty much every configuration variable explaining their function.
Since their documentation is this excellent, it

## How to create a Map

### Via the Game Interface

In my opinion, the easiest way of creating a map is to create it locally on your client.
This allows you to quickly check the map and verify that all settings are to your likings.

When you're happy with the created map, save the map and copy your local `saves` folder to `$GAME_DIR/saves`.

### Via the Command Line Interface

The Factorio server is perfectly capable of creating a map as well.

The `--create $FILE` flag is responsible for creating a new map, but also requires the `--map-settings $SETTINGS_FILE` option for configuring the map generation parameters.
Check `$GAME_DIR/bin/x64/factorio --help` for more information and up-to-date explanation of what to do.

## Start the Server

Starting the server is also very straight forward.

The `--start-server-load-latest` flag tells Factorio to take your **newest** save file in the directory.
Make sure that your generated/copied file in the server's `save` folder is the one with the most up-to-date change date.

```bash
factorio $GAME_DIR/bin/x64/factorio \
    --start-server-load-latest \
    --server-settings $GAME_DIR/config/server-settings.json
```
