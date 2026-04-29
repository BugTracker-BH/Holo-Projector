# holo:pong/render_ball — draw ball at (#PB_X, #PB_Y) in white
execute store result storage holo:m px int 1 run scoreboard players get #PB_X holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #PB_Y holo.tmp
data modify storage holo:m color set value -1
function holo:text/set_pixel with storage holo:m
