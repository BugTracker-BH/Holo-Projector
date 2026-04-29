# holo:viz/grow — fill rows PREV_H..NEW_H-1 with green/yellow/red
scoreboard players operation #FILL_H holo.tmp = #PREV_H holo.tmp
function holo:viz/grow_loop
