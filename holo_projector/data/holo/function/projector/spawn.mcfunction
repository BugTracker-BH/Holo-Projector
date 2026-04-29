# holo:projector/spawn — materialize grid, rescale per-size, run welcome
execute if entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] Screen already exists. Run /function holo:projector/despawn first.","color":"red"}
execute if entity @e[tag=projector_pixel,limit=1] run return 0

# Anchor
execute at @s anchored eyes run summon marker ^ ^ ^3 {Tags:["holo_anchor","holo_new"]}
execute as @e[tag=holo_new,limit=1] at @s run tp @s ~ ~ ~ facing entity @p
execute as @e[tag=holo_new,limit=1] at @s run tp @s ~ ~ ~ ~180 0
tag @e[tag=holo_new] remove holo_new

# Build grid
scoreboard players set #R holo.row 0
function holo:projector/spawn_rows

# Post-spawn rescale all pixels to PXSIZE_X100/100 (e.g. 20 -> 0.2, 100 -> 1.0)
execute as @e[tag=projector_pixel] store result entity @s transformation.scale[0] float 0.01 run scoreboard players get #PXSIZE_X100 holo.v
execute as @e[tag=projector_pixel] store result entity @s transformation.scale[1] float 0.01 run scoreboard players get #PXSIZE_X100 holo.v

# Black out pixels for welcome background (ARGB 0xFF000000 = -16777216)
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

scoreboard players set #ACTIVE holo.state 1
scoreboard players set #SCENE holo.state 0
scoreboard players set #PARITY holo.state 0

# Compute welcome text scale = (COLS * PXSIZE_X100) / 6
scoreboard players operation #WELCOME_SC holo.v = #COLS holo.v
scoreboard players operation #WELCOME_SC holo.v *= #PXSIZE_X100 holo.v
scoreboard players set #D6 holo.v 6
scoreboard players operation #WELCOME_SC holo.v /= #D6 holo.v

function holo:text/welcome

tellraw @s [{"text":"[Holo] Projector online. Pixels: ","color":"aqua"},{"score":{"name":"#MAX_PIX","objective":"holo.v"}}]
