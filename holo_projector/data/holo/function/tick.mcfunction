# Phase 2: animated scenes render interlaced each tick
scoreboard players add #FRAME holo.frame 1
execute if score #ACTIVE holo.state matches 1 if score #SCENE holo.state matches 2.. run function holo:render/frame_tick
