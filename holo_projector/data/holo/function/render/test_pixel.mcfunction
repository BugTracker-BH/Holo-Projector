# holo:render/test_pixel — runs as @s = one pixel
scoreboard players operation #PR holo.tmp = @s holo.row
scoreboard players operation #PC holo.tmp = @s holo.col

# Checkerboard red/green
scoreboard players operation #SUM holo.tmp = #PR holo.tmp
scoreboard players operation #SUM holo.tmp += #PC holo.tmp
scoreboard players operation #SUM holo.tmp %= #TWO holo.v
scoreboard players set #ARGB holo.color -1056964608
execute if score #SUM holo.tmp matches 1 run scoreboard players set #ARGB holo.color -1073676544

# Blue border (uses dynamic bounds)
execute if score #PR holo.tmp matches 0 run scoreboard players set #ARGB holo.color -1073741569
execute if score #PR holo.tmp = #ROWS_M1 holo.v run scoreboard players set #ARGB holo.color -1073741569
execute if score #PC holo.tmp matches 0 run scoreboard players set #ARGB holo.color -1073741569
execute if score #PC holo.tmp = #COLS_M1 holo.v run scoreboard players set #ARGB holo.color -1073741569

execute store result entity @s background int 1 run scoreboard players get #ARGB holo.color
