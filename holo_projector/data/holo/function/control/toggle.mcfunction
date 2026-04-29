# holo:control/toggle — spawn if inactive, despawn if active
execute if score #ACTIVE holo.state matches 0 run function holo:projector/spawn
execute if score #ACTIVE holo.state matches 1.. run function holo:projector/despawn
