# holo:mode/transition_done — transition finished; dispatch pending mode if any
scoreboard players set #TRANSITIONING holo.state 0
execute if score #PENDING_MODE holo.state matches 1 run function holo:pong/start_actual
execute if score #PENDING_MODE holo.state matches 2 run function holo:countdown/start_actual
execute if score #PENDING_MODE holo.state matches 3 run function holo:clock/start_actual
execute if score #PENDING_MODE holo.state matches 5 run function holo:text/display_actual
execute if score #PENDING_MODE holo.state matches 6 run function holo:rainbow/start_actual
execute if score #PENDING_MODE holo.state matches 7 run function holo:snake/start_actual
scoreboard players set #PENDING_MODE holo.state 0
