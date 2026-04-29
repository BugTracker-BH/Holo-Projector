# holo:sdf/sphere_animated — unit sphere orbiting in XZ plane
# center.x = sin(FRAME/2) * 600, center.z = cos(FRAME/2) * 600, center.y = sin(FRAME/3) * 200
# Inputs: #PX #PY #PZ    Output: #D
# Uses #IN/#OUT for trig. Preserves PX/PY/PZ.

# --- compute animated center ---
scoreboard players set #D2 holo.v 2
scoreboard players set #D3 holo.v 3
scoreboard players set #D5 holo.v 5

scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D2 holo.v
function holo:math/sin
scoreboard players operation #ACX holo.tmp = #OUT holo.tmp
scoreboard players set #D600_1000 holo.v 600
scoreboard players operation #ACX holo.tmp *= #D600_1000 holo.v
scoreboard players operation #ACX holo.tmp /= #SCALE holo.v

scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D2 holo.v
function holo:math/cos
scoreboard players operation #ACZ holo.tmp = #OUT holo.tmp
scoreboard players operation #ACZ holo.tmp *= #D600_1000 holo.v
scoreboard players operation #ACZ holo.tmp /= #SCALE holo.v

scoreboard players operation #IN holo.tmp = #FRAME holo.frame
scoreboard players operation #IN holo.tmp /= #D3 holo.v
function holo:math/sin
scoreboard players operation #ACY holo.tmp = #OUT holo.tmp
scoreboard players set #D200_1000 holo.v 200
scoreboard players operation #ACY holo.tmp *= #D200_1000 holo.v
scoreboard players operation #ACY holo.tmp /= #SCALE holo.v

# p' = p - c  (stash originals in #AQX/Y/Z so we restore PX/PY/PZ after)
scoreboard players operation #AQX holo.tmp = #PX holo.tmp
scoreboard players operation #AQY holo.tmp = #PY holo.tmp
scoreboard players operation #AQZ holo.tmp = #PZ holo.tmp
scoreboard players operation #PX holo.tmp -= #ACX holo.tmp
scoreboard players operation #PY holo.tmp -= #ACY holo.tmp
scoreboard players operation #PZ holo.tmp -= #ACZ holo.tmp

function holo:sdf/sphere

# restore
scoreboard players operation #PX holo.tmp = #AQX holo.tmp
scoreboard players operation #PY holo.tmp = #AQY holo.tmp
scoreboard players operation #PZ holo.tmp = #AQZ holo.tmp
