# holo:clock/tick — read MC time, render clock
execute unless score #LIVE_MODE holo.state matches 3 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0

execute store result score #GAMETIME holo.tmp run time query gametime
scoreboard players set #D24000 holo.tmp 24000
scoreboard players operation #DAYNUM holo.tmp = #GAMETIME holo.tmp
scoreboard players operation #DAYNUM holo.tmp /= #D24000 holo.tmp

execute store result score #DAYTIME holo.tmp run time query daytime
scoreboard players set #D1000 holo.tmp 1000
scoreboard players operation #HOUR holo.tmp = #DAYTIME holo.tmp
scoreboard players operation #HOUR holo.tmp /= #D1000 holo.tmp
scoreboard players add #HOUR holo.tmp 6
scoreboard players set #D24 holo.tmp 24
scoreboard players operation #HOUR holo.tmp %= #D24 holo.tmp

scoreboard players operation #MINUTE holo.tmp = #DAYTIME holo.tmp
scoreboard players operation #MINUTE holo.tmp %= #D1000 holo.tmp
scoreboard players set #D60 holo.tmp 60
scoreboard players operation #MINUTE holo.tmp *= #D60 holo.tmp
scoreboard players operation #MINUTE holo.tmp /= #D1000 holo.tmp

# 12h conversion
data modify storage holo:clk ampm set value ""
execute if score #CLOCK_12H holo.state matches 1 run function holo:clock/convert_12h

# Zero-pad hour and minute
data modify storage holo:clk hour_s set value ""
execute if score #HOUR holo.tmp matches 0..9 run data modify storage holo:clk hour_s set value "0"
execute store result storage holo:clk hour_d int 1 run scoreboard players get #HOUR holo.tmp

data modify storage holo:clk min_s set value ""
execute if score #MINUTE holo.tmp matches 0..9 run data modify storage holo:clk min_s set value "0"
execute store result storage holo:clk min_d int 1 run scoreboard players get #MINUTE holo.tmp

execute store result storage holo:clk day int 1 run scoreboard players get #DAYNUM holo.tmp

function holo:clock/render_time with storage holo:clk

schedule function holo:clock/tick 10t
