# holo:vm/start — dispatcher with smooth transition
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[HoloScript] No screen. Spawn the projector first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute unless data storage holo:vm program[0] run tellraw @s {"text":"[HoloScript] No program loaded. Pick one from the book.","color":"red"}
execute unless data storage holo:vm program[0] run return 0
execute if score #LIVE_MODE holo.state matches 0 run function holo:vm/start_actual
execute unless score #LIVE_MODE holo.state matches 0 run scoreboard players set #PENDING_MODE holo.state 8
execute unless score #LIVE_MODE holo.state matches 0 run function holo:mode/stop_smooth
