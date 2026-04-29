# holo:text/rainbow_color — set #TEXT_COLOR based on (I + RAINBOW_OFFSET) % 6
scoreboard players operation #COLORIDX holo.tmp = #I holo.tmp
scoreboard players operation #COLORIDX holo.tmp += #RAINBOW_OFFSET holo.v
scoreboard players set #D6RB holo.tmp 6
scoreboard players operation #COLORIDX holo.tmp %= #D6RB holo.tmp
execute if score #COLORIDX holo.tmp matches 0 run scoreboard players set #TEXT_COLOR holo.v -65536
execute if score #COLORIDX holo.tmp matches 1 run scoreboard players set #TEXT_COLOR holo.v -30720
execute if score #COLORIDX holo.tmp matches 2 run scoreboard players set #TEXT_COLOR holo.v -256
execute if score #COLORIDX holo.tmp matches 3 run scoreboard players set #TEXT_COLOR holo.v -16711936
execute if score #COLORIDX holo.tmp matches 4 run scoreboard players set #TEXT_COLOR holo.v -16776961
execute if score #COLORIDX holo.tmp matches 5 run scoreboard players set #TEXT_COLOR holo.v -65281
