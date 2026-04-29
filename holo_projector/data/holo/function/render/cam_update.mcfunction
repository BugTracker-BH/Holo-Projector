# holo:render/cam_update — refresh camera once per frame
execute if score #CAM_MODE holo.state matches 0 run function holo:render/cam_fixed
execute if score #CAM_MODE holo.state matches 1 run function holo:render/cam_freelook
