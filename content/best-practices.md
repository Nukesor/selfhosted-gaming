+++
title = "General Best Practices"
weight = 1
+++

# Best Practices

This page aims to introduce you to some best-practices, when dealing with game servers.

In the following I'll cover several tools and examples that might help you to maintain your game servers.


## Terminal multiplexer

Terminal multiplexer, such as `tmux` or `screen` are super helpful.
They allow you to run commands on your headless server in detached shell.

This means, that you can start the server, exit your current shell session, ssh back onto your server and enter the **same** session you left a few hours ago.

As a result, you have a real shell you can manipulate and interact with.

I highly recommend to take a look at [tmux](https://github.com/tmux/tmux/wiki), which is a very cool tool and easy to use, once you have the basic keyboard shortcuts in mind.


## Helper scripts

I highly recommend to write some helper scripts for your game servers.

Those can be simple bash files, but they'll help you to remove repetitive tasks, such as starting/stopping/updating/creating backups.

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
