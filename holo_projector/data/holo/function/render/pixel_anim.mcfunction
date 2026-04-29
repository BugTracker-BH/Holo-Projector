# holo:render/pixel_anim — per-pixel render for animated scenes, parity-interlaced, camera-aware
scoreboard players operation #PR holo.tmp = @s holo.row
scoreboard players operation #PC holo.tmp = @s holo.col

# Interlace: render only if (row % INTERLACE) == PARITY
scoreboard players operation #PAR holo.tmp = #PR holo.tmp
scoreboard players operation #PAR holo.tmp %= #INTERLACE holo.v
execute unless score #PAR holo.tmp = #PARITY holo.state run return 0

# u_fp = (2c - 31) * 1000 / 32
scoreboard players operation #U holo.tmp = #PC holo.tmp
scoreboard players operation #U holo.tmp *= #TWO holo.v
scoreboard players operation #U holo.tmp -= #COLS_M1 holo.v
scoreboard players operation #U holo.tmp *= #SCALE holo.v
scoreboard players operation #U holo.tmp /= #COLS holo.v

# v_fp = (17 - 2r) * 1000 / 18
scoreboard players operation #V holo.tmp = #PR holo.tmp
scoreboard players operation #V holo.tmp *= #NEG2 holo.v
scoreboard players operation #V holo.tmp += #ROWS_M1 holo.v
scoreboard players operation #V holo.tmp *= #SCALE holo.v
scoreboard players operation #V holo.tmp /= #ROWS holo.v

# cam-space dir = (u, v, 1500)
scoreboard players operation #DX holo.tmp = #U holo.tmp
scoreboard players operation #DY holo.tmp = #V holo.tmp
scoreboard players set #DZ holo.tmp 1500

# Normalize
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
scoreboard players operation #T1 holo.tmp *= #SCALE holo.v
scoreboard players operation #IN holo.tmp = #T1 holo.tmp
function holo:math/isqrt
scoreboard players operation #DX holo.tmp *= #SCALE holo.v
scoreboard players operation #DX holo.tmp /= #OUT holo.tmp
scoreboard players operation #DY holo.tmp *= #SCALE holo.v
scoreboard players operation #DY holo.tmp /= #OUT holo.tmp
scoreboard players operation #DZ holo.tmp *= #SCALE holo.v
scoreboard players operation #DZ holo.tmp /= #OUT holo.tmp

# Rotate (dx, dz) around Y by camera yaw:
# wx = dx*cos - dz*sin   (all /1000)
# wz = dx*sin + dz*cos
scoreboard players operation #WX holo.tmp = #DX holo.tmp
scoreboard players operation #WX holo.tmp *= #CAM_C holo.tmp
scoreboard players operation #TM holo.tmp = #DZ holo.tmp
scoreboard players operation #TM holo.tmp *= #CAM_S holo.tmp
scoreboard players operation #WX holo.tmp -= #TM holo.tmp
scoreboard players operation #WX holo.tmp /= #SCALE holo.v

scoreboard players operation #WZ holo.tmp = #DX holo.tmp
scoreboard players operation #WZ holo.tmp *= #CAM_S holo.tmp
scoreboard players operation #TM holo.tmp = #DZ holo.tmp
scoreboard players operation #TM holo.tmp *= #CAM_C holo.tmp
scoreboard players operation #WZ holo.tmp += #TM holo.tmp
scoreboard players operation #WZ holo.tmp /= #SCALE holo.v

scoreboard players operation #DX holo.tmp = #WX holo.tmp
scoreboard players operation #DZ holo.tmp = #WZ holo.tmp

# Ray origin from camera
scoreboard players operation #OX holo.tmp = #CAMX holo.tmp
scoreboard players operation #OY holo.tmp = #CAMY holo.tmp
scoreboard players operation #OZ holo.tmp = #CAMZ holo.tmp

# March
scoreboard players set #T holo.tmp 0
scoreboard players set #STEP holo.tmp 0
scoreboard players set #HIT holo.tmp 0
function holo:render/march

function holo:render/shade_dispatch
execute store result entity @s background int 1 run scoreboard players get #ARGB holo.color
