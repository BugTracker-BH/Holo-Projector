# holo:xray/scan_rows — iterate rows, scan those matching current phase
execute if score #XR_R holo.tmp >= #ROWS holo.v run return 0
scoreboard players operation #XR_TEST holo.tmp = #XR_R holo.tmp
scoreboard players set #XR_D4 holo.tmp 4
scoreboard players operation #XR_TEST holo.tmp %= #XR_D4 holo.tmp
execute if score #XR_TEST holo.tmp = #XR_PHASE holo.tmp run function holo:xray/scan_cols_init
scoreboard players add #XR_R holo.tmp 1
function holo:xray/scan_rows
