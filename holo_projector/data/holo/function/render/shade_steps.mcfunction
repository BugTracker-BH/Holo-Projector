# holo:render/shade_steps — step-count grayscale (0=cold blue, max=hot red)
# B = HSTEPS*255/24; R = B, G = B/2, Bl = 255-B  -> heatmap-ish
scoreboard players operation #B holo.tmp = #HSTEPS holo.tmp
scoreboard players set #D255 holo.v 255
scoreboard players operation #B holo.tmp *= #D255 holo.v
scoreboard players set #D24 holo.v 24
scoreboard players operation #B holo.tmp /= #D24 holo.v
execute if score #B holo.tmp matches 256.. run scoreboard players set #B holo.tmp 255
execute if score #B holo.tmp matches ..0 run scoreboard players set #B holo.tmp 0

scoreboard players operation #R_C holo.color = #B holo.tmp
scoreboard players operation #G_C holo.color = #B holo.tmp
scoreboard players set #D2c holo.v 2
scoreboard players operation #G_C holo.color /= #D2c holo.v
scoreboard players operation #B_C holo.color = #B holo.tmp
scoreboard players operation #B_C holo.color *= #NEG1 holo.v
scoreboard players add #B_C holo.color 255

scoreboard players operation #R holo.color = #R_C holo.color
scoreboard players operation #R holo.color *= #SHL16 holo.v
scoreboard players operation #G holo.color = #G_C holo.color
scoreboard players operation #G holo.color *= #SHL8 holo.v
scoreboard players operation #ARGB holo.color = #ALPHA_C0 holo.v
scoreboard players operation #ARGB holo.color += #R holo.color
scoreboard players operation #ARGB holo.color += #G holo.color
scoreboard players operation #ARGB holo.color += #B_C holo.color
