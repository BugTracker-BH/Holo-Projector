scoreboard players add #P_LS holo.tmp 1
function holo:pong/reset_ball
tellraw @a [{"text":"[Pong] Left scores! ","color":"aqua"},{"score":{"name":"#P_LS","objective":"holo.tmp"},"color":"white","bold":true},{"text":" - "},{"score":{"name":"#P_RS","objective":"holo.tmp"},"color":"white","bold":true}]
