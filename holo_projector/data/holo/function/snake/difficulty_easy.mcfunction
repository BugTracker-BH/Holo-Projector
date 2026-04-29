scoreboard players set #SNAKE_DIFFICULTY holo.v 1
scoreboard players set #SNAKE_SPEED holo.v 1
tellraw @s {"text":"[Snake] Difficulty: EASY","color":"green"}
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/start
