# holo:render/dispatch — apply current scene
execute if score #SCENE holo.state matches 0 run function holo:render/test_pattern
execute if score #SCENE holo.state matches 1 run function holo:render/sphere_static
# Scenes 2+ are animated — tick handles them. Kick an immediate frame so something appears.
execute if score #SCENE holo.state matches 2.. run function holo:render/frame_tick
execute if score #SCENE holo.state matches 2.. run function holo:render/frame_tick
