# holo:text/clear — remove any text overlays from the projector
kill @e[tag=holo_text_overlay]
kill @e[tag=holo_welcome_intro]
kill @e[tag=holo_welcome_prompt]
tellraw @s {"text":"[Holo] Text overlays cleared.","color":"gray"}
