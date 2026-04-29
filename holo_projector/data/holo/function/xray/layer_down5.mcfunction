# holo:xray/layer_down5 — lower scan plane by 5 blocks
scoreboard players remove #XRAY_Y_OFFSET holo.v 5
tellraw @s [{"text":"[X-Ray] Y-offset: ","color":"aqua"},{"score":{"name":"#XRAY_Y_OFFSET","objective":"holo.v"},"color":"white","bold":true}]
