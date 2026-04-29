scoreboard players set #SNAKE_DIFFICULTY holo.v 2
scoreboard players set #SNAKE_SPEED holo.v 2
tellraw @s {"text":"[Snake] Difficulty: MEDIUM","color":"yellow"}
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/start
