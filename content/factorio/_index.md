+++
title = "Factorio"
sort_by = "weight"
+++

# Factorio

Factorio's server setup is super straight forward. They offer a free dedicated server download, that's open to everyone.

You can find the download on their [homepage](https://factorio.com/download).

## Installation

1. Create a directory where you want your game server to be. This will be referenced as `$GAME_DIR`.
2. Untar the downloaded archive into this folder.
3. Profit

## Configuration of the Server

The server has a configuration file at `$GAME_DIR/config/server-settings.json`.

There's a `_comment_*` field for pretty much every configuration variable explaining their function.

## Creating a Map

### Creating a Map Locally

In my opinion, the easiest way of creating a map is to create it locally on your client.
This allows you to quickly check the map and verify that all settings are to your likings.

When you're happy with the created map, save the map and copy your local `saves` folder to `$GAME_DIR/saves`.

### Creating a Map via the Cli Interface

The factorio server allows to create a map via the command line as well.

The `--create $FILE` flag is responsible for creating a new map, but also requires the `--map-settings $SETTINGS_FILE` option for configuring the map generation parameters.
Check `$GAME_DIR/bin/x86/factorio --help` for more information and up-to-date explanation of what to do.

## Starting the Server

Starting the server is also very straight forward.

The `--start-server-load-latest` flag tells factorio to take your **newest** save file in the directory.
Make sure that your generated file is the file with the most up-to-date last-change date.

```bash
factorio ${GAME_DIR}/bin/x64/factorio \
    --start-server-load-latest \
    --server-settings ${GAME_DIR}/config/server-settings.json
```
