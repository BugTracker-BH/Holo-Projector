# holo:render/test_pixel — runs as @s = one pixel
# Read row/col
scoreboard players operation #PR holo.tmp = @s holo.row
scoreboard players operation #PC holo.tmp = @s holo.col

# Default: checkerboard red (ARGB 0xC0FF0000 = -1056964608) / green (0xC000FF00 = -1073676544)
scoreboard players operation #SUM holo.tmp = #PR holo.tmp
scoreboard players operation #SUM holo.tmp += #PC holo.tmp
scoreboard players operation #SUM holo.tmp %= #TWO holo.v
scoreboard players set #ARGB holo.color -1056964608
execute if score #SUM holo.tmp matches 1 run scoreboard players set #ARGB holo.color -1073676544

# Border override: blue (0xC00000FF = -1073741569)
execute if score #PR holo.tmp matches 0 run scoreboard players set #ARGB holo.color -1073741569
execute if score #PR holo.tmp matches 17 run scoreboard players set #ARGB holo.color -1073741569
execute if score #PC holo.tmp matches 0 run scoreboard players set #ARGB holo.color -1073741569
execute if score #PC holo.tmp matches 31 run scoreboard players set #ARGB holo.color -1073741569

execute store result entity @s background int 1 run scoreboard players get #ARGB holo.color
