# holo:vm/op_LOAD — push mem[a]
function holo:vm/load_from with storage holo:vm cur
data modify storage holo:vm stack prepend from storage holo:vm t
