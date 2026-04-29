execute store result score #YAW holo.tmp run data get entity @p Rotation[0] 1
execute if score #YAW holo.tmp matches ..-1 run scoreboard players add #YAW holo.tmp 360
execute if score #YAW holo.tmp matches 360.. run scoreboard players remove #YAW holo.tmp 360
scoreboard players set #NEW_DIR holo.tmp 2
execute if score #YAW holo.tmp matches 45..134 run scoreboard players set #NEW_DIR holo.tmp 3
execute if score #YAW holo.tmp matches 135..224 run scoreboard players set #NEW_DIR holo.tmp 0
execute if score #YAW holo.tmp matches 225..314 run scoreboard players set #NEW_DIR holo.tmp 1
function holo:snake/apply_new_dir
