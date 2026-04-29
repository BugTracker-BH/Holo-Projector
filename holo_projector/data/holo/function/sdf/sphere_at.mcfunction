# holo:sdf/sphere_at — helper: sphere radius 700 at center (#CX,#CY,#CZ). Output #D.
# Preserves PX/PY/PZ.
scoreboard players operation #AQX holo.tmp = #PX holo.tmp
scoreboard players operation #AQY holo.tmp = #PY holo.tmp
scoreboard players operation #AQZ holo.tmp = #PZ holo.tmp
scoreboard players operation #PX holo.tmp -= #CX holo.tmp
scoreboard players operation #PY holo.tmp -= #CY holo.tmp
scoreboard players operation #PZ holo.tmp -= #CZ holo.tmp

scoreboard players operation #SX holo.tmp = #PX holo.tmp
scoreboard players operation #SX holo.tmp *= #PX holo.tmp
scoreboard players operation #SX holo.tmp /= #SCALE holo.v
scoreboard players operation #SY holo.tmp = #PY holo.tmp
scoreboard players operation #SY holo.tmp *= #PY holo.tmp
scoreboard players operation #SY holo.tmp /= #SCALE holo.v
scoreboard players operation #SZ holo.tmp = #PZ holo.tmp
scoreboard players operation #SZ holo.tmp *= #PZ holo.tmp
scoreboard players operation #SZ holo.tmp /= #SCALE holo.v
scoreboard players operation #SX holo.tmp += #SY holo.tmp
scoreboard players operation #SX holo.tmp += #SZ holo.tmp
scoreboard players operation #SX holo.tmp *= #SCALE holo.v
scoreboard players operation #IN holo.tmp = #SX holo.tmp
function holo:math/isqrt
scoreboard players operation #D holo.tmp = #OUT holo.tmp
scoreboard players remove #D holo.tmp 700

scoreboard players operation #PX holo.tmp = #AQX holo.tmp
scoreboard players operation #PY holo.tmp = #AQY holo.tmp
scoreboard players operation #PZ holo.tmp = #AQZ holo.tmp
