# CPU: move right paddle 1 step toward ball Y (centered on paddle)
scoreboard players operation #CPU_TGT holo.tmp = #PB_Y holo.tmp
scoreboard players operation #HALF_H holo.tmp = #PADDLE_H holo.v
scoreboard players set #D2CPU holo.tmp 2
scoreboard players operation #HALF_H holo.tmp /= #D2CPU holo.tmp
scoreboard players operation #CPU_TGT holo.tmp -= #HALF_H holo.tmp
execute if score #CPU_TGT holo.tmp matches ..-1 run scoreboard players set #CPU_TGT holo.tmp 0
scoreboard players operation #RY_MAX holo.tmp = #ROWS holo.v
scoreboard players operation #RY_MAX holo.tmp -= #PADDLE_H holo.v
execute if score #CPU_TGT holo.tmp > #RY_MAX holo.tmp run scoreboard players operation #CPU_TGT holo.tmp = #RY_MAX holo.tmp
execute if score #P_RY holo.tmp < #CPU_TGT holo.tmp run scoreboard players add #P_RY holo.tmp 1
execute if score #P_RY holo.tmp > #CPU_TGT holo.tmp run scoreboard players remove #P_RY holo.tmp 1
