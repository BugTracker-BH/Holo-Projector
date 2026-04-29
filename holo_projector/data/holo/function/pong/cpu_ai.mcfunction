# holo:pong/cpu_ai — difficulty-aware AI, moves right paddle toward ball
execute store result score #ROLL holo.tmp run random value 1..10
scoreboard players set #CPU_REACT holo.tmp 7
execute if score #DIFFICULTY holo.v matches 1 run scoreboard players set #CPU_REACT holo.tmp 3
execute if score #DIFFICULTY holo.v matches 3 run scoreboard players set #CPU_REACT holo.tmp 10
execute if score #DIFFICULTY holo.v matches 4 run scoreboard players set #CPU_REACT holo.tmp 10
execute if score #ROLL holo.tmp > #CPU_REACT holo.tmp run return 0

# Target Y: ball center minus half paddle
scoreboard players operation #CPU_TGT holo.tmp = #PB_Y holo.tmp
scoreboard players operation #HALF_BALL holo.tmp = #BALL_SIZE holo.v
scoreboard players set #D2CPUB holo.tmp 2
scoreboard players operation #HALF_BALL holo.tmp /= #D2CPUB holo.tmp
scoreboard players operation #CPU_TGT holo.tmp += #HALF_BALL holo.tmp
scoreboard players operation #HALF_PAD holo.tmp = #PADDLE_H holo.v
scoreboard players operation #HALF_PAD holo.tmp /= #D2CPUB holo.tmp
scoreboard players operation #CPU_TGT holo.tmp -= #HALF_PAD holo.tmp

execute if score #CPU_TGT holo.tmp matches ..-1 run scoreboard players set #CPU_TGT holo.tmp 0
scoreboard players operation #RY_CLAMP holo.tmp = #ROWS holo.v
scoreboard players operation #RY_CLAMP holo.tmp -= #PADDLE_H holo.v
execute if score #CPU_TGT holo.tmp > #RY_CLAMP holo.tmp run scoreboard players operation #CPU_TGT holo.tmp = #RY_CLAMP holo.tmp

# Very hard: snap. Others: 1 step.
execute if score #DIFFICULTY holo.v matches 4 run scoreboard players operation #P_RY holo.tmp = #CPU_TGT holo.tmp
execute if score #DIFFICULTY holo.v matches ..3 if score #P_RY holo.tmp < #CPU_TGT holo.tmp run scoreboard players add #P_RY holo.tmp 1
execute if score #DIFFICULTY holo.v matches ..3 if score #P_RY holo.tmp > #CPU_TGT holo.tmp run scoreboard players remove #P_RY holo.tmp 1
