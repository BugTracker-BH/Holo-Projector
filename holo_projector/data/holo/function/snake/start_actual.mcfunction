# holo:snake/start_actual
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 7

# Cell size based on projector + override
scoreboard players set #CELL_SIZE holo.v 2
execute if score #COLS holo.v matches 64..95 run scoreboard players set #CELL_SIZE holo.v 3
execute if score #COLS holo.v matches 96..127 run scoreboard players set #CELL_SIZE holo.v 4
execute if score #COLS holo.v matches 128.. run scoreboard players set #CELL_SIZE holo.v 5
execute if score #SNAKE_SIZE_OVERRIDE holo.v matches 1 run function holo:snake/apply_small
execute if score #SNAKE_SIZE_OVERRIDE holo.v matches 2 run function holo:snake/apply_medium
execute if score #SNAKE_SIZE_OVERRIDE holo.v matches 3 run function holo:snake/apply_large
execute if score #SNAKE_SIZE_OVERRIDE holo.v matches 4 run function holo:snake/apply_xl

scoreboard players operation #CELL_COLS holo.v = #COLS holo.v
scoreboard players operation #CELL_COLS holo.v /= #CELL_SIZE holo.v
scoreboard players operation #CELL_ROWS holo.v = #ROWS holo.v
scoreboard players operation #CELL_ROWS holo.v /= #CELL_SIZE holo.v

# Tick interval from speed
scoreboard players set #SNAKE_TICK holo.v 6
execute if score #SNAKE_SPEED holo.v matches 1 run scoreboard players set #SNAKE_TICK holo.v 10
execute if score #SNAKE_SPEED holo.v matches 2 run scoreboard players set #SNAKE_TICK holo.v 6
execute if score #SNAKE_SPEED holo.v matches 3 run scoreboard players set #SNAKE_TICK holo.v 4
execute if score #SNAKE_SPEED holo.v matches 4 run scoreboard players set #SNAKE_TICK holo.v 3
execute if score #SNAKE_SPEED holo.v matches 5 run scoreboard players set #SNAKE_TICK holo.v 2

# Clear screen
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

# Initial body in middle, 3 segments moving right
scoreboard players operation #INIT_X holo.tmp = #CELL_COLS holo.v
scoreboard players operation #INIT_X holo.tmp /= #TWO holo.v
scoreboard players operation #INIT_Y holo.tmp = #CELL_ROWS holo.v
scoreboard players operation #INIT_Y holo.tmp /= #TWO holo.v
data modify storage holo:snake body set value []
function holo:snake/init_body

scoreboard players set #SNAKE_DIR holo.tmp 1
scoreboard players set #SNAKE_SCORE holo.tmp 0

# Spawn first apple
function holo:snake/spawn_apple

# Initial render
function holo:snake/render_body
function holo:snake/render_apple

# Status msg
execute if score #SNAKE_DIFFICULTY holo.v matches 1 run tellraw @a {"text":"[Snake] Difficulty: EASY","color":"green"}
execute if score #SNAKE_DIFFICULTY holo.v matches 2 run tellraw @a {"text":"[Snake] Difficulty: MEDIUM","color":"yellow"}
execute if score #SNAKE_DIFFICULTY holo.v matches 3 run tellraw @a {"text":"[Snake] Difficulty: HARD","color":"gold"}
execute if score #SNAKE_DIFFICULTY holo.v matches 4 run tellraw @a {"text":"[Snake] Difficulty: VERY HARD","color":"red"}
execute if score #INPUT_MODE holo.v matches 0 run tellraw @a {"text":"[Snake] Control: Camera (look around)","color":"aqua"}
execute if score #INPUT_MODE holo.v matches 1 run tellraw @a {"text":"[Snake] Control: Hotbar slots 1-4 (Up/Right/Down/Left)","color":"aqua"}

# Start tick loop
execute store result storage holo:snake dt int 1 run scoreboard players get #SNAKE_TICK holo.v
function holo:snake/reschedule with storage holo:snake
