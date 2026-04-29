# holo:snake/read_input — dispatcher
execute if score #INPUT_MODE holo.v matches 0 run function holo:snake/read_input_camera
execute if score #INPUT_MODE holo.v matches 1 run function holo:snake/read_input_item
