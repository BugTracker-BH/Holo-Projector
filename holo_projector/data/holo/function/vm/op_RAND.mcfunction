# holo:vm/op_RAND — pop n, push random 0..n-1 (n<=1 pushes 0)
execute store result score #V_B holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
scoreboard players set #V_A holo.tmp 0
execute if score #V_B holo.tmp matches 2.. store result score #V_A holo.tmp run random value 0 2147483646
execute if score #V_B holo.tmp matches 2.. run scoreboard players operation #V_A holo.tmp %= #V_B holo.tmp
execute store result storage holo:vm t int 1 run scoreboard players get #V_A holo.tmp
data modify storage holo:vm stack prepend from storage holo:vm t
