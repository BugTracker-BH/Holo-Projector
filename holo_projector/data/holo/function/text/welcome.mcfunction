# holo:text/welcome — orchestrates intro -> prompt transition
kill @e[tag=holo_welcome_intro]
kill @e[tag=holo_welcome_prompt]
kill @e[tag=holo_text_overlay]

# Spawn intro at small scale (grow animates via interpolation)
execute at @e[tag=holo_anchor,limit=1] positioned ^0 ^0 ^-0.1 run summon text_display ~ ~ ~ {Tags:["holo_welcome_intro","holo_text_overlay"],text:'{"text":"Welcome to the Holo Projector!","color":"#00FFFF","bold":true}',see_through:1b,shadow:0b,default_background:0b,background:-2013265920,billboard:"center",alignment:"center",line_width:5000,view_range:4.0f,interpolation_duration:15,start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.1f,0.1f,0.01f]}}

# Kick the grow animation on next tick
schedule function holo:text/welcome_grow_intro 2t

# Begin transition at t=70 ticks (3.5s)
schedule function holo:text/welcome_to_prompt 70t
