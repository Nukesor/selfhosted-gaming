+++
title = "CS:GO"
sort_by = "weight"
date = 2021-02-10

#[taxonomies]
#tags = ["source", "cs:go", "server-setup"]
#categories = ["fps", "first-person-shooter", "competetive"]
#authors = ["Arne Beer"]
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

