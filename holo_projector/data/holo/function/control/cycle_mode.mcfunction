# holo:control/cycle_mode — Lambert(0) -> Normal(1) -> Depth(2) -> Steps(3)
scoreboard players add #MODE holo.state 1
execute if score #MODE holo.state matches 4.. run scoreboard players set #MODE holo.state 0
execute if score #MODE holo.state matches 0 run tellraw @s {"text":"[Holo] Shader: Lambert (diffuse)","color":"aqua"}
execute if score #MODE holo.state matches 1 run tellraw @s {"text":"[Holo] Shader: Normal debug","color":"light_purple"}
execute if score #MODE holo.state matches 2 run tellraw @s {"text":"[Holo] Shader: Depth","color":"gray"}
execute if score #MODE holo.state matches 3 run tellraw @s {"text":"[Holo] Shader: Steps (heatmap)","color":"gold"}
# For static scenes, re-render immediately; animated scenes pick up next tick.
execute if entity @e[tag=projector_pixel,limit=1] if score #SCENE holo.state matches 1 run function holo:render/sphere_static
