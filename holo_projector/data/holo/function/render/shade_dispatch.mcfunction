# holo:render/shade_dispatch — pick shader by #MODE and hit state
execute if score #HIT holo.tmp matches 0 run function holo:render/shade_sky
execute if score #HIT holo.tmp matches 1 if score #MODE holo.state matches 0 run function holo:render/shade_lambert
execute if score #HIT holo.tmp matches 1 if score #MODE holo.state matches 1 run function holo:render/shade_normal
execute if score #HIT holo.tmp matches 1 if score #MODE holo.state matches 2 run function holo:render/shade_depth
execute if score #HIT holo.tmp matches 1 if score #MODE holo.state matches 3 run function holo:render/shade_steps
