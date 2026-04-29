# holo:xray/apply_y_offset — run at probe entity; shifts probe Y by XRAY_Y_OFFSET
execute store result storage holo:xr off int 1 run scoreboard players get #XRAY_Y_OFFSET holo.v
function holo:xray/tp_y with storage holo:xr
