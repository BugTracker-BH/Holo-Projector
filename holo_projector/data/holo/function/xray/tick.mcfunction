# holo:xray/tick — main loop: tp probe, scan current phase rows, advance phase, reschedule
execute unless score #LIVE_MODE holo.state matches 9 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute unless entity @e[tag=xray_probe,limit=1] run return 0

execute as @e[tag=xray_probe] run tp @s @p
execute as @e[tag=xray_probe] at @s run function holo:xray/apply_y_offset

scoreboard players operation #XR_PHASE holo.tmp = #XRAY_PHASE holo.v
scoreboard players set #XR_R holo.tmp 0
function holo:xray/scan_rows

scoreboard players add #XRAY_PHASE holo.v 1
scoreboard players set #XR_D4 holo.tmp 4
scoreboard players operation #XRAY_PHASE holo.v %= #XR_D4 holo.tmp

schedule function holo:xray/tick 2t
