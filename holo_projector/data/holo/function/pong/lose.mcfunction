# holo:pong/lose — CPU wins the match
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players operation #SAVED_COLOR_L holo.v = #TEXT_COLOR holo.v
scoreboard players operation #SAVED_FS_L holo.v = #FORCED_SCALE holo.v
scoreboard players set #TEXT_COLOR holo.v -65536
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "GGS, I WIN!"
function holo:text/render_from_storage
scoreboard players operation #TEXT_COLOR holo.v = #SAVED_COLOR_L holo.v
scoreboard players operation #FORCED_SCALE holo.v = #SAVED_FS_L holo.v
tellraw @a {"text":"[Pong] CPU wins the match!","color":"red","bold":true}
