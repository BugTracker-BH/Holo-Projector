# holo:xray/layer_down — lower scan plane by 1 block
scoreboard players remove #XRAY_Y_OFFSET holo.v 1
tellraw @s [{"text":"[X-Ray] Y-offset: ","color":"aqua"},{"score":{"name":"#XRAY_Y_OFFSET","objective":"holo.v"},"color":"white","bold":true}]
