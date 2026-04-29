# holo:render/cam_freelook — camera orbits origin at player's yaw
# Read player yaw (degrees, signed ~-180..180)
execute store result score #YAWQ holo.tmp run data get entity @p Rotation[0] 1
# Normalize to 0..360 then to LUT idx 0..255: idx = (yaw + 180) * 256 / 360
scoreboard players add #YAWQ holo.tmp 180
scoreboard players operation #YAWQ holo.tmp *= #M256 holo.v
scoreboard players set #D360 holo.v 360
scoreboard players operation #YAWQ holo.tmp /= #D360 holo.v

scoreboard players operation #IN holo.tmp = #YAWQ holo.tmp
function holo:math/sin
scoreboard players operation #CAM_S holo.tmp = #OUT holo.tmp

scoreboard players operation #IN holo.tmp = #YAWQ holo.tmp
function holo:math/cos
scoreboard players operation #CAM_C holo.tmp = #OUT holo.tmp

# Camera pos: at angle θ, pos = (sin θ · 3000, camY, -cos θ · 3000)
scoreboard players set #D3 holo.v 3
scoreboard players operation #CAMX holo.tmp = #CAM_S holo.tmp
scoreboard players operation #CAMX holo.tmp *= #D3 holo.v
scoreboard players operation #CAMZ holo.tmp = #CAM_C holo.tmp
scoreboard players operation #CAMZ holo.tmp *= #D3 holo.v
scoreboard players operation #CAMZ holo.tmp *= #NEG1 holo.v

scoreboard players set #CAMY holo.tmp 0
execute if score #SCENE holo.state matches 4 run scoreboard players set #CAMY holo.tmp 1500
