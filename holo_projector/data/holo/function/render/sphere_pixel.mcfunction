# holo:render/sphere_pixel — runs as @s = one pixel
# Fixed-point scale = 1000. Camera at (0,0,-3000), sphere at origin radius 1000.
# Ray direction (approx, un-normalized OK for t-ordering since we normalize below).

# pixel coordinates
scoreboard players operation #PR holo.tmp = @s holo.row
scoreboard players operation #PC holo.tmp = @s holo.col

# u_fp = (2c - 31) * 1000 / 32  (range ~-968..968)
scoreboard players operation #U holo.tmp = #PC holo.tmp
scoreboard players operation #U holo.tmp *= #TWO holo.v
scoreboard players operation #U holo.tmp -= #THIRTYONE holo.v
scoreboard players operation #U holo.tmp *= #SCALE holo.v
scoreboard players set #D32 holo.v 32
scoreboard players operation #U holo.tmp /= #D32 holo.v

# v_fp = (17 - 2r) * 1000 / 18
scoreboard players operation #V holo.tmp = #PR holo.tmp
scoreboard players operation #V holo.tmp *= #NEG2 holo.v
scoreboard players operation #V holo.tmp += #SEVENTEEN holo.v
scoreboard players operation #V holo.tmp *= #SCALE holo.v
scoreboard players set #D18 holo.v 18
scoreboard players operation #V holo.tmp /= #D18 holo.v

# raw dir (dx,dy,dz) = (U, V, 1500)   (focal length ~1.5 for narrow FOV)
scoreboard players operation #DX holo.tmp = #U holo.tmp
scoreboard players operation #DY holo.tmp = #V holo.tmp
scoreboard players set #DZ holo.tmp 1500

# |dir|^2_fp = dx²+dy²+dz² (each /1000)
scoreboard players operation #T1 holo.tmp = #DX holo.tmp
scoreboard players operation #T1 holo.tmp *= #DX holo.tmp
scoreboard players operation #T1 holo.tmp /= #SCALE holo.v
scoreboard players operation #T2 holo.tmp = #DY holo.tmp
scoreboard players operation #T2 holo.tmp *= #DY holo.tmp
scoreboard players operation #T2 holo.tmp /= #SCALE holo.v
scoreboard players operation #T3 holo.tmp = #DZ holo.tmp
scoreboard players operation #T3 holo.tmp *= #DZ holo.tmp
scoreboard players operation #T3 holo.tmp /= #SCALE holo.v
scoreboard players operation #T1 holo.tmp += #T2 holo.tmp
scoreboard players operation #T1 holo.tmp += #T3 holo.tmp
# |dir|_fp = isqrt(T1 * 1000)
scoreboard players operation #T1 holo.tmp *= #SCALE holo.v
scoreboard players operation #IN holo.tmp = #T1 holo.tmp
function holo:math/isqrt
# Normalize: dx = dx*1000 / |dir|
scoreboard players operation #DX holo.tmp *= #SCALE holo.v
scoreboard players operation #DX holo.tmp /= #OUT holo.tmp
scoreboard players operation #DY holo.tmp *= #SCALE holo.v
scoreboard players operation #DY holo.tmp /= #OUT holo.tmp
scoreboard players operation #DZ holo.tmp *= #SCALE holo.v
scoreboard players operation #DZ holo.tmp /= #OUT holo.tmp

# Ray origin (0, 0, -3000)
scoreboard players set #OX holo.tmp 0
scoreboard players set #OY holo.tmp 0
scoreboard players set #OZ holo.tmp -3000

# March
scoreboard players set #T holo.tmp 0
scoreboard players set #STEP holo.tmp 0
scoreboard players set #HIT holo.tmp 0
function holo:render/march

scoreboard players set #ARGB holo.color -1073741824
function holo:render/shade_dispatch

execute store result entity @s background int 1 run scoreboard players get #ARGB holo.color
