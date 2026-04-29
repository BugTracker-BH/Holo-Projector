# holo:vm/op_GOTO — pop y, pop x, set turtle
execute store result score #VM_TY holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
execute store result score #VM_TX holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
