# holo:vm/op_SIN — pop angle (deg), push sin(deg)*1000. Angle normalized to 0..360.
execute store result score #V_A holo.tmp run data get storage holo:vm stack[0]
data remove storage holo:vm stack[0]
scoreboard players set #D360 holo.tmp 360
scoreboard players operation #V_A holo.tmp %= #D360 holo.tmp
execute if score #V_A holo.tmp matches ..-1 run scoreboard players operation #V_A holo.tmp += #D360 holo.tmp
execute store result storage holo:vm t int 1 run scoreboard players get #V_A holo.tmp
function holo:vm/sin_fetch with storage holo:vm
data modify storage holo:vm stack prepend from storage holo:vm t
