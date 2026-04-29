scoreboard players add #P_RS holo.tmp 1
tellraw @a [{"text":"[Pong] Right (CPU) scores! ","color":"red"},{"score":{"name":"#P_LS","objective":"holo.tmp"},"color":"white","bold":true},{"text":" - "},{"score":{"name":"#P_RS","objective":"holo.tmp"},"color":"white","bold":true}]
execute if score #P_RS holo.tmp matches 5.. run function holo:pong/lose
execute if score #P_RS holo.tmp matches 5.. run return 0
function holo:pong/reset_ball
