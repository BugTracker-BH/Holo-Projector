# holo:scene/sphere_rot — animated orbiting sphere
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] No screen. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
kill @e[tag=holo_text_overlay]
kill @e[tag=holo_welcome_intro]
kill @e[tag=holo_welcome_prompt]
scoreboard players set #SCENE holo.state 2
scoreboard players set #PARITY holo.state 0
tellraw @s {"text":"[Holo] Scene: rotating sphere.","color":"aqua"}
