scoreboard players set #SNAKE_SIZE_OVERRIDE holo.v 1
tellraw @s {"text":"[Snake] Size: Small (restart to apply)","color":"aqua"}
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/start
