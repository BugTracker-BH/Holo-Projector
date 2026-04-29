scoreboard players operation #LY_END holo.tmp = #P_LY holo.tmp
scoreboard players operation #LY_END holo.tmp += #PADDLE_H holo.v
scoreboard players operation #RY_END holo.tmp = #P_RY holo.tmp
scoreboard players operation #RY_END holo.tmp += #PADDLE_H holo.v
execute if score #PB_X holo.tmp <= #LEFT_X holo.v if score #PB_VX holo.tmp matches ..-1 if score #PB_Y holo.tmp >= #P_LY holo.tmp if score #PB_Y holo.tmp < #LY_END holo.tmp run scoreboard players set #PB_VX holo.tmp 1
execute if score #PB_X holo.tmp >= #RIGHT_X holo.v if score #PB_VX holo.tmp matches 1.. if score #PB_Y holo.tmp >= #P_RY holo.tmp if score #PB_Y holo.tmp < #RY_END holo.tmp run scoreboard players set #PB_VX holo.tmp -1
