# holo:mode/transition_row_loop — clear TRANSITION_STEP rows starting at #PY_TRANS, going up
execute if score #TRANS_I holo.tmp >= #TRANSITION_STEP holo.v run return 0
scoreboard players operation #CLEAR_Y holo.tmp = #PY_TRANS holo.tmp
scoreboard players operation #CLEAR_Y holo.tmp -= #TRANS_I holo.tmp
execute if score #CLEAR_Y holo.tmp matches 0.. run function holo:mode/clear_row_at
scoreboard players add #TRANS_I holo.tmp 1
function holo:mode/transition_row_loop
