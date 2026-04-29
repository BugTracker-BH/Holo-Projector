# holo:text/welcome — kicks off word-by-word welcome sequence
scoreboard players set #PENDING_MODE holo.state 0
scoreboard players set #LIVE_MODE holo.state 6
schedule function holo:text/welcome_stage1_show 4t
