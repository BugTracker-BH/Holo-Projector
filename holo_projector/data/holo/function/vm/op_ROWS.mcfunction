# holo:vm/op_ROWS — push screen height
execute store result storage holo:vm t int 1 run scoreboard players get #ROWS holo.v
data modify storage holo:vm stack prepend from storage holo:vm t
