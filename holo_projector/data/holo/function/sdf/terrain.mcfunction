# holo:sdf/terrain — heightmap: height(x,z) = sin(x/50-idx) * sin(z/50-idx) * 500
# d = py - height  (scaled 0.5 for safe marching)
scoreboard players set #D50 holo.v 50

scoreboard players operation #IDXX holo.tmp = #PX holo.tmp
scoreboard players operation #IDXX holo.tmp /= #D50 holo.v
scoreboard players operation #IN holo.tmp = #IDXX holo.tmp
function holo:math/sin
scoreboard players operation #HTA holo.tmp = #OUT holo.tmp

scoreboard players operation #IDXZ holo.tmp = #PZ holo.tmp
scoreboard players operation #IDXZ holo.tmp /= #D50 holo.v
scoreboard players operation #IN holo.tmp = #IDXZ holo.tmp
function holo:math/sin

scoreboard players operation #HTA holo.tmp *= #OUT holo.tmp
scoreboard players operation #HTA holo.tmp /= #SCALE holo.v
scoreboard players set #AMP holo.v 500
scoreboard players operation #HTA holo.tmp *= #AMP holo.v
scoreboard players operation #HTA holo.tmp /= #SCALE holo.v

scoreboard players operation #D holo.tmp = #PY holo.tmp
scoreboard players operation #D holo.tmp -= #HTA holo.tmp
# Conservative step (terrain SDF is not a true distance field)
scoreboard players set #D2m holo.v 2
scoreboard players operation #D holo.tmp /= #D2m holo.v
