# holo:math/sin — sin(i) where i is 0..255; wraps via mod
# Input:  #IN  holo.tmp
# Output: #OUT holo.tmp (fp scale 1000, range -1000..1000)
scoreboard players set #M256 holo.v 256
# Safe modulo for negative inputs
scoreboard players operation #IN holo.tmp %= #M256 holo.v
execute if score #IN holo.tmp matches ..-1 run scoreboard players add #IN holo.tmp 256
execute store result storage holo:m sidx int 1 run scoreboard players get #IN holo.tmp
function holo:math/sin_lookup with storage holo:m
