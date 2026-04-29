# holo:vm/op_COLOR — pop int, set VM_COLOR
execute store result score #VM_COLOR holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
