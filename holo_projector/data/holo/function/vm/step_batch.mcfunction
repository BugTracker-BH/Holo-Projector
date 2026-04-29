# holo:vm/step_batch — recursive batched stepper
execute if score #VM_HALTED holo.state matches 1 run return 0
execute if score #VM_BATCH holo.tmp >= #VM_BATCH_MAX holo.v run return 0
function holo:vm/step
scoreboard players add #VM_BATCH holo.tmp 1
function holo:vm/step_batch
