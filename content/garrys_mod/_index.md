+++
title = "Garry's Mod"
sort_by = "date"
insert_anchor_links = "right"
+++

# Garry's Mod


Valve's game servers are know to not be the most user interface friendly ones.
This main article will give you an idea on how to setup up a Garry's Mod server.
Information to specific game modes, as well as configurations and server commands can be found in their respective sub-category.




## Prerequisites

First of all you need to install these prerequisites:

- `steamcmd`


## Installation

1. Create a directory where you want your game server to be. This will be referenced as `$GAME_DIR`.
1. Install the server via `steamcmd`.
   **IMPORTANT:** `$GAME_DIR` has to be the **absolute** path of the directory.
    ```bash
        steamcmd +login anonymous \
            +force_install_dir $GAME_DIR \
            +app_update 4020 validate \
            +quit
    ```


That's it. This is the basic installation setup for a Garry's Mod server.
If you want to start a specific game mode or mod, please check the specialized guides on the left.
