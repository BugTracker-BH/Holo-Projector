execute store result score #SLOT holo.tmp run data get entity @p SelectedItemSlot 1
scoreboard players set #NEW_DIR holo.tmp -1
execute if score #SLOT holo.tmp matches 0 run scoreboard players set #NEW_DIR holo.tmp 0
execute if score #SLOT holo.tmp matches 1 run scoreboard players set #NEW_DIR holo.tmp 1
execute if score #SLOT holo.tmp matches 2 run scoreboard players set #NEW_DIR holo.tmp 2
execute if score #SLOT holo.tmp matches 3 run scoreboard players set #NEW_DIR holo.tmp 3
execute unless score #NEW_DIR holo.tmp matches -1 run function holo:snake/apply_new_dir
