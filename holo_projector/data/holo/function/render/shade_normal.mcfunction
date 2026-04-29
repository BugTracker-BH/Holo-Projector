# holo:render/shade_normal — map normal to RGB
function holo:render/normal

scoreboard players set #D127 holo.v 127
scoreboard players set #D128 holo.v 128

# R = nx*127/1000 + 128
scoreboard players operation #R_C holo.color = #NX holo.tmp
scoreboard players operation #R_C holo.color *= #D127 holo.v
scoreboard players operation #R_C holo.color /= #SCALE holo.v
scoreboard players operation #R_C holo.color += #D128 holo.v
execute if score #R_C holo.color matches 256.. run scoreboard players set #R_C holo.color 255
execute if score #R_C holo.color matches ..0 run scoreboard players set #R_C holo.color 0

scoreboard players operation #G_C holo.color = #NY holo.tmp
scoreboard players operation #G_C holo.color *= #D127 holo.v
scoreboard players operation #G_C holo.color /= #SCALE holo.v
scoreboard players operation #G_C holo.color += #D128 holo.v
execute if score #G_C holo.color matches 256.. run scoreboard players set #G_C holo.color 255
execute if score #G_C holo.color matches ..0 run scoreboard players set #G_C holo.color 0

scoreboard players operation #B_C holo.color = #NZ holo.tmp
scoreboard players operation #B_C holo.color *= #D127 holo.v
scoreboard players operation #B_C holo.color /= #SCALE holo.v
scoreboard players operation #B_C holo.color += #D128 holo.v
execute if score #B_C holo.color matches 256.. run scoreboard players set #B_C holo.color 255
execute if score #B_C holo.color matches ..0 run scoreboard players set #B_C holo.color 0

scoreboard players operation #R holo.color = #R_C holo.color
scoreboard players operation #R holo.color *= #SHL16 holo.v
scoreboard players operation #G holo.color = #G_C holo.color
scoreboard players operation #G holo.color *= #SHL8 holo.v
scoreboard players operation #ARGB holo.color = #ALPHA_C0 holo.v
scoreboard players operation #ARGB holo.color += #R holo.color
scoreboard players operation #ARGB holo.color += #G holo.color
scoreboard players operation #ARGB holo.color += #B_C holo.color
