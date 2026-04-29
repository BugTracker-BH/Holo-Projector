# holo:vm/plot_at — write pixel at (#X_P, #Y_P) with #VM_COLOR
execute store result storage holo:m px int 1 run scoreboard players get #X_P holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #Y_P holo.tmp
execute store result storage holo:m color int 1 run scoreboard players get #VM_COLOR holo.tmp
function holo:text/set_pixel with storage holo:m
