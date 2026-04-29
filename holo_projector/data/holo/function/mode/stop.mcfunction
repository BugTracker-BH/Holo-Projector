# holo:mode/stop — stop any running live mode and clear the screen
scoreboard players set #LIVE_MODE holo.state 0
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216
