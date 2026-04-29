# holo:text/welcome_transition — starts bottom-up clear between welcome stages
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute unless score #LIVE_MODE holo.state matches 6 run return 0
scoreboard players operation #TRANSITION_STEP holo.v = #ROWS holo.v
scoreboard players set #D15V holo.v 15
scoreboard players operation #TRANSITION_STEP holo.v /= #D15V holo.v
execute if score #TRANSITION_STEP holo.v matches ..0 run scoreboard players set #TRANSITION_STEP holo.v 1
scoreboard players operation #PY_TRANS holo.tmp = #ROWS holo.v
scoreboard players remove #PY_TRANS holo.tmp 1
scoreboard players set #TRANSITIONING holo.state 1
scoreboard players set #PENDING_MODE holo.state 0
function holo:mode/transition_tick
