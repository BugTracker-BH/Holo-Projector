# holo:clock/convert_12h — mutate #HOUR to 12h format, set ampm (" AM"/" PM" with leading space)
scoreboard players set #AM_PM_FLAG holo.tmp 0
execute if score #HOUR holo.tmp matches 12.. run scoreboard players set #AM_PM_FLAG holo.tmp 1
execute if score #HOUR holo.tmp matches 13.. run scoreboard players remove #HOUR holo.tmp 12
execute if score #HOUR holo.tmp matches 0 run scoreboard players set #HOUR holo.tmp 12
execute if score #AM_PM_FLAG holo.tmp matches 0 run data modify storage holo:clk ampm set value " AM"
execute if score #AM_PM_FLAG holo.tmp matches 1 run data modify storage holo:clk ampm set value " PM"
