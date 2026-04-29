# holo:vm/tick — main loop; runs up to VM_BATCH_MAX ops then yields
execute unless score #LIVE_MODE holo.state matches 8 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #VM_BATCH holo.tmp 0
function holo:vm/step_batch
execute if score #VM_HALTED holo.state matches 1 run return 0
schedule function holo:vm/tick 1t
