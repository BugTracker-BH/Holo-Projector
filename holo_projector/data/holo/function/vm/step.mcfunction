# holo:vm/step — fetch + dispatch a single instruction
execute if score #VM_HALTED holo.state matches 1 run return 0
execute store result storage holo:vm pc int 1 run scoreboard players get #VM_PC holo.tmp
function holo:vm/fetch with storage holo:vm
