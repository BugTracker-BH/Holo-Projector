scoreboard players set #SNAKE_DIFFICULTY holo.v 4
scoreboard players set #SNAKE_SPEED holo.v 5
tellraw @s {"text":"[Snake] Difficulty: VERY HARD","color":"red"}
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/start
