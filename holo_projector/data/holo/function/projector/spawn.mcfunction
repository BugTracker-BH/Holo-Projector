# holo:projector/spawn — materialize 32x18 text_display grid in front of executor
execute if entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] Screen already exists. Run /function holo:projector/despawn first.","color":"red"}
execute if entity @e[tag=projector_pixel,limit=1] run return 0

# Anchor at 3 blocks forward, at eye height, facing same direction as player's look (yaw only)
execute at @s anchored eyes run summon marker ^ ^ ^3 {Tags:["holo_anchor","holo_new"]}
# Align anchor rotation: point away from player (same yaw as player)
execute as @e[tag=holo_new,limit=1] at @s run tp @s ~ ~ ~ facing entity @p
execute as @e[tag=holo_new,limit=1] at @s run tp @s ~ ~ ~ ~180 0
tag @e[tag=holo_new] remove holo_new

# Build grid
scoreboard players set #R holo.row 0
function holo:projector/spawn_rows

scoreboard players set #ACTIVE holo.state 1
scoreboard players set #SCENE holo.state 0
function holo:render/test_pattern
tellraw @s [{"text":"[Holo] Screen spawned. Pixels: ","color":"aqua"},{"score":{"name":"#MAX_PIX","objective":"holo.v"}},{"text":". Test pattern active. Run /function holo:scene/sphere for static sphere."}]
