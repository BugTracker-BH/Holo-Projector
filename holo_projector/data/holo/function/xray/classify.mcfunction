# holo:xray/classify — at block position; choose color by priority, commit to pixel
scoreboard players set #XR_COLOR holo.tmp -16777216
execute if block ~ ~ ~ #minecraft:diamond_ores run scoreboard players set #XR_COLOR holo.tmp -16711681
execute if block ~ ~ ~ #minecraft:emerald_ores run scoreboard players set #XR_COLOR holo.tmp -16711936
execute if block ~ ~ ~ #minecraft:gold_ores run scoreboard players set #XR_COLOR holo.tmp -256
execute if block ~ ~ ~ minecraft:ancient_debris run scoreboard players set #XR_COLOR holo.tmp -5262794
execute if block ~ ~ ~ #minecraft:iron_ores run scoreboard players set #XR_COLOR holo.tmp -4285537
execute if block ~ ~ ~ #minecraft:copper_ores run scoreboard players set #XR_COLOR holo.tmp -23296
execute if block ~ ~ ~ #minecraft:redstone_ores run scoreboard players set #XR_COLOR holo.tmp -65536
execute if block ~ ~ ~ #minecraft:lapis_ores run scoreboard players set #XR_COLOR holo.tmp -16776961
execute if block ~ ~ ~ #minecraft:coal_ores run scoreboard players set #XR_COLOR holo.tmp -12698050
execute if score #XR_COLOR holo.tmp matches -16777216 if block ~ ~ ~ minecraft:lava run scoreboard players set #XR_COLOR holo.tmp -45824
execute if score #XR_COLOR holo.tmp matches -16777216 if block ~ ~ ~ minecraft:water run scoreboard players set #XR_COLOR holo.tmp -11447983
execute if score #XR_COLOR holo.tmp matches -16777216 unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air run scoreboard players set #XR_COLOR holo.tmp -10066330
execute store result storage holo:m px int 1 run scoreboard players get #XR_C holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #XR_R holo.tmp
execute store result storage holo:m color int 1 run scoreboard players get #XR_COLOR holo.tmp
function holo:text/set_pixel with storage holo:m
