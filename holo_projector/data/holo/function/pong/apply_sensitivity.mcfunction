# holo:pong/apply_sensitivity — clamp pad movement toward #LYT using #PONG_SENSITIVITY
scoreboard players operation #LDIFF holo.tmp = #LYT holo.tmp
scoreboard players operation #LDIFF holo.tmp -= #P_LY holo.tmp
scoreboard players operation #LABS holo.tmp = #LDIFF holo.tmp
execute if score #LABS holo.tmp matches ..-1 run scoreboard players operation #LABS holo.tmp *= #NEG1 holo.v
execute if score #LABS holo.tmp <= #PONG_SENSITIVITY holo.v run scoreboard players operation #P_LY holo.tmp = #LYT holo.tmp
execute if score #LABS holo.tmp > #PONG_SENSITIVITY holo.v if score #LDIFF holo.tmp matches 1.. run scoreboard players operation #P_LY holo.tmp += #PONG_SENSITIVITY holo.v
execute if score #LABS holo.tmp > #PONG_SENSITIVITY holo.v if score #LDIFF holo.tmp matches ..-1 run scoreboard players operation #P_LY holo.tmp -= #PONG_SENSITIVITY holo.v
