# holo:xray/scan_cols — iterate cols, sample each cell
execute if score #XR_C holo.tmp >= #COLS holo.v run return 0
scoreboard players operation #XR_DX holo.tmp = #XR_C holo.tmp
scoreboard players operation #XR_DX holo.tmp -= #XR_HCOLS holo.v
scoreboard players operation #XR_DZ holo.tmp = #XR_R holo.tmp
scoreboard players operation #XR_DZ holo.tmp -= #XR_HROWS holo.v
execute store result storage holo:xr dx int 1 run scoreboard players get #XR_DX holo.tmp
execute store result storage holo:xr dz int 1 run scoreboard players get #XR_DZ holo.tmp
function holo:xray/sample with storage holo:xr
scoreboard players add #XR_C holo.tmp 1
function holo:xray/scan_cols
