# holo:mode/stop_smooth — stop current mode and start smooth bottom-up clear
scoreboard players set #LIVE_MODE holo.state 0

# Compute TRANSITION_STEP (rows cleared per tick, ~15-tick total animation)
scoreboard players operation #TRANSITION_STEP holo.v = #ROWS holo.v
scoreboard players set #D15V holo.v 15
scoreboard players operation #TRANSITION_STEP holo.v /= #D15V holo.v
execute if score #TRANSITION_STEP holo.v matches ..0 run scoreboard players set #TRANSITION_STEP holo.v 1

scoreboard players operation #PY_TRANS holo.tmp = #ROWS holo.v
scoreboard players remove #PY_TRANS holo.tmp 1
scoreboard players set #TRANSITIONING holo.state 1
function holo:mode/transition_tick
