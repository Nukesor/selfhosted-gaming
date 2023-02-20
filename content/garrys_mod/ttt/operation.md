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
