# holo:pong/win — player wins the match (first to 5)
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players operation #SAVED_COLOR_W holo.v = #TEXT_COLOR holo.v
scoreboard players operation #SAVED_FS_W holo.v = #FORCED_SCALE holo.v
scoreboard players set #TEXT_COLOR holo.v -16711936
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "GGS, YOU WON!"
function holo:text/render_from_storage
scoreboard players operation #TEXT_COLOR holo.v = #SAVED_COLOR_W holo.v
scoreboard players operation #FORCED_SCALE holo.v = #SAVED_FS_W holo.v
tellraw @a {"text":"[Pong] You win the match!","color":"green","bold":true}
