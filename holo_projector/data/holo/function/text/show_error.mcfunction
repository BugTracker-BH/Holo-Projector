# holo:text/show_error — incompat message (unless #SILENT_ERROR set)
execute if score #SILENT_ERROR holo.tmp matches 1 run return 0
execute if score #COLS holo.v matches 32 run tellraw @s {"text":"[Holo] Incompatible with XS, please switch to a bigger projector!","color":"red"}
execute if score #COLS holo.v matches 48 run tellraw @s {"text":"[Holo] Incompatible with Small, please switch to a bigger projector!","color":"red"}
execute if score #COLS holo.v matches 64 run tellraw @s {"text":"[Holo] Incompatible with Medium, please switch to a bigger projector!","color":"red"}
execute if score #COLS holo.v matches 96 run tellraw @s {"text":"[Holo] Message too large for Large projector. Use XL.","color":"red"}
execute if score #COLS holo.v matches 128 run tellraw @s {"text":"[Holo] Message too large to fit even on XL.","color":"red"}
