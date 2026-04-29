# holo:scene/sphere — apply static sphere
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] No screen. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #SCENE holo.state 1
tellraw @s {"text":"[Holo] Rendering static sphere (may take ~1s)...","color":"aqua"}
function holo:render/sphere_static
tellraw @s {"text":"[Holo] Sphere rendered.","color":"green"}
