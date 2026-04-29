# holo:render/shade_depth — depth-based grayscale on hit
# brightness b in 0..255; closer = brighter
# b = 255 - clamp((T - 1500) / 10, 0, 255)
scoreboard players operation #B holo.tmp = #T holo.tmp
scoreboard players remove #B holo.tmp 1500
scoreboard players set #D10 holo.v 10
scoreboard players operation #B holo.tmp /= #D10 holo.v
execute if score #B holo.tmp matches ..0 run scoreboard players set #B holo.tmp 0
execute if score #B holo.tmp matches 256.. run scoreboard players set #B holo.tmp 255
scoreboard players operation #B holo.tmp *= #NEG1 holo.v
scoreboard players add #B holo.tmp 255

# ARGB = 0xC0 | (B<<16) | (B<<8) | B   ; alpha 0xC0 = solid-ish
scoreboard players operation #R holo.color = #B holo.tmp
scoreboard players operation #R holo.color *= #SHL16 holo.v
scoreboard players operation #G holo.color = #B holo.tmp
scoreboard players operation #G holo.color *= #SHL8 holo.v
scoreboard players operation #ARGB holo.color = #ALPHA_C0 holo.v
scoreboard players operation #ARGB holo.color += #R holo.color
scoreboard players operation #ARGB holo.color += #G holo.color
scoreboard players operation #ARGB holo.color += #B holo.tmp
