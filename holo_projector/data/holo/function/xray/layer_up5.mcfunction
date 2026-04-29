# holo:xray/layer_up5 — raise scan plane by 5 blocks
scoreboard players add #XRAY_Y_OFFSET holo.v 5
tellraw @s [{"text":"[X-Ray] Y-offset: ","color":"aqua"},{"score":{"name":"#XRAY_Y_OFFSET","objective":"holo.v"},"color":"white","bold":true}]
