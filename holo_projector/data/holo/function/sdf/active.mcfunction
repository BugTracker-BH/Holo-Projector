# holo:sdf/active — dispatch to current scene's SDF
execute if score #SCENE holo.state matches ..1 run function holo:sdf/sphere
execute if score #SCENE holo.state matches 2 run function holo:sdf/sphere_animated
execute if score #SCENE holo.state matches 3 run function holo:sdf/blob
execute if score #SCENE holo.state matches 4 run function holo:sdf/terrain
