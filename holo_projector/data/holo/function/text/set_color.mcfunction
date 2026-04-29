# holo:text/set_color — set text color by name
# Usage: /function holo:text/set_color {color:"RED"}
$data modify storage holo:m req_color set value "$(color)"
execute if data storage holo:m {req_color:"WHITE"} run scoreboard players set #TEXT_COLOR holo.v -1
execute if data storage holo:m {req_color:"RED"} run scoreboard players set #TEXT_COLOR holo.v -65536
execute if data storage holo:m {req_color:"GREEN"} run scoreboard players set #TEXT_COLOR holo.v -16711936
execute if data storage holo:m {req_color:"BLUE"} run scoreboard players set #TEXT_COLOR holo.v -16776961
execute if data storage holo:m {req_color:"CYAN"} run scoreboard players set #TEXT_COLOR holo.v -16711681
execute if data storage holo:m {req_color:"YELLOW"} run scoreboard players set #TEXT_COLOR holo.v -256
execute if data storage holo:m {req_color:"MAGENTA"} run scoreboard players set #TEXT_COLOR holo.v -65281
execute if data storage holo:m {req_color:"PINK"} run scoreboard players set #TEXT_COLOR holo.v -30977
execute if data storage holo:m {req_color:"ORANGE"} run scoreboard players set #TEXT_COLOR holo.v -30720
execute if data storage holo:m {req_color:"PURPLE"} run scoreboard players set #TEXT_COLOR holo.v -8388353
execute if data storage holo:m {req_color:"LIME"} run scoreboard players set #TEXT_COLOR holo.v -8323328
$tellraw @s [{"text":"[Holo] Text color set to ","color":"aqua"},{"text":"$(color)","color":"white","bold":true}]
tellraw @s {"text":"[Holo] Available: WHITE RED GREEN BLUE CYAN YELLOW MAGENTA PINK ORANGE PURPLE LIME","color":"dark_gray"}
