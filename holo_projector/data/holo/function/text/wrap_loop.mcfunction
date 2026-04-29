# holo:text/wrap_loop — iterate each char of msg
execute if score #I holo.tmp >= #MSGLEN holo.tmp run return 0
scoreboard players operation #J holo.tmp = #I holo.tmp
scoreboard players add #J holo.tmp 1
execute store result storage holo:m si int 1 run scoreboard players get #I holo.tmp
execute store result storage holo:m sj int 1 run scoreboard players get #J holo.tmp
function holo:text/extract_char with storage holo:m
execute if data storage holo:m {char:" "} run function holo:text/wrap_handle_space
execute unless data storage holo:m {char:" "} run function holo:text/wrap_append_char with storage holo:m
scoreboard players add #I holo.tmp 1
function holo:text/wrap_loop
