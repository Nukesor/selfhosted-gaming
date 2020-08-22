+++
title = "General Best Practices"
weight = 1
+++

This page aims to introduce you to some best-practices, when dealing with game servers.  
In the following I'll cover several tools and examples that might help you to maintain your game servers.

## Terminal multiplexer

Most game servers offer an interactive shell, so admins can change stuff on the fly via commandline.
That's why using a service manager such as systemd, is often not the best choice for managing game servers.

However, terminal multiplexer, such as `tmux` or `screen` are super helpful and seem to be the right tool for the job.
They allow you to run commands on your headless server in detached shell.

This means, that you can start the server, exit your current shell session, ssh back onto your server and enter the **same** session you left a few hours ago.

You can still manage your tmux sessions via systemd. Look at the coming sections for examples on how to do this.

<div class="gif" alt="Tmux dedicated game server tutorial example">
    <img src="/best_practices/tmux_demo.gif" style="width:auto;"></img>
</div>

As a result, you have a real shell you can manipulate and interact with.

I highly recommend to take a look at [tmux](https://github.com/tmux/tmux/wiki), which is a very cool tool and easy to use, once you have the basic keyboard shortcuts in mind.

## Helper scripts

I highly recommend to write some helper scripts for your game servers.

Those can be simple bash files, but they'll help you to remove repetitive tasks, such as starting/stopping/updating/creating backups.

<div class="gif" alt="Factorio dedicated server helper bash script">
    <img src="/best_practices/helper_script_demo.gif" style="width:auto;"></img>
</div>

You can take a look at my [personal game scripts](https://github.com/Nukesor/gamescripts/blob/master/bin/factorio.sh), if you would like some inspiration.

## Service files

Depending on your setup, you might use some kind of service manager.

Starting and stopping your servers or _tmux_ sessions via your service manager can do a lot of good.

Depending on the complexity of your setup this includes:

- Game server startup at boot
- Game server shutdown and backup at shutdown of your server
- Regular backups with timers (e.g. _systemd_ timers or _cron_ timers)

It's extremely important to properly shut down game servers, otherwise you risk corruption of your save files!

Regular backups are also a good best practices and very much recommended! Unless you don't mind loosing your 800h Minecraft/Factorio world.

## Server Management Script Example

An full example for such a setup could be this:

`factorio.sh` file. Accepts `startup`, `backup` and `shutdown` as parameters.

```bash
#!/bin/bash
action=$1
tempdir='./temp'
backupdir="./backup/factorio"
gamedir="./games/factorio"

if [ "$action" == "startup" ]; then
    # Early return if there is a running 'factorio' session
    tmux has-session -t factorio
    if [ $? -eq 0 ]; then
        exit
    fi

    # Create the tmux session
    tmux new -d -s factorio

    # Send the command that starts the server to this session and press ENTER
    tmux send -t factorio "${gamedir}/bin/x64/factorio " \
        "--start-server-load-latest " \
        "--server-settings " \
        "${gamedir}/config/server-settings.json" ENTER

elif [ "$action" == "backup" ]; then
    # Create the backup directory and define the backup name from the current date and time
    mkdir -p $backupdir
    timestamp=`date +%Y.%m.%d-%H:%M`
    dest="${backupdir}/${timestamp}.zip"

    # Get the newest factorio save file (autosave)
    newestfile=$(find "${gamedir}/saves" -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ")

    # Copy it to the backup directory
    cp $newestfile $dest
elif [ "$action" == "shutdown" ]; then
    # Check if a tmux session is running
    tmux has-session -t factorio
    if [ $? -eq 0 ]; then
        # Send a CTRL+C to the shell to stop the server
        tmux send-keys -t factorio C-c

        # Sleep a little to give factorio time to save the map
        sleep 10

        # Create a backup
        ./bin/factorio.sh backup

        tmux send-keys -t exit ENTER
    fi
fi
```

`start.sh` file. Responsible for starting the game server sessions

```bash
#!/bin/bash

# Start all games
./factorio.sh startup
./cod4.sh startup
./ut2004.sh startup

exit 0
```

`stop.sh` file. Responsible for starting the game server sessions

```bash
#!/bin/bash

# Stop all games
./factorio.sh startup
./cod4.sh startup
./ut2004.sh startup

# Execute backup for games with some kind of state
./factorio.sh backup

exit 0
```

## Service Manager Example 

This is a _Systemd_ service file.

It does several things:

- It executes the `start.sh` script, as soon as the network connection of the server is up.
- It executes the `stop.sh` script, if the server shuts down or if you tell Systemd to do so.

```text
[Unit]
Description=Start all stop all games
After=syslog.target network.target

[Service]
User=nuke
Type=oneshot
WorkingDirectory=/home/nuke/games
ExecStart=/home/nuke/games/start.sh
ExecStop=/home/nuke/games/stop.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```
