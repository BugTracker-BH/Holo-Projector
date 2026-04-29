# holo:vm/fetch — macro: read program[pc] into cur, advance PC, dispatch
# Fallback value in case PC is past end of program (then nothing modifies cur → HALT triggers)
data modify storage holo:vm cur set value {o:"HALT"}
$data modify storage holo:vm cur set from storage holo:vm program[$(pc)]
scoreboard players add #VM_PC holo.tmp 1
function holo:vm/dispatch with storage holo:vm cur
