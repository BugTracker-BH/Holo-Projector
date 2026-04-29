# holo:snake/apply_new_dir — only change if not opposite (no reversing)
scoreboard players operation #DDIFF holo.tmp = #NEW_DIR holo.tmp
scoreboard players operation #DDIFF holo.tmp -= #SNAKE_DIR holo.tmp
scoreboard players add #DDIFF holo.tmp 4
scoreboard players set #D4SN holo.tmp 4
scoreboard players operation #DDIFF holo.tmp %= #D4SN holo.tmp
execute unless score #DDIFF holo.tmp matches 2 run scoreboard players operation #SNAKE_DIR holo.tmp = #NEW_DIR holo.tmp
