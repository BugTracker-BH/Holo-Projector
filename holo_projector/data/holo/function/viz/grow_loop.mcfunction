# holo:viz/grow_loop — fill rows PREV_H..NEW_H-1 with height-tiered color across BAR_WIDTH columns
execute if score #FILL_H holo.tmp >= #NEW_H holo.tmp run return 0
scoreboard players operation #PY_T holo.tmp = #ROWS holo.v
scoreboard players remove #PY_T holo.tmp 1
scoreboard players operation #PY_T holo.tmp -= #FILL_H holo.tmp

# Color by height fraction (low=green, mid=yellow, high=red)
scoreboard players operation #THIRD holo.tmp = #MAX_H holo.v
scoreboard players set #D3V holo.tmp 3
scoreboard players operation #THIRD holo.tmp /= #D3V holo.tmp
scoreboard players operation #TWO_THIRD holo.tmp = #THIRD holo.tmp
scoreboard players operation #TWO_THIRD holo.tmp *= #TWO holo.v

data modify storage holo:m color set value -16711936
execute if score #FILL_H holo.tmp > #THIRD holo.tmp run data modify storage holo:m color set value -256
execute if score #FILL_H holo.tmp > #TWO_THIRD holo.tmp run data modify storage holo:m color set value -65536

scoreboard players set #DX_BAR holo.tmp 0
function holo:viz/draw_bar_row

scoreboard players add #FILL_H holo.tmp 1
function holo:viz/grow_loop
