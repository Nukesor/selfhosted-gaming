+++
title = "Team ArenaMaster"
weight = 2
+++

# Team ArenaMaster

Team ArenaMaster is a great mod for competetive arena experience.

The original mod page can be found over [here](https://www.utzone.de/forum/downloads.php?do=file&id=981).

Here are the creators of this great mod:

- Michael "MaStur" Massey - Project Lead
- Eric "Dizzid" Chavez - Lead Programmer
- Mike "ChaosTheory" Hillard - Sound Effects
- Len "Enigmabyte" Bradley - Graphics
- Steven "AEnubis" Phillips - Support

## Installation

- Download the file from the [original website](https://www.utzone.de/forum/downloads.php?do=file&id=981) or from our [local mirror](3spn_v3.141.7z).
- Delete all previous versions of `*.int`, `*.u`, and `*.ucl` files from `$GAME_DIR\System\` folder.
- Unzip the archive and place all files in the `$GAME_DIR\System\` folder.
- Add these two lines to your `System\UT2004.ini` under their respective category:

```ini
[Engine.GameEngine]
ServerPackages=3SPNv3141
```

```ini
[xVoting.xVotingHandler]
GameConfig=(GameClass="3SPNv3141.TeamArenaMaster",Prefix="DM",Acronym=,GameName="AM",Mutators="None",Options=)
```

## Configuration

- When ingame, type 'menu3spn' into the console to bring up a full list of options and settings.

## Starting the server

When you're finished, the game should now have three additional game modes:

- `3SPNv3141.ArenaMaster`
- `3SPNv3141.TeamArenaMaster`
- `3SPNv3141.Freon`

Simply choose one of them for your `?game` parameter on server startup.
