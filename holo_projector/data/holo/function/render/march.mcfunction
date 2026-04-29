# holo:render/march — ray march loop (up to 24 steps)
# Inputs: #OX/#OY/#OZ origin, #DX/#DY/#DZ normalized dir, #T current t
# Outputs: #HIT (1/0), #T final t on hit

execute if score #STEP holo.tmp matches 24.. run return 0
execute if score #T holo.tmp matches 20001.. run return 0

# p = O + T*D/1000
scoreboard players operation #PX holo.tmp = #DX holo.tmp
scoreboard players operation #PX holo.tmp *= #T holo.tmp
scoreboard players operation #PX holo.tmp /= #SCALE holo.v
scoreboard players operation #PX holo.tmp += #OX holo.tmp

scoreboard players operation #PY holo.tmp = #DY holo.tmp
scoreboard players operation #PY holo.tmp *= #T holo.tmp
scoreboard players operation #PY holo.tmp /= #SCALE holo.v
scoreboard players operation #PY holo.tmp += #OY holo.tmp

scoreboard players operation #PZ holo.tmp = #DZ holo.tmp
scoreboard players operation #PZ holo.tmp *= #T holo.tmp
scoreboard players operation #PZ holo.tmp /= #SCALE holo.v
scoreboard players operation #PZ holo.tmp += #OZ holo.tmp

# Active scene SDF
function holo:sdf/active

# Hit?
execute if score #D holo.tmp matches ..20 run function holo:render/march_hit
execute if score #D holo.tmp matches ..20 run return 0

# Advance
scoreboard players operation #T holo.tmp += #D holo.tmp
scoreboard players add #STEP holo.tmp 1
function holo:render/march
