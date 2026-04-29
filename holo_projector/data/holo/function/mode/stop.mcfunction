# holo:mode/stop — immediate stop + clear (no transition)
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players set #PENDING_MODE holo.state 0
scoreboard players set #TRANSITIONING holo.state 0
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216
