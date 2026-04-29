# holo:viz/tick — decay + auto-pulse if jukebox playing
execute unless score #LIVE_MODE holo.state matches 4 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0

scoreboard players add #VIZ_SCAN_CTR holo.tmp 1
execute if score #VIZ_SCAN_CTR holo.tmp matches 5.. run function holo:viz/jukebox_scan
execute if score #VIZ_SCAN_CTR holo.tmp matches 5.. run scoreboard players set #VIZ_SCAN_CTR holo.tmp 0

execute if score #JUKEBOX_ACTIVE holo.state matches 1 run function holo:viz/auto_pulse_tick
execute if score #VIZ_AUTOBEAT holo.state matches 1 run function holo:viz/auto_pulse_tick

scoreboard players set #BI holo.tmp 0
function holo:viz/decay_loop

schedule function holo:viz/tick 2t
