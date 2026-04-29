# holo:snake/set_speed — speed 1 (slow) to 5 (fast)
$scoreboard players set #SNAKE_SPEED holo.v $(level)
execute if score #SNAKE_SPEED holo.v matches ..0 run scoreboard players set #SNAKE_SPEED holo.v 1
execute if score #SNAKE_SPEED holo.v matches 6.. run scoreboard players set #SNAKE_SPEED holo.v 5
tellraw @s [{"text":"[Snake] Speed: ","color":"aqua"},{"score":{"name":"#SNAKE_SPEED","objective":"holo.v"},"color":"white","bold":true}]
execute if score #LIVE_MODE holo.state matches 7 run function holo:snake/start
