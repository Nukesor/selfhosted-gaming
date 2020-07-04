+++
title = "Trouble in Terrorist Town"
sort_by = "date"
insert_anchor_links = "right"
+++

# BACKUP

This is a Backup of the official TTT configuration page.
I'm not the creator of this collection, it simply serves as a backup in case the original project is shut down.

Here is the link to the original page: http://www.troubleinterroristtown.com/config-and-commands/convars

All credits go to the creators of this page!

# Round structure

## Preparation and post-round

`ttt_preptime_seconds `(def. 30):
The length of the preparation phase that occurs after players spawn in and before traitors are selected and a new round begins. Specified in seconds.

`ttt_firstpreptime` (def. 60):
The length of the preparation phase for only the first round after a map loads. It is useful to make this higher than ttt_preptime_seconds so that players do not have to sit out a round just because they loaded slightly too slowly.

`ttt_posttime_seconds` (def. 30):
The length of time after a round has ended before the next preparation phase begins. The round report is displayed at the start of this phase. During this phase, stats/points are no longer tracked.

## Round length

`ttt_haste` (def. 1):
Enables Haste Mode. In Haste Mode, the initial round time is short. Every death increases it by some amount. Puts pressure on traitors to keep things moving, which is more interesting for the innocent players. See below.

`ttt_haste_starting_minutes` (def. 5):
Replaces `ttt_roundtime_minutes` when Haste Mode is on. Sets the initial time limit. (Haste Mode only)

`ttt_haste_minutes_per_death` (def. 0.5):
Specifies the number of minutes that is added to the round time for each death. Setting this to 0.5 will result in 0.5 * 60 = 30 seconds being added. (Haste Mode only)

`ttt_roundtime_minutes` (def. 10):
The time limit for each round, given in minutes, when Haste Mode is disabled.

## Map switching and voting

`ttt_round_limit` (def. 6):
The max number of rounds until the map is switched.

`ttt_time_limit_minutes` (def. 75):
The max number of minutes until the map is switched or a vote is started (see above).

`ttt_always_use_mapcycle` (def. 0):
Enables the use of your `mapcycle.txt` even if voting is enabled. Since GMod 13 no voting exists (at the time of writing), so this does nothing.


# Gameplay

## Traitor and Detective counts

`ttt_traitor_pct` (def. 0.25):
Percentage of total players that will be a traitor. The number of players will be multiplied by this number, and then rounded down. If the result is less than 1 or more than the player count, it is clamped to those values.

`ttt_traitor_max` (def. 32):
Maximum number of traitors. Customize this if you want to fine tune the number of traitors at your server's max player count, for example to make sure there are max 3 traitors on a 16 player server. By default there is basically no max.

`ttt_detective_pct` (def. 0.13):
Percentage of total players that will be a detective (detective innocent). Handled similar to traitor_pct (rounded down etc).

`ttt_detective_max` (def. 32):
Maximum number of detectives. Can be used to cap or disable detectives.

`ttt_detective_min_players` (def. 10):
Minimum number of players before detectives enter play. At lower player counts it will be purely normal innocents vs traitors, at higher ones some innocents will be detective.

`ttt_detective_karma_min` (def. 600):
If a player's Karma falls below this point, his chances of being selected as detective are reduced.

## DNA

`ttt_killer_dna_range` (def. 550):
Maximum range within which a DNA sample of the killer is planted on the corpse of the victim.

`ttt_killer_dna_basetime` (def. 100):
Killer's DNA samples time out depending on how near he was to the victim. After that time has passed, the sample cannot be gathered anymore. This cvar sets the time in seconds when the killer was 0 units away. The time is lower when the range was higher, via a falloff curve. Note that due to the shape of the curve the time can sink below 0 even if the killer is within range according to the ttt_killer_dna_range convar, if the basetime is too low.


## Voice chat battery

`ttt_voice_drain` (def. 0):
Enables the voice chat battery feature. Voice chatting reduces a battery meter, when it's empty the player can't voice chat and must wait a few seconds for it to recharge.

`ttt_voice_drain_normal` (def. 0.2):
Battery drain per tick of voice chat for normal players. "Tick" refers to a game tick, ie. 1/66th of a second.

When full the battery meter is at 100. With the power of math, we can see that the default setting allows you to speak continuously for 100 / (0.2 * 66) = 7.6 seconds before any recharging is needed.

`ttt_voice_drain_admin` (def. 0.05):
Battery drain per tick of voice chat for both admins and Detectives. Set to 0 to allow infinite mic usage.

`ttt_voice_drain_recharge` (def. 0.05):
Battery recharge rate per tick of not voice chatting.


## Other gameplay settings

`ttt_minimum_players` (def. 2):
Number of players that must be present before the round begins. This is checked before the preparation phase starts, and before the actual round begins.

`ttt_postround_dm` (def. 0):
Enables damage after a round has ended. Kills are not recorded for scoring purposes, so it's a free for all.

`ttt_dyingshot` (def. 0):
Experimental. Enables a feature that causes a player who is using his iron sights and is killed (by a gun, and not a head shot) to fire an inaccurate dying shot.

`ttt_no_nade_throw_during_prep` (def. 0):
Prevents the throwing of grenades during the preparation phase.

`ttt_weapon_carrying` (def. 1):
Enables the carrying of weapons with the Magneto-stick. If you are experiencing crashes, try disabling this. When the pickup range is short, as it is by default, crashes seem very rare.

`ttt_weapon_carrying_range` (def. 50):
Range at which weapons can be picked up for carrying with the Magneto-stick, see `ttt_weapon_carrying`.

`ttt_teleport_telefrags` (def. 0):
If 1, the teleporter weapon will kill players standing on the teleport destination. If 0, the teleporter user will instead not be able to teleport if someone is in the way.

`ttt_ragdoll_pinning` (def. 1):
Lets traitors pin corpses to walls using the Magneto-stick. If you are experiencing lag due to the increased physics simulation required due to players moving ragdolls around often, it may be best to disable this.

`ttt_ragdoll_pinning_innocents` (def. 0):
Lets non-traitor players pin corpses as well. Not recommended. Karma

# Karma

`ttt_karma` (def. 1):
Enables the karma system. Players start with a certain amount of karma, and lose it when they damage/kill "teammates" (ie. innocent if they're innocent, traitor if traitor). The amount you lose is dependent on the karma of the person you hurt or killed.

`ttt_karma_strict` (def. 1):
If enabled, the damage penalty increases more quickly as karma goes down. When strict is off, the damage penalty is very low when people stay above 800. Enabling strict mode makes karma play a larger role in discouraging any unnecessary kills, while disabling it results in a more "loose" game where karma only hurts players who constantly teamkill.

`ttt_karma_starting` (def. 1000):
Karma players start out with. If you want players to be able to "earn" a damage bonus, you could set this to 850 or so. Playing clean rounds will let them increase it to a 1000 and do a few percent more damage than a new player.

`ttt_karma_max` (def. 1000):
Maximum karma a player can have. Note that increasing it above 1000 does not mean players with 1100 karma will get a damage bonus. It would just give them a "buffer" before they get a damage penalty.

`ttt_karma_ratio` (def. 0.001):
The ratio of the damage that is used to compute how much of the victim's karma is subtracted from the attacker's. You can make penalties larger by slightly(!) increasing this, to e.g. 0.0015, or smaller by reducing it.

`ttt_karma_kill_penalty` (def. 15):
All karma penalties are based on damage dealt. The kill penalty is just an extra amount of "damage" dealt when you kill someone. So if this was 100, and you head shot someone with a rifle, it would penalize you as if you dealt 200 damage.

`ttt_karma_round_increment` (def. 5):
The base amount by which everyone's karma is "healed" at the end of every round.

`ttt_karma_clean_bonus` (def. 30):
If a player has not hurt or killed a teammate this round, he will be "healed" an extra 30 karma (for a total of 35, under default settings). So if you have bad karma it is rewarding to lie low.

`ttt_karma_traitordmg_ratio` (def. 0.0003):
Like `ttt_karma_rati`o, but for the karma reward for damaging a traitor. By default damaging a traitor is rewarded roughly 1/4th of the penalty you'd get if it were a full-karma innocent.

`ttt_karma_traitorkill_bonus` (def. 40):
Bonus karma for killing a traitor. Scaled by the traitor `dmg_ratio`.

`ttt_karma_low_autokick` (def. 1):
Automatically kick players who get a low karma level at the end of a round.

`ttt_karma_low_amount` (def. 450):
The karma threshold at which players get kicked.

`ttt_karma_low_ban` (def. 1):
When auto-kicking, also ban players if this is enabled. No effect if autokick is off.

`ttt_karma_low_ban_minutes` (def. 60):
Minutes to ban players, 0 should be permanent. Of course has no effect if banning is off.

`ttt_karma_persist` (def. 0):
Stores the karma of a player in persistent storage, at the end of the round or if they disconnect. Then upon reconnection it will be loaded. This means the karma will persist even when the map changes.

`ttt_karma_debugspam` (def. 0):
Enables debug output to console about karma changes.

`ttt_karma_clean_half` (def. 0.25):
When a player's Karma is above the starting level (meaning the karma max has been configured to be higher than that), all his karma increases will be reduced based on how far his karma is above that starting level. So it goes up slower the higher it is.

`This` reduction goes in a curve of exponential decay: initially it's fast, and it slows down as the increment gets smaller. This convar sets at what point the bonus has been halved (so the half-life). With the default value of 0.25, if a the starting amount of karma is 1000 and the max 1500, and a player has karma 1125 ((1500 - 1000) * 0.25 = 125), then his clean round bonus will be 30 / 2 = 15. So to make the bonus go down faster you'd set this convar lower, to make it go down slower you'd increase it towards 1.

# Map-related

`ttt_use_weapon_spawn_scripts` (def. 1):
Toggles whether weapon scripts will be used. These `.txt` files in the /maps/ folder can be used to override or add weapon, ammo and player spawn points in a map. This is very useful for CS:S or HL2DM maps.


# Equipment credits

## Traitor credits

`ttt_credits_starting` (def. 2):
Number of credits traitors start with. Traitors can spend credits on special equipment.

`ttt_credits_award_pct` (def. 0.35):
When this percentage of the innocent players are dead, traitors are awarded more credits.

`ttt_credits_award_size` (def. 1):
The number of credits awarded.

`ttt_credits_award_repeat` (def. 1):
Whether the credit award is handed out multiple times. if for example you set the percentage to 0.25, and enable this, traitors will be awarded credits at 25% killed, 50% killed, and 75% killed.

`ttt_credits_detectivekill` (def. 1):
Number of credits a traitor receives when he kills a detective (detective) player.

## Detective credits

`ttt_det_credits_starting` (def. 1):
Number of credits detective players start with.

`ttt_det_credits_traitorkill` (def. 0):
Number of credits detectives receive when they kill a traitor.

`ttt_det_credits_traitordead` (def. 1):
Number of credits detectives receive when a traitor dies, no matter what killed him.

# Prop possession

`ttt_spec_prop_control` (def. 1):
Toggle whether spectators can possess props.

`ttt_spec_prop_base` (def. 8):
Number of prop punches in a filled punch-o-meter with no score modifier.

`ttt_spec_prop_maxpenalty` (def. -6):
Maximum decrease of the punch-o-meter limit for a negative score.

`ttt_spec_prop_maxbonus` (def. 16):
Maximum increase of the punch-o-meter limit for a positive score.

`ttt_spec_prop_force` (def. 110):
Amount of force by which each punch moves the prop.

`ttt_spec_prop_rechargetime` (def. 1):
Number of seconds for one point in the punch-o-meter to recharge.

# Admin-related

`ttt_idle_limit` (def. 180):
Time in seconds a player is allowed to be idle after a round has started before he is moved to spectator.

`ttt_namechange_kick `(def. 1):
Check for name changes during an active round, and kick players who did one.

`ttt_namechange_bantime` (def. 10):
Time in minutes to ban players who changed their name. Set to 0 to disable.

`ttt_ban_type` (def. autodetect):
Specifies how automatic bans made by TTT (low karma, namechange, etc) should be performed. This lets you specify whether TTT should use an admin plugin to ban, which can then make it easier to remove or adjust those bans using your admin plugin's interface.

Possible settings for this convar:

    - `autodetect` Will detect the Lua-based plugins ULX and Evolve if present, else it will use standard "banid" bans`
    - `ulx` Force the use of ULX/Ulib to ban.
    - `evolve` Force the use of Evolve to ban.
    - `sm` Will use Sourcemod's sm_ban command. Note that SM is not auto-detected.
    - `gmod` Uses standard "banid" to ban.

# Miscellaneous

`ttt_detective_hats` (def. 0):
Enable to make detectives get a special hat. May be buggy.

`ttt_playercolor_mode` (def. 1):
Sets player coloring mode. 0 = off, 1 =  muted/dark colors only, 2 = select from a larger list of colors including brighter ones, 3 = fully random colors.

`ttt_ragdoll_collide` (def. 0):
By default ragdolls will not collide with other ragdolls and some small physics objects (or doors set not to collide with debris). Enabling ragdoll collision will change that. Earlier versions of TTT had ragdoll collision, but this allowed griefers to create situations where ragdolls were physics-glitched to constantly collide, causing serious lag. Some maps may expect ragdolls to collide though. Use with care.

`ttt_bots_are_spectators` (def. 0):
Bots are spawned as spectators and will never be traitor. Useful for sourceTV.

`ttt_debug_preventwin` (def. 0):
Prevents the round from ending, useful for testing on your own, but little else.

`ttt_locational_voice` (def. 0):
Toggles locational 3D voicechat sound for living players.

`ttt_allow_discomb_jump` (def.0):
Enable to make the Discombobulator push force reliable for the thrower. This means you can easily perform discomb jumps, which is fun but exploitable on certain maps.

`ttt_spawn_wave_interval` (def. 0):
If 0, spawns all players at once, and will attempt to rig extra spawnpoints if there are not enough. Can result in players spawning in walls. If larger than 0, spawns players in waves, where each wave spawns as many players as there are spawnpoints. The time between each wave is the value of the convar in seconds, so setting it to 5 will mean waves are 5 seconds apart. Spawn waves are probably the best method for large servers.

IMPORTANT: make sure your ttt_preptime_seconds is large enough to fit all waves in it. Odd behaviour can occur if that is not the case. This spawn method is not widely used and is therefore not as well tested as the standard method.
