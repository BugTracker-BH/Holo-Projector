scoreboard players set #SNAKE_SIZE_OVERRIDE holo.v 0
tellraw @s {"text":"[Snake] Size: Auto","color":"aqua"}
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/start
