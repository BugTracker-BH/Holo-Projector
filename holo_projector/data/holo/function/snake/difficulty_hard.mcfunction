scoreboard players set #SNAKE_DIFFICULTY holo.v 3
scoreboard players set #SNAKE_SPEED holo.v 3
tellraw @s {"text":"[Snake] Difficulty: HARD","color":"gold"}
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/start
