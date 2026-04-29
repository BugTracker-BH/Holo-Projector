$execute at @e[tag=holo_anchor,limit=1] positioned ^$(lx) ^$(ly) ^0 run summon text_display ~ ~ ~ {Tags:["projector_pixel","pixel_new"],text:'" "',background:-1073741824,default_background:0b,see_through:1b,shadow:0b,billboard:"center",alignment:"center",line_width:200,view_range:4.0f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.2f,0.2f,0.01f]}}
$scoreboard players set @e[tag=pixel_new,limit=1] holo.row $(r)
$scoreboard players set @e[tag=pixel_new,limit=1] holo.col $(c)
$tag @e[tag=pixel_new,limit=1] add pixel_r$(r)_c$(c)
tag @e[tag=pixel_new] remove pixel_new
