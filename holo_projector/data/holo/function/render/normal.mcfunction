# holo:render/normal — central-difference normal at (#HPX,#HPY,#HPZ), normalized into #NX/NY/NZ
scoreboard players set #EPS holo.v 20

# nx raw
scoreboard players operation #PX holo.tmp = #HPX holo.tmp
scoreboard players operation #PX holo.tmp += #EPS holo.v
scoreboard players operation #PY holo.tmp = #HPY holo.tmp
scoreboard players operation #PZ holo.tmp = #HPZ holo.tmp
function holo:sdf/active
scoreboard players operation #NXA holo.tmp = #D holo.tmp
scoreboard players operation #PX holo.tmp = #HPX holo.tmp
scoreboard players operation #PX holo.tmp -= #EPS holo.v
function holo:sdf/active
scoreboard players operation #NX holo.tmp = #NXA holo.tmp
scoreboard players operation #NX holo.tmp -= #D holo.tmp

# ny raw
scoreboard players operation #PX holo.tmp = #HPX holo.tmp
scoreboard players operation #PY holo.tmp = #HPY holo.tmp
scoreboard players operation #PY holo.tmp += #EPS holo.v
function holo:sdf/active
scoreboard players operation #NYA holo.tmp = #D holo.tmp
scoreboard players operation #PY holo.tmp = #HPY holo.tmp
scoreboard players operation #PY holo.tmp -= #EPS holo.v
function holo:sdf/active
scoreboard players operation #NY holo.tmp = #NYA holo.tmp
scoreboard players operation #NY holo.tmp -= #D holo.tmp

# nz raw
scoreboard players operation #PY holo.tmp = #HPY holo.tmp
scoreboard players operation #PZ holo.tmp = #HPZ holo.tmp
scoreboard players operation #PZ holo.tmp += #EPS holo.v
function holo:sdf/active
scoreboard players operation #NZA holo.tmp = #D holo.tmp
scoreboard players operation #PZ holo.tmp = #HPZ holo.tmp
scoreboard players operation #PZ holo.tmp -= #EPS holo.v
function holo:sdf/active
scoreboard players operation #NZ holo.tmp = #NZA holo.tmp
scoreboard players operation #NZ holo.tmp -= #D holo.tmp

# |N|^2 in fp (each component scaled by eps so values are small; normalize)
scoreboard players operation #T1 holo.tmp = #NX holo.tmp
scoreboard players operation #T1 holo.tmp *= #NX holo.tmp
scoreboard players operation #T2 holo.tmp = #NY holo.tmp
scoreboard players operation #T2 holo.tmp *= #NY holo.tmp
scoreboard players operation #T3 holo.tmp = #NZ holo.tmp
scoreboard players operation #T3 holo.tmp *= #NZ holo.tmp
scoreboard players operation #T1 holo.tmp += #T2 holo.tmp
scoreboard players operation #T1 holo.tmp += #T3 holo.tmp
scoreboard players operation #IN holo.tmp = #T1 holo.tmp
function holo:math/isqrt
# Guard div-by-zero
execute if score #OUT holo.tmp matches ..0 run scoreboard players set #OUT holo.tmp 1

# Normalize to fp scale 1000
scoreboard players operation #NX holo.tmp *= #SCALE holo.v
scoreboard players operation #NX holo.tmp /= #OUT holo.tmp
scoreboard players operation #NY holo.tmp *= #SCALE holo.v
scoreboard players operation #NY holo.tmp /= #OUT holo.tmp
scoreboard players operation #NZ holo.tmp *= #SCALE holo.v
scoreboard players operation #NZ holo.tmp /= #OUT holo.tmp
