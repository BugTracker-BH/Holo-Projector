# holo:projector/despawn
kill @e[tag=projector_pixel]
kill @e[tag=holo_anchor]
scoreboard players set #ACTIVE holo.state 0
tellraw @s {"text":"[Holo] Screen despawned.","color":"gray"}
