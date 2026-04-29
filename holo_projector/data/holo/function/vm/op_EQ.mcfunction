# holo:vm/op_EQ — pop b, pop a, push (a==b ? 1 : 0)
execute store result score #V_B holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
execute store result score #V_A holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
scoreboard players set #V_R holo.tmp 0
execute if score #V_A holo.tmp = #V_B holo.tmp run scoreboard players set #V_R holo.tmp 1
execute store result storage holo:vm t int 1 run scoreboard players get #V_R holo.tmp
data modify storage holo:vm stack prepend from storage holo:vm t
