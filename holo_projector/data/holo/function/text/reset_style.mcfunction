# holo:text/reset_style — restore default color, scale, spacing
scoreboard players set #TEXT_COLOR holo.v -16711681
scoreboard players set #FORCED_SCALE holo.v 0
scoreboard players set #CHAR_SPACING holo.v 1
scoreboard players set #CHAR_STRIDE holo.v 6
tellraw @s {"text":"[Holo] Text style reset (cyan, adaptive, spacing 1).","color":"aqua"}
