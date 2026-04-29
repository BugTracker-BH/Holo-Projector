# holo:countdown/start — start countdown with h/m/s
# Usage: /function holo:countdown/start {h:0,m:5,s:30}
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Countdown] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
function holo:mode/stop
scoreboard players set #LIVE_MODE holo.state 2
$scoreboard players set #CD_H_IN holo.tmp $(h)
$scoreboard players set #CD_M_IN holo.tmp $(m)
$scoreboard players set #CD_S_IN holo.tmp $(s)
scoreboard players set #D60CD holo.tmp 60
scoreboard players set #D3600CD holo.tmp 3600
scoreboard players operation #CD_TOTAL holo.tmp = #CD_H_IN holo.tmp
scoreboard players operation #CD_TOTAL holo.tmp *= #D3600CD holo.tmp
scoreboard players operation #CD_M_SEC holo.tmp = #CD_M_IN holo.tmp
scoreboard players operation #CD_M_SEC holo.tmp *= #D60CD holo.tmp
scoreboard players operation #CD_TOTAL holo.tmp += #CD_M_SEC holo.tmp
scoreboard players operation #CD_TOTAL holo.tmp += #CD_S_IN holo.tmp
execute if score #CD_TOTAL holo.tmp matches ..0 run tellraw @s {"text":"[Countdown] Duration must be > 0","color":"red"}
execute if score #CD_TOTAL holo.tmp matches ..0 run return 0

scoreboard players operation #SAVED_COLOR holo.v = #TEXT_COLOR holo.v
scoreboard players operation #SAVED_FS holo.v = #FORCED_SCALE holo.v

function holo:countdown/render_current
schedule function holo:countdown/tick 20t
tellraw @s [{"text":"[Countdown] Started (","color":"aqua"},{"score":{"name":"#CD_TOTAL","objective":"holo.tmp"},"color":"white","bold":true},{"text":" seconds total)","color":"aqua"}]
