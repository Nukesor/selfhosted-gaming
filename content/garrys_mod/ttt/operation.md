+++
title = "Operating a TTT instance"
weight = 2
#date = 2023-02-20

#[taxonomies]
#tags = ["garrys mod", "trouble in terroristtown", "operation"]
#categories = ["fps", "first-person-shooter", "traitor"]
#authors = ["Arne Beer"]
+++

# Live Configuration

It's possible to easily edit configuration variables, in-game roles and server roles from inside the game!
For this to work, make sure to add the [ULX mod](https://steamcommunity.com/sharedfiles/filedetails/?id=557962280) to your modlist.

The ULX interface allows live-editing of pretty much all configuration variables, assignments and much more.
Just press `F6` to open it, while on the server!

**Disclaimer**
Configuration values that're changed in this way, won't be persisted and reset to the default values or the values from your configuration file.

## Add users to the `superadmin` group

To be able to use the ULX interface, you need admin permissions.
There are two ways to do this, both need **access to the server console**

### While logged in

1. Log onto the server with your normal player account
2. While logged in, connect to the shell where your server instance is running
3. Run `ulx adduser $YOUR_USERNAME superadmin`.
4. You should now be superadmin and access the interface via `F6`.

### Without being logged

1. Find your Steam id. It can be found under `Edit Profile` -> `Custom URL (?)`.
1.1 If you never set a custom ID, right-click on the `Back to your profile` link and copy the link.
1.2 Paste that link somewhere, that long weird string inside the link is your steam id.
1.3 (Your steam ID can also usually be seen in the server log, whenever you connect)
2. Connect to the shell where your server instance is running
3. Run `ulx adduserid $YOUR_STEAM_ID superadmin`.
4. You should now be superadmin and access the interface via `F6`.

## Live commands

### Admin commands

- `ttt_roundrestart` Triggers the round to restart, will go immediately to a new round in the form of a new preparation phase. Also works if cheats are enabled (useful for mapping/development).
- `ttt_print_traitors` Prints who the traitors are.
- `ttt_print_adminreport` Prints who killed who.
- `ttt_print_damagelog` First enable the convar `ttt_log_damage_for_console` (set to 1) to enable damage logging.
    Then use this command to print out the log of the current round. Note that this is a lot of data.
- `ttt_print_usergroups` Prints everyone’s usergroup (admin, superadmin, etc), for debugging Gmod admin status.
- `ttt_highlight_admins` Set to 0 to make admins not appear gold/yellow on the scoreboard.

### General commands

These can be used by anyone during a game. Note that most of these are either already available under a key or are pretty specific. You don’t need any of this to play the game.

- `ttt_version` Prints current version number.
- `ttt_dropweapon` Will drop your current weapon.
    By default the key that would open the GMod spawn menu (default Q) instead performs this action.
    You can manually bind it to other keys using this concommand.
- `ttt_equipswitch` Switches to slot 7 (your special equipment weapon) if you have one.
    If you have that weapon out, it will instead switch to your previous weapon.
    So you can quickly toggle to your equipment and back.
    By default the noclip key (default V) will perform this command if sv_cheats is off (else it will noclip you).
- `ttt_quickslot [slot number]` Switches to the given weapon slot without having to use the scroll menu.
    Switches to previous weapon if you already have the slot's weapon out, so the `ttt_equipswitch` command functions the same as `ttt_quickslot 7`.
- `ttt_toggle_disguise` Toggles your Disguiser equipment if you have bought it as Traitor.
    Default key is Numpad Enter, this command can be used to rebind it.
- `ttt_spectate` Moves you onto the spectator team.
    You will not spawn as Terrorist until you use `ttt_spectate 0` to turn this off again.
    Recommended you use the checkbox in the settings menu under F1 instead.
- `ttt_print_playercount` Prints the number of players that were alive at the start of the round.

These commands are useful when creating a map, rearm script or working on the code.
All of them require `sv_cheats` to be enabled, so they will obviously not work in normal gameplay.

- `ttt_force_terror` Forces you to spawn as a Terrorist. Cheat.
- `ttt_force_traitor` Forces your role to Traitor. Cheat.
- `ttt_force_detective` Forces your role to Detective. Cheat.
- `ttt_cheat_credits` Gives you many equipment credits. Cheat.
