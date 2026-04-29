# holo:snake/game_over
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players operation #SAVED_COLOR_SG holo.v = #TEXT_COLOR holo.v
scoreboard players operation #SAVED_FS_SG holo.v = #FORCED_SCALE holo.v
scoreboard players set #TEXT_COLOR holo.v -65536
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "GAME OVER"
function holo:text/render_from_storage
scoreboard players operation #TEXT_COLOR holo.v = #SAVED_COLOR_SG holo.v
scoreboard players operation #FORCED_SCALE holo.v = #SAVED_FS_SG holo.v
tellraw @a [{"text":"[Snake] GAME OVER! Score: ","color":"red","bold":true},{"score":{"name":"#SNAKE_SCORE","objective":"holo.tmp"},"color":"white","bold":true}]
