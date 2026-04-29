# holo:render/cam_fixed — default stationary camera (scene-dependent presets)
scoreboard players set #CAM_S holo.tmp 0
scoreboard players set #CAM_C holo.tmp 1000
scoreboard players set #CAMX holo.tmp 0
scoreboard players set #CAMY holo.tmp 0
scoreboard players set #CAMZ holo.tmp -3000
# Terrain: elevated camera looking forward (gives down-tilted view of wavy ground)
execute if score #SCENE holo.state matches 4 run scoreboard players set #CAMY holo.tmp 1500
