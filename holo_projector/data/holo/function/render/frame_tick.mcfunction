# holo:render/frame_tick — interlaced per-tick render for animated scenes
# Cycle PARITY 0..INTERLACE-1
scoreboard players add #PARITY holo.state 1
execute if score #PARITY holo.state >= #INTERLACE holo.v run scoreboard players set #PARITY holo.state 0
function holo:render/cam_update
execute as @e[tag=projector_pixel] run function holo:render/pixel_anim
