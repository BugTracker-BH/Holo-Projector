# holo:vm/stop
scoreboard players set #VM_HALTED holo.state 1
function holo:mode/stop
tellraw @s {"text":"[HoloScript] Stopped.","color":"gray"}
