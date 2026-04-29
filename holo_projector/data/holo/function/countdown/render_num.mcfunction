# holo:countdown/render_num — render #CD_VALUE as giant centered number
execute store result storage holo:cd n int 1 run scoreboard players get #CD_VALUE holo.tmp
function holo:countdown/render_num_macro with storage holo:cd
