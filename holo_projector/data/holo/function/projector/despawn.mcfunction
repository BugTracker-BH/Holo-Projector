# holo:projector/despawn
kill @e[tag=projector_pixel]
kill @e[tag=holo_anchor]
kill @e[tag=holo_text_overlay]
kill @e[tag=holo_welcome_intro]
kill @e[tag=holo_welcome_prompt]
scoreboard players set #ACTIVE holo.state 0
tellraw @s {"text":"[Holo] Screen despawned.","color":"gray"}
