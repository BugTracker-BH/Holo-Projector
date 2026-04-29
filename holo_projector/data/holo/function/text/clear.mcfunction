# holo:text/clear — blacken all pixels
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216
scoreboard players set #SCENE holo.state 0
tellraw @s {"text":"[Holo] Pixels cleared.","color":"gray"}
