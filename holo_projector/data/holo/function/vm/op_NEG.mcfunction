# holo:vm/op_NEG — negate top
execute store result score #V_A holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
scoreboard players operation #V_A holo.tmp *= #NEG1 holo.v
execute store result storage holo:vm t int 1 run scoreboard players get #V_A holo.tmp
data modify storage holo:vm stack prepend from storage holo:vm t
