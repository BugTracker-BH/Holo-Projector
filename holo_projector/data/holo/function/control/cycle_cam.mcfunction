# holo:control/cycle_cam — toggle between Fixed and Free-look
scoreboard players add #CAM_MODE holo.state 1
execute if score #CAM_MODE holo.state matches 2.. run scoreboard players set #CAM_MODE holo.state 0
execute if score #CAM_MODE holo.state matches 0 run tellraw @s {"text":"[Holo] Camera: Fixed","color":"aqua"}
execute if score #CAM_MODE holo.state matches 1 run tellraw @s {"text":"[Holo] Camera: Free-look (follows player yaw)","color":"light_purple"}
# For static scenes, re-render
execute if entity @e[tag=projector_pixel,limit=1] if score #SCENE holo.state matches 1 run function holo:render/sphere_static
