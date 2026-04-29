# holo:text/display_grow
execute unless entity @e[tag=holo_custom_text,limit=1] run return 0
execute as @e[tag=holo_custom_text,limit=1] store result entity @s transformation.scale[0] float 0.01 run scoreboard players get #WELCOME_SC holo.v
execute as @e[tag=holo_custom_text,limit=1] store result entity @s transformation.scale[1] float 0.01 run scoreboard players get #WELCOME_SC holo.v
data modify entity @e[tag=holo_custom_text,limit=1] start_interpolation set value 0
