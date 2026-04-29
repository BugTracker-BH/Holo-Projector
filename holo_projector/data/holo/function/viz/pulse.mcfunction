# holo:viz/pulse — manually trigger a beat spike across all bars
execute unless score #LIVE_MODE holo.state matches 4 run return 0
scoreboard players set #BI holo.tmp 0
function holo:viz/pulse_loop
