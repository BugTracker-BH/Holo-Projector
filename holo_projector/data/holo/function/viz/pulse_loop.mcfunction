execute if score #BI holo.tmp >= #NUM_BARS holo.v run return 0
execute store result storage holo:viz bi int 1 run scoreboard players get #BI holo.tmp
function holo:viz/load_h with storage holo:viz
scoreboard players operation #NEW_H holo.tmp = #PREV_H holo.tmp
execute store result score #PULSE_ADD holo.tmp run random value 4..8
scoreboard players operation #NEW_H holo.tmp += #PULSE_ADD holo.tmp
execute if score #NEW_H holo.tmp > #MAX_H holo.v run scoreboard players operation #NEW_H holo.tmp = #MAX_H holo.v

scoreboard players operation #BAR_X holo.tmp = #BI holo.tmp
scoreboard players operation #BAR_X holo.tmp *= #BAR_SPACING holo.v
scoreboard players operation #BAR_DIFF holo.tmp = #NEW_H holo.tmp
scoreboard players operation #BAR_DIFF holo.tmp -= #PREV_H holo.tmp
execute if score #BAR_DIFF holo.tmp matches 1.. run function holo:viz/grow

execute store result storage holo:viz bi int 1 run scoreboard players get #BI holo.tmp
execute store result storage holo:viz h int 1 run scoreboard players get #NEW_H holo.tmp
function holo:viz/save_h with storage holo:viz

scoreboard players add #BI holo.tmp 1
function holo:viz/pulse_loop
