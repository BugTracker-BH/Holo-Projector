execute if score #PAD_I holo.tmp >= #PADDLE_H holo.v run return 0
scoreboard players operation #PX_T holo.tmp = #PAD_X_IN holo.tmp
scoreboard players operation #PY_T holo.tmp = #PAD_Y_IN holo.tmp
scoreboard players operation #PY_T holo.tmp += #PAD_I holo.tmp
execute store result storage holo:m px int 1 run scoreboard players get #PX_T holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #PY_T holo.tmp
execute store result storage holo:m color int 1 run scoreboard players get #PAD_COLOR_IN holo.tmp
function holo:text/set_pixel with storage holo:m
scoreboard players add #PAD_I holo.tmp 1
function holo:pong/paddle_pixel_loop
