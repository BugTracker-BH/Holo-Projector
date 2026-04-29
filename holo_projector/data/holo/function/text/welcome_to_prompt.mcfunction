# holo:text/welcome_to_prompt — shrink intro, spawn prompt with grow-in
execute unless entity @e[tag=holo_anchor,limit=1] run return 0

# Shrink intro
execute if entity @e[tag=holo_welcome_intro,limit=1] run data modify entity @e[tag=holo_welcome_intro,limit=1] transformation.scale set value [0.1f,0.1f,0.01f]
execute if entity @e[tag=holo_welcome_intro,limit=1] run data modify entity @e[tag=holo_welcome_intro,limit=1] start_interpolation set value 70

# Spawn prompt (slightly smaller than intro)
scoreboard players operation #PROMPT_SC holo.v = #WELCOME_SC holo.v
scoreboard players set #D4 holo.v 4
scoreboard players operation #PROMPT_SC holo.v *= #D4 holo.v
scoreboard players set #D5 holo.v 5
scoreboard players operation #PROMPT_SC holo.v /= #D5 holo.v

execute at @e[tag=holo_anchor,limit=1] positioned ^0 ^0 ^-0.1 run summon text_display ~ ~ ~ {Tags:["holo_welcome_prompt","holo_text_overlay"],text:'{"text":"What would you like to display?","color":"#FFFFFF"}',see_through:1b,shadow:0b,default_background:0b,background:-2013265920,billboard:"center",alignment:"center",line_width:5000,view_range:4.0f,interpolation_duration:15,start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.1f,0.1f,0.01f]}}

# Kick prompt grow
schedule function holo:text/welcome_grow_prompt 2t

# Kill intro after its shrink completes
schedule function holo:text/welcome_kill_intro 17t
