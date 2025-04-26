+++
title = "CS:GO"
sort_by = "weight"
+++

This section should help you to get a CS:GO Server up and running in no time.

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
    +app_update 740 validate \
    +quit
```

That's it. This is the basic installation setup for a CS:GO server.
If you want to start a specific game mode or mod, please check the specialized guides on the left.

## Trouble Shooting

### `ibgcc_s.so.1: version GCC_7.0.0' not found`

If this error shows up, go to your `$GAME_DIR` and delete the `bin/libgcc_s.so.1` file.
The shipped version is older than your actual system version.

### `sdk32/steamclient.so` cannot be found

On some linux installations, the steamclient library isn't placed at the correct position, or rather CS:GO looks in the wrong place.

In my case, it was enough to symlink "~/.steam/steamcmd/linux32/steamclient.so" to "~/.steam/sdk32/steamclient.so".
