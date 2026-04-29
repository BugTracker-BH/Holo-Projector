# holo:render/frame_tick — interlaced per-tick render for animated scenes
scoreboard players operation #PARITY holo.state *= #NEG1 holo.v
scoreboard players add #PARITY holo.state 1
function holo:render/cam_update
execute as @e[tag=projector_pixel] run function holo:render/pixel_anim
