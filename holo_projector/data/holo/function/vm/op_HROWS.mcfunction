# holo:vm/op_HROWS — push ROWS/2
scoreboard players operation #V_A holo.tmp = #ROWS holo.v
scoreboard players operation #V_A holo.tmp /= #TWO holo.v
execute store result storage holo:vm t int 1 run scoreboard players get #V_A holo.tmp
data modify storage holo:vm stack prepend from storage holo:vm t
