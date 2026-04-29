# holo:viz/shrink — erase rows NEW_H..PREV_H-1
scoreboard players operation #FILL_H holo.tmp = #NEW_H holo.tmp
function holo:viz/shrink_loop
