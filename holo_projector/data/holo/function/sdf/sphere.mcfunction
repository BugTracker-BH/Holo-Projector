# holo:sdf/sphere — unit sphere at origin, radius 1000 (fp)
# inputs: #PX #PY #PZ  (fp)
# output: #D holo.tmp (signed fp distance)
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
# |p|_fp = isqrt(SX * 1000)
scoreboard players operation #SX holo.tmp *= #SCALE holo.v
scoreboard players operation #IN holo.tmp = #SX holo.tmp
function holo:math/isqrt
scoreboard players operation #D holo.tmp = #OUT holo.tmp
scoreboard players remove #D holo.tmp 1000
