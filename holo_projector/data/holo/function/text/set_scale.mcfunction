# holo:text/set_scale — set forced text scale (0 = adaptive/auto-fit)
# Usage: /function holo:text/set_scale {scale:3}
$scoreboard players set #FORCED_SCALE holo.v $(scale)
execute if score #FORCED_SCALE holo.v matches ..-1 run scoreboard players set #FORCED_SCALE holo.v 0
execute if score #FORCED_SCALE holo.v matches 21.. run scoreboard players set #FORCED_SCALE holo.v 20
execute if score #FORCED_SCALE holo.v matches 0 run tellraw @s {"text":"[Holo] Text scale: Adaptive (auto-fit)","color":"aqua"}
execute if score #FORCED_SCALE holo.v matches 1.. run tellraw @s [{"text":"[Holo] Text scale forced to ","color":"aqua"},{"score":{"name":"#FORCED_SCALE","objective":"holo.v"},"color":"white","bold":true}]
execute if score #FORCED_SCALE holo.v matches 7.. run tellraw @s {"text":"[Holo] Warning: large scale restricts chars-per-line and may overflow on smaller projectors. Reset with /function holo:text/reset_style","color":"yellow"}
