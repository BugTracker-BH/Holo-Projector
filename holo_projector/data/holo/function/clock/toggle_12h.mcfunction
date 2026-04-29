# holo:clock/toggle_12h — swap 12h/24h format
execute if score #CLOCK_12H holo.state matches 0 run scoreboard players set #CLOCK_12H holo.state 1
execute unless score #CLOCK_12H holo.state matches 1 run scoreboard players set #CLOCK_12H holo.state 0
execute if score #CLOCK_12H holo.state matches 1 run tellraw @s {"text":"[Clock] 12-hour format (AM/PM).","color":"aqua"}
execute if score #CLOCK_12H holo.state matches 0 run tellraw @s {"text":"[Clock] 24-hour format.","color":"aqua"}
