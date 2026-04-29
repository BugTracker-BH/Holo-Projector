# holo:mode/transition_tick — bottom-up clear animation (1 row-step per tick, TRANSITION_STEP rows each)
execute unless score #TRANSITIONING holo.state matches 1 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute if score #PY_TRANS holo.tmp matches ..-1 run function holo:mode/transition_done
execute if score #PY_TRANS holo.tmp matches ..-1 run return 0

scoreboard players set #TRANS_I holo.tmp 0
function holo:mode/transition_row_loop

scoreboard players operation #PY_TRANS holo.tmp -= #TRANSITION_STEP holo.v
schedule function holo:mode/transition_tick 1t
