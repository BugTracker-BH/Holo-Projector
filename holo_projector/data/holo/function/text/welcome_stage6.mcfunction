# holo:text/welcome_stage6 — final: start rainbow "Ready when you are!"
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute unless score #LIVE_MODE holo.state matches 6 run return 0
function holo:rainbow/start_actual
