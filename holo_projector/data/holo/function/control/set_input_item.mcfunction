# holo:control/set_input_item — input mode = hotbar slot
scoreboard players set #INPUT_MODE holo.v 1
tellraw @s {"text":"[Holo] Input mode: Hotbar (Snake: slots 1-4 = U/R/D/L. Pong: slot 1-9 = paddle pos)","color":"aqua"}
tellraw @s [{"text":"  Run ","color":"dark_gray"},{"text":"/function holo:control/give_snake_arrows","color":"aqua","italic":true},{"text":" for labeled snake arrows.","color":"dark_gray"}]
