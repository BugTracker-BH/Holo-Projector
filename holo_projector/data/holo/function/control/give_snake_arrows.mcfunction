# holo:control/give_snake_arrows — place 4 labeled arrows in hotbar slots 0-3
item replace entity @s hotbar.0 with arrow[minecraft:item_name='{"text":"UP","color":"aqua","bold":true}']
item replace entity @s hotbar.1 with arrow[minecraft:item_name='{"text":"RIGHT","color":"aqua","bold":true}']
item replace entity @s hotbar.2 with arrow[minecraft:item_name='{"text":"DOWN","color":"aqua","bold":true}']
item replace entity @s hotbar.3 with arrow[minecraft:item_name='{"text":"LEFT","color":"aqua","bold":true}']
tellraw @s {"text":"[Holo] Snake arrows placed in hotbar slots 1-4. Scroll to change direction.","color":"aqua"}
