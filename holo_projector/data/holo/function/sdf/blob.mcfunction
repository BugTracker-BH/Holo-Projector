# holo:sdf/blob — smooth-min of 3 animated spheres (polynomial smin, k=400)
# d_smin(a,b) = min(a,b) - h^2/(4k)  where h = max(0, k - |a-b|)
# Inputs: #PX #PY #PZ   Output: #D

scoreboard players set #D2 holo.v 2
scoreboard players set #D3 holo.v 3
scoreboard players set #D4 holo.v 4
scoreboard players set #K holo.v 400
scoreboard players set #K4 holo.v 1600

# Sphere A center = (sin(F/2)*500, 0, cos(F/2)*500)
scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D2 holo.v
function holo:math/sin
scoreboard players operation #CX holo.tmp = #OUT holo.tmp
scoreboard players set #S500 holo.v 500
scoreboard players operation #CX holo.tmp *= #S500 holo.v
scoreboard players operation #CX holo.tmp /= #SCALE holo.v
scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D2 holo.v
function holo:math/cos
scoreboard players operation #CZ holo.tmp = #OUT holo.tmp
scoreboard players operation #CZ holo.tmp *= #S500 holo.v
scoreboard players operation #CZ holo.tmp /= #SCALE holo.v
scoreboard players set #CY holo.tmp 0
function holo:sdf/sphere_at
scoreboard players operation #DA holo.tmp = #D holo.tmp

# Sphere B center = (-sin(F/3)*500, cos(F/4)*300, 0)
scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D3 holo.v
function holo:math/sin
scoreboard players operation #CX holo.tmp = #OUT holo.tmp
scoreboard players operation #CX holo.tmp *= #S500 holo.v
scoreboard players operation #CX holo.tmp /= #SCALE holo.v
scoreboard players operation #CX holo.tmp *= #NEG1 holo.v
scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D4 holo.v
function holo:math/cos
scoreboard players operation #CY holo.tmp = #OUT holo.tmp
scoreboard players set #S300 holo.v 300
scoreboard players operation #CY holo.tmp *= #S300 holo.v
scoreboard players operation #CY holo.tmp /= #SCALE holo.v
scoreboard players set #CZ holo.tmp 0
function holo:sdf/sphere_at
scoreboard players operation #DB holo.tmp = #D holo.tmp

# Sphere C center = (0, sin(F/5)*400, cos(F/3)*500)
scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players set #D5v holo.v 5
scoreboard players operation #IN holo.tmp /= #D5v holo.v
function holo:math/sin
scoreboard players operation #CY holo.tmp = #OUT holo.tmp
scoreboard players set #S400v holo.v 400
scoreboard players operation #CY holo.tmp *= #S400v holo.v
scoreboard players operation #CY holo.tmp /= #SCALE holo.v
scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D3 holo.v
function holo:math/cos
scoreboard players operation #CZ holo.tmp = #OUT holo.tmp
scoreboard players operation #CZ holo.tmp *= #S500 holo.v
scoreboard players operation #CZ holo.tmp /= #SCALE holo.v
scoreboard players set #CX holo.tmp 0
function holo:sdf/sphere_at
scoreboard players operation #DC holo.tmp = #D holo.tmp

# smin(DA, DB) -> DS
scoreboard players operation #MN holo.tmp = #DA holo.tmp
execute if score #DB holo.tmp < #MN holo.tmp run scoreboard players operation #MN holo.tmp = #DB holo.tmp
scoreboard players operation #DIFF holo.tmp = #DA holo.tmp
scoreboard players operation #DIFF holo.tmp -= #DB holo.tmp
execute if score #DIFF holo.tmp matches ..-1 run scoreboard players operation #DIFF holo.tmp *= #NEG1 holo.v
scoreboard players operation #H holo.tmp = #K holo.v
scoreboard players operation #H holo.tmp -= #DIFF holo.tmp
execute if score #H holo.tmp matches ..0 run scoreboard players set #H holo.tmp 0
scoreboard players operation #H2 holo.tmp = #H holo.tmp
scoreboard players operation #H2 holo.tmp *= #H holo.tmp
scoreboard players operation #H2 holo.tmp /= #K4 holo.v
scoreboard players operation #DS holo.tmp = #MN holo.tmp
scoreboard players operation #DS holo.tmp -= #H2 holo.tmp

# smin(DS, DC) -> D
scoreboard players operation #MN holo.tmp = #DS holo.tmp
execute if score #DC holo.tmp < #MN holo.tmp run scoreboard players operation #MN holo.tmp = #DC holo.tmp
scoreboard players operation #DIFF holo.tmp = #DS holo.tmp
scoreboard players operation #DIFF holo.tmp -= #DC holo.tmp
execute if score #DIFF holo.tmp matches ..-1 run scoreboard players operation #DIFF holo.tmp *= #NEG1 holo.v
scoreboard players operation #H holo.tmp = #K holo.v
scoreboard players operation #H holo.tmp -= #DIFF holo.tmp
execute if score #H holo.tmp matches ..0 run scoreboard players set #H holo.tmp 0
scoreboard players operation #H2 holo.tmp = #H holo.tmp
scoreboard players operation #H2 holo.tmp *= #H holo.tmp
scoreboard players operation #H2 holo.tmp /= #K4 holo.v
scoreboard players operation #D holo.tmp = #MN holo.tmp
scoreboard players operation #D holo.tmp -= #H2 holo.tmp
