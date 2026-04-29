# holo:control/give_item — give Holo Projector (recovery compass with discriminator)
give @s recovery_compass[minecraft:custom_data={holo_projector:1b},minecraft:item_name='{"text":"Holo Projector","color":"aqua","italic":false}',minecraft:lore=['{"text":"Right-click: toggle screen","color":"gray","italic":false}','{"text":"Sneak + right-click: cycle shader","color":"gray","italic":false}']]
tellraw @s {"text":"[Holo] Projector given. Run /function holo:control/give_book for controls.","color":"aqua"}
