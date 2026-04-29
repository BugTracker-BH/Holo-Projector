# holo:pong/set_sensitivity — adjust pad movement speed (1-20, higher = faster; 20 = snap)
$scoreboard players set #PONG_SENSITIVITY holo.v $(level)
execute if score #PONG_SENSITIVITY holo.v matches ..0 run scoreboard players set #PONG_SENSITIVITY holo.v 1
execute if score #PONG_SENSITIVITY holo.v matches 21.. run scoreboard players set #PONG_SENSITIVITY holo.v 20
tellraw @s [{"text":"[Pong] Sensitivity: ","color":"aqua"},{"score":{"name":"#PONG_SENSITIVITY","objective":"holo.v"},"color":"white","bold":true},{"text":"  (max 20 = instant snap)","color":"dark_gray"}]
