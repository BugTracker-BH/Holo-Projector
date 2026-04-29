scoreboard players add #P_RS holo.tmp 1
function holo:pong/reset_ball
tellraw @a [{"text":"[Pong] Right (CPU) scores! ","color":"red"},{"score":{"name":"#P_LS","objective":"holo.tmp"},"color":"white","bold":true},{"text":" - "},{"score":{"name":"#P_RS","objective":"holo.tmp"},"color":"white","bold":true}]
