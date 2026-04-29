# holo:pong/read_input_item — hotbar slot (0-8) -> paddle Y
execute store result score #SLOT holo.tmp run data get entity @p SelectedItemSlot 1
scoreboard players operation #PR_RANGE holo.tmp = #ROWS holo.v
scoreboard players operation #PR_RANGE holo.tmp -= #PADDLE_H holo.v
scoreboard players operation #LYT holo.tmp = #SLOT holo.tmp
scoreboard players operation #LYT holo.tmp *= #PR_RANGE holo.tmp
scoreboard players set #D8P holo.tmp 8
scoreboard players operation #LYT holo.tmp /= #D8P holo.tmp
execute if score #LYT holo.tmp matches ..-1 run scoreboard players set #LYT holo.tmp 0
execute if score #LYT holo.tmp > #PR_RANGE holo.tmp run scoreboard players operation #LYT holo.tmp = #PR_RANGE holo.tmp

execute if score #PONG_SENSITIVITY holo.v matches 20.. run scoreboard players operation #P_LY holo.tmp = #LYT holo.tmp
execute unless score #PONG_SENSITIVITY holo.v matches 20.. run function holo:pong/apply_sensitivity
