# holo:vm/start_actual — real init
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 8
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

# Reset VM state
data modify storage holo:vm stack set value []
data modify storage holo:vm mem set value [0,0,0,0,0,0,0,0]
scoreboard players set #VM_PC holo.tmp 0
scoreboard players set #VM_HALTED holo.state 0
scoreboard players operation #VM_TX holo.tmp = #COLS holo.v
scoreboard players operation #VM_TX holo.tmp /= #TWO holo.v
scoreboard players operation #VM_TY holo.tmp = #ROWS holo.v
scoreboard players operation #VM_TY holo.tmp /= #TWO holo.v
scoreboard players set #VM_COLOR holo.tmp -1

tellraw @a [{"text":"[HoloScript] Running ","color":"light_purple"},{"nbt":"program_name","storage":"holo:vm","color":"white","bold":true}]
function holo:vm/tick
