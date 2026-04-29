execute if score #RY_I holo.tmp >= #RH holo.tmp run return 0
scoreboard players set #RX_I holo.tmp 0
function holo:pong/fill_rect_row
scoreboard players add #RY_I holo.tmp 1
function holo:pong/fill_rect_loop
