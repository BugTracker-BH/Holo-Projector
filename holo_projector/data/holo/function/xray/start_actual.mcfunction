# holo:xray/start_actual — spawn probe, init scan state
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 9
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

kill @e[tag=xray_probe]
execute at @s run summon marker ~ ~ ~ {Tags:["xray_probe"]}

scoreboard players operation #XR_HCOLS holo.v = #COLS holo.v
scoreboard players operation #XR_HCOLS holo.v /= #TWO holo.v
scoreboard players operation #XR_HROWS holo.v = #ROWS holo.v
scoreboard players operation #XR_HROWS holo.v /= #TWO holo.v
scoreboard players set #XRAY_PHASE holo.v 0

tellraw @a [{"text":"[X-Ray] Scanning world. Y-offset: ","color":"aqua"},{"score":{"name":"#XRAY_Y_OFFSET","objective":"holo.v"},"color":"white","bold":true}]
function holo:xray/tick
