# holo:countdown/start_actual — reads h/m/s from storage
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 2
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

execute store result score #CD_H_IN holo.tmp run data get storage holo:cd h
execute store result score #CD_M_IN holo.tmp run data get storage holo:cd m
execute store result score #CD_S_IN holo.tmp run data get storage holo:cd s
scoreboard players set #D60CD holo.tmp 60
scoreboard players set #D3600CD holo.tmp 3600
scoreboard players operation #CD_TOTAL holo.tmp = #CD_H_IN holo.tmp
scoreboard players operation #CD_TOTAL holo.tmp *= #D3600CD holo.tmp
scoreboard players operation #CD_M_SEC holo.tmp = #CD_M_IN holo.tmp
scoreboard players operation #CD_M_SEC holo.tmp *= #D60CD holo.tmp
scoreboard players operation #CD_TOTAL holo.tmp += #CD_M_SEC holo.tmp
scoreboard players operation #CD_TOTAL holo.tmp += #CD_S_IN holo.tmp
execute if score #CD_TOTAL holo.tmp matches ..0 run tellraw @s {"text":"[Countdown] Duration must be > 0","color":"red"}
execute if score #CD_TOTAL holo.tmp matches ..0 run scoreboard players set #LIVE_MODE holo.state 0
execute if score #CD_TOTAL holo.tmp matches ..0 run return 0

scoreboard players operation #SAVED_COLOR holo.v = #TEXT_COLOR holo.v
scoreboard players operation #SAVED_FS holo.v = #FORCED_SCALE holo.v

function holo:countdown/render_current
schedule function holo:countdown/tick 20t
tellraw @s [{"text":"[Countdown] Started (","color":"aqua"},{"score":{"name":"#CD_TOTAL","objective":"holo.tmp"},"color":"white","bold":true},{"text":" seconds total)","color":"aqua"}]
