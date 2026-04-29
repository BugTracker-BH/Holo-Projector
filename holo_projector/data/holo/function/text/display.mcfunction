# holo:text/display — display custom text on projector (L or XL only)
# Usage: /function holo:text/display {msg:"Your message here"}

# Guard: L or XL required (COLS >= 96)
execute unless score #COLS holo.v matches 96.. run tellraw @s {"text":"[Holo] Text display requires Large or XL projector size.","color":"red"}
execute unless score #COLS holo.v matches 96.. run return 0

# Guard: screen must exist
execute unless entity @e[tag=holo_anchor,limit=1] run tellraw @s {"text":"[Holo] No screen active. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=holo_anchor,limit=1] run return 0

# Clear any existing overlays
kill @e[tag=holo_text_overlay]
kill @e[tag=holo_welcome_intro]
kill @e[tag=holo_welcome_prompt]

# Stop any active scene rendering (so pixels don't overwrite black canvas)
scoreboard players set #SCENE holo.state 0
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

# Spawn overlay with message at small scale
$execute at @e[tag=holo_anchor,limit=1] positioned ^0 ^0 ^-0.1 run summon text_display ~ ~ ~ {Tags:["holo_text_overlay","holo_custom_text"],text:'{"text":"$(msg)","color":"#00FFFF","bold":true}',see_through:1b,shadow:0b,default_background:0b,background:-2013265920,billboard:"center",alignment:"center",line_width:5000,view_range:4.0f,interpolation_duration:15,start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.1f,0.1f,0.01f]}}

# Schedule grow
schedule function holo:text/display_grow 2t

$tellraw @s [{"text":"[Holo] Displaying: ","color":"aqua"},{"text":"$(msg)","color":"white","bold":true}]
