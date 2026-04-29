# holo:projector/spawn
execute if entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] Screen already exists. Run /function holo:projector/despawn first.","color":"red"}
execute if entity @e[tag=projector_pixel,limit=1] run return 0

execute at @s anchored eyes run summon marker ^ ^ ^3 {Tags:["holo_anchor","holo_new"]}
execute as @e[tag=holo_new,limit=1] at @s run tp @s ~ ~ ~ facing entity @p
execute as @e[tag=holo_new,limit=1] at @s run tp @s ~ ~ ~ ~180 0
tag @e[tag=holo_new] remove holo_new

scoreboard players set #R holo.row 0
function holo:projector/spawn_rows

execute as @e[tag=projector_pixel] store result entity @s transformation.scale[0] float 0.01 run scoreboard players get #PXSIZE_X100 holo.v
execute as @e[tag=projector_pixel] store result entity @s transformation.scale[1] float 0.01 run scoreboard players get #PXSIZE_X100 holo.v

execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

scoreboard players set #ACTIVE holo.state 1
scoreboard players set #SCENE holo.state 0
scoreboard players set #PARITY holo.state 0

function holo:text/welcome

tellraw @s [{"text":"[Holo] Projector online. Pixels: ","color":"aqua"},{"score":{"name":"#MAX_PIX","objective":"holo.v"}}]
