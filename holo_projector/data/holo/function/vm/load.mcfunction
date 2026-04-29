# holo:vm/load — initialize VM storage + sine LUT (called from holo:load)
data modify storage holo:vm program set value []
data modify storage holo:vm stack set value []
data modify storage holo:vm mem set value [0,0,0,0,0,0,0,0]
scoreboard players set #VM_PC holo.tmp 0
scoreboard players set #VM_HALTED holo.state 1
scoreboard players set #VM_TX holo.tmp 0
scoreboard players set #VM_TY holo.tmp 0
scoreboard players set #VM_COLOR holo.tmp -1
scoreboard players set #VM_BATCH_MAX holo.v 200
function holo:vm/init_sin_lut
