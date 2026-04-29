# holo:pong/set_ball_speed — adjust ball speed (1-5, higher = faster; default 1)
$scoreboard players set #PONG_BALL_SPEED holo.v $(level)
execute if score #PONG_BALL_SPEED holo.v matches ..0 run scoreboard players set #PONG_BALL_SPEED holo.v 1
execute if score #PONG_BALL_SPEED holo.v matches 6.. run scoreboard players set #PONG_BALL_SPEED holo.v 5
tellraw @s [{"text":"[Pong] Ball speed: ","color":"aqua"},{"score":{"name":"#PONG_BALL_SPEED","objective":"holo.v"},"color":"white","bold":true},{"text":"  (default 1, max 5)","color":"dark_gray"}]
