# holo:vm/op_STORE — pop, write to mem[a]
execute store result score #V_A holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
execute store result storage holo:vm t int 1 run scoreboard players get #V_A holo.tmp
function holo:vm/store_to with storage holo:vm cur
