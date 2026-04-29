# holo:snake/tick — main loop
execute unless score #LIVE_MODE holo.state matches 7 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0

function holo:snake/read_input

# Compute new head
execute store result score #HEAD_X holo.tmp run data get storage holo:snake body[0].x
execute store result score #HEAD_Y holo.tmp run data get storage holo:snake body[0].y
scoreboard players set #DX holo.tmp 0
scoreboard players set #DY holo.tmp 0
execute if score #SNAKE_DIR holo.tmp matches 0 run scoreboard players set #DY holo.tmp -1
execute if score #SNAKE_DIR holo.tmp matches 1 run scoreboard players set #DX holo.tmp 1
execute if score #SNAKE_DIR holo.tmp matches 2 run scoreboard players set #DY holo.tmp 1
execute if score #SNAKE_DIR holo.tmp matches 3 run scoreboard players set #DX holo.tmp -1
scoreboard players operation #NEW_X holo.tmp = #HEAD_X holo.tmp
scoreboard players operation #NEW_X holo.tmp += #DX holo.tmp
scoreboard players operation #NEW_Y holo.tmp = #HEAD_Y holo.tmp
scoreboard players operation #NEW_Y holo.tmp += #DY holo.tmp

# Wall collision
execute if score #NEW_X holo.tmp matches ..-1 run function holo:snake/game_over
execute if score #NEW_X holo.tmp matches ..-1 run return 0
execute if score #NEW_X holo.tmp >= #CELL_COLS holo.v run function holo:snake/game_over
execute if score #NEW_X holo.tmp >= #CELL_COLS holo.v run return 0
execute if score #NEW_Y holo.tmp matches ..-1 run function holo:snake/game_over
execute if score #NEW_Y holo.tmp matches ..-1 run return 0
execute if score #NEW_Y holo.tmp >= #CELL_ROWS holo.v run function holo:snake/game_over
execute if score #NEW_Y holo.tmp >= #CELL_ROWS holo.v run return 0

# Self collision
scoreboard players set #SELF_HIT holo.tmp 0
execute store result storage holo:snake hx int 1 run scoreboard players get #NEW_X holo.tmp
execute store result storage holo:snake hy int 1 run scoreboard players get #NEW_Y holo.tmp
function holo:snake/check_self with storage holo:snake
execute if score #SELF_HIT holo.tmp matches 1 run function holo:snake/game_over
execute if score #SELF_HIT holo.tmp matches 1 run return 0

# Apple check
scoreboard players set #ATE_APPLE holo.tmp 0
execute if score #NEW_X holo.tmp = #APPLE_X holo.tmp if score #NEW_Y holo.tmp = #APPLE_Y holo.tmp run scoreboard players set #ATE_APPLE holo.tmp 1

# Prepend new head
execute store result storage holo:snake nx int 1 run scoreboard players get #NEW_X holo.tmp
execute store result storage holo:snake ny int 1 run scoreboard players get #NEW_Y holo.tmp
function holo:snake/prepend_head with storage holo:snake

# Darken previous head (index 1 now) to body color
execute store result score #FILL_CX holo.tmp run data get storage holo:snake body[1].x
execute store result score #FILL_CY holo.tmp run data get storage holo:snake body[1].y
scoreboard players set #FILL_COLOR holo.tmp -16744448
function holo:snake/fill_cell

# Draw new head (bright green)
scoreboard players operation #FILL_CX holo.tmp = #NEW_X holo.tmp
scoreboard players operation #FILL_CY holo.tmp = #NEW_Y holo.tmp
scoreboard players set #FILL_COLOR holo.tmp -16711936
function holo:snake/fill_cell

# Grow or erase tail
execute if score #ATE_APPLE holo.tmp matches 1 run scoreboard players add #SNAKE_SCORE holo.tmp 1
execute if score #ATE_APPLE holo.tmp matches 1 run function holo:snake/spawn_apple
execute if score #ATE_APPLE holo.tmp matches 1 run function holo:snake/render_apple
execute if score #ATE_APPLE holo.tmp matches 1 run tellraw @a [{"text":"[Snake] Score: ","color":"green"},{"score":{"name":"#SNAKE_SCORE","objective":"holo.tmp"},"color":"white","bold":true}]
execute if score #ATE_APPLE holo.tmp matches 0 run function holo:snake/erase_tail_and_remove

# Reschedule
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/reschedule_tick
