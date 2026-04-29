# holo:text/set_spacing — set inter-character spacing (gap at scale 1)
# Usage: /function holo:text/set_spacing {spacing:2}
$scoreboard players set #CHAR_SPACING holo.v $(spacing)
execute if score #CHAR_SPACING holo.v matches ..-1 run scoreboard players set #CHAR_SPACING holo.v 0
execute if score #CHAR_SPACING holo.v matches 11.. run scoreboard players set #CHAR_SPACING holo.v 10
scoreboard players operation #CHAR_STRIDE holo.v = #CHAR_SPACING holo.v
scoreboard players add #CHAR_STRIDE holo.v 5
tellraw @s [{"text":"[Holo] Char spacing: ","color":"aqua"},{"score":{"name":"#CHAR_SPACING","objective":"holo.v"},"color":"white","bold":true},{"text":" (stride ","color":"dark_gray"},{"score":{"name":"#CHAR_STRIDE","objective":"holo.v"},"color":"gray"},{"text":")","color":"dark_gray"}]
execute if score #CHAR_SPACING holo.v matches 4.. run tellraw @s {"text":"[Holo] Warning: wide spacing reduces chars-per-line. Combined with large scale, messages may error. Reset with /function holo:text/reset_style","color":"yellow"}
