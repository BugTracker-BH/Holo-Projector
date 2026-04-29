# holo:scene/test — apply test pattern
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] No screen. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #SCENE holo.state 0
function holo:render/test_pattern
tellraw @s {"text":"[Holo] Scene: test pattern.","color":"aqua"}
