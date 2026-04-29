# holo:pong/check_paddle_collide — use *= -1 so ball speed is preserved
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

execute if score #PB_VX holo.tmp matches ..-1 if score #PB_X holo.tmp < #LEFT_END holo.tmp if score #BX_END holo.tmp > #LEFT_X holo.v if score #PB_Y holo.tmp < #LY_END holo.tmp if score #BY_END holo.tmp > #P_LY holo.tmp run scoreboard players operation #PB_VX holo.tmp *= #NEG1 holo.v
execute if score #PB_VX holo.tmp matches 1.. if score #BX_END holo.tmp > #RIGHT_X_START holo.v if score #PB_Y holo.tmp < #RY_END holo.tmp if score #BY_END holo.tmp > #P_RY holo.tmp run scoreboard players operation #PB_VX holo.tmp *= #NEG1 holo.v
