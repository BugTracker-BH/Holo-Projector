# holo:vm/op_DIV — division by zero pushes 0
execute store result score #V_B holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
execute store result score #V_A holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
execute unless score #V_B holo.tmp matches 0 run scoreboard players operation #V_A holo.tmp /= #V_B holo.tmp
execute if score #V_B holo.tmp matches 0 run scoreboard players set #V_A holo.tmp 0
execute store result storage holo:vm t int 1 run scoreboard players get #V_A holo.tmp
data modify storage holo:vm stack prepend from storage holo:vm t
