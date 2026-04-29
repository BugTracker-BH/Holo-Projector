# holo:vm/op_JNZ — pop; if nonzero, jump to a
execute store result score #V_A holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
execute unless score #V_A holo.tmp matches 0 run function holo:vm/jmp_to with storage holo:vm cur
