# holo:pong/check_paddle_collide — rectangular ball vs rectangular paddles
scoreboard players operation #LEFT_END holo.tmp = #LEFT_X holo.v
scoreboard players operation #LEFT_END holo.tmp += #PADDLE_W holo.v
scoreboard players operation #BX_END holo.tmp = #PB_X holo.tmp
scoreboard players operation #BX_END holo.tmp += #BALL_SIZE holo.v
scoreboard players operation #LY_END holo.tmp = #P_LY holo.tmp
scoreboard players operation #LY_END holo.tmp += #PADDLE_H holo.v
scoreboard players operation #BY_END holo.tmp = #PB_Y holo.tmp
scoreboard players operation #BY_END holo.tmp += #BALL_SIZE holo.v
scoreboard players operation #RY_END holo.tmp = #P_RY holo.tmp
scoreboard players operation #RY_END holo.tmp += #PADDLE_H holo.v

# Left paddle: ball moving left AND x overlap AND y overlap -> bounce right
execute if score #PB_VX holo.tmp matches ..-1 if score #PB_X holo.tmp < #LEFT_END holo.tmp if score #BX_END holo.tmp > #LEFT_X holo.v if score #PB_Y holo.tmp < #LY_END holo.tmp if score #BY_END holo.tmp > #P_LY holo.tmp run scoreboard players set #PB_VX holo.tmp 1
# Right paddle
execute if score #PB_VX holo.tmp matches 1.. if score #BX_END holo.tmp > #RIGHT_X_START holo.v if score #PB_Y holo.tmp < #RY_END holo.tmp if score #BY_END holo.tmp > #P_RY holo.tmp run scoreboard players set #PB_VX holo.tmp -1
