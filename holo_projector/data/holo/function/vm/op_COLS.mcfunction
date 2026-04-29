# holo:vm/op_COLS — push screen width
execute store result storage holo:vm t int 1 run scoreboard players get #COLS holo.v
data modify storage holo:vm stack prepend from storage holo:vm t
