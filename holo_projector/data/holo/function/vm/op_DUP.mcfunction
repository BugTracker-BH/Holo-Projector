# holo:vm/op_DUP — duplicate top of stack
execute store result storage holo:vm t int 1 run data get storage holo:vm stack[0]
data modify storage holo:vm stack prepend from storage holo:vm t
