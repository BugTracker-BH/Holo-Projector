# holo:countdown/start — begin countdown
# Usage: /function holo:countdown/start {seconds:10,end_msg:"GO!"}
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Countdown] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
function holo:mode/stop
scoreboard players set #LIVE_MODE holo.state 2
$scoreboard players set #CD_VALUE holo.tmp $(seconds)
$data modify storage holo:cd end_msg set value "$(end_msg)"
function holo:countdown/render_num
schedule function holo:countdown/tick 20t
tellraw @s [{"text":"[Countdown] Started at ","color":"aqua"},{"score":{"name":"#CD_VALUE","objective":"holo.tmp"},"color":"white","bold":true}]
