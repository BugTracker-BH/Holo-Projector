# holo:scene/terrain — animated heightmap (phase shifts with FRAME)
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] No screen. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #SCENE holo.state 4
scoreboard players set #PARITY holo.state 0
tellraw @s {"text":"[Holo] Scene: terrain heightmap.","color":"aqua"}
