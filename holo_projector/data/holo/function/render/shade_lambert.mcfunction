# holo:render/shade_lambert — diffuse against light dir (577,577,-577) normalized
# Requires normals already computed (#NX/#NY/#NZ fp1000).
function holo:render/normal

scoreboard players set #LX holo.v 577
scoreboard players set #LY holo.v 577
scoreboard players set #LZN holo.v -577

scoreboard players operation #T1 holo.tmp = #NX holo.tmp
scoreboard players operation #T1 holo.tmp *= #LX holo.v
scoreboard players operation #T2 holo.tmp = #NY holo.tmp
scoreboard players operation #T2 holo.tmp *= #LY holo.v
scoreboard players operation #T3 holo.tmp = #NZ holo.tmp
scoreboard players operation #T3 holo.tmp *= #LZN holo.v
scoreboard players operation #DOT holo.tmp = #T1 holo.tmp
scoreboard players operation #DOT holo.tmp += #T2 holo.tmp
scoreboard players operation #DOT holo.tmp += #T3 holo.tmp
scoreboard players operation #DOT holo.tmp /= #SCALE holo.v

execute if score #DOT holo.tmp matches ..0 run scoreboard players set #DOT holo.tmp 0

# final_fp = 200 + DOT * 800 / 1000
scoreboard players set #AMB holo.v 200
scoreboard players set #DIF holo.v 800
scoreboard players operation #B holo.tmp = #DOT holo.tmp
scoreboard players operation #B holo.tmp *= #DIF holo.v
scoreboard players operation #B holo.tmp /= #SCALE holo.v
scoreboard players operation #B holo.tmp += #AMB holo.v
# clamp 0..1000
execute if score #B holo.tmp matches 1001.. run scoreboard players set #B holo.tmp 1000
# to byte 0..255: B * 255 / 1000
scoreboard players set #D255 holo.v 255
scoreboard players operation #B holo.tmp *= #D255 holo.v
scoreboard players operation #B holo.tmp /= #SCALE holo.v
execute if score #B holo.tmp matches 256.. run scoreboard players set #B holo.tmp 255
execute if score #B holo.tmp matches ..0 run scoreboard players set #B holo.tmp 0

scoreboard players operation #R holo.color = #B holo.tmp
scoreboard players operation #R holo.color *= #SHL16 holo.v
scoreboard players operation #G holo.color = #B holo.tmp
scoreboard players operation #G holo.color *= #SHL8 holo.v
scoreboard players operation #ARGB holo.color = #ALPHA_C0 holo.v
scoreboard players operation #ARGB holo.color += #R holo.color
scoreboard players operation #ARGB holo.color += #G holo.color
scoreboard players operation #ARGB holo.color += #B holo.tmp
