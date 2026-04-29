# holo:load — one-shot init on datapack (re)load
scoreboard objectives add holo.v dummy
scoreboard objectives add holo.row dummy
scoreboard objectives add holo.col dummy
scoreboard objectives add holo.tmp dummy
scoreboard objectives add holo.frame dummy
scoreboard objectives add holo.state dummy
scoreboard objectives add holo.color dummy

scoreboard players set #SCALE holo.v 1000
scoreboard players set #COLS holo.v 32
scoreboard players set #ROWS holo.v 18
scoreboard players set #MAX_PIX holo.v 576
scoreboard players set #TWO holo.v 2
scoreboard players set #NEG2 holo.v -2
scoreboard players set #NEG1 holo.v -1
scoreboard players set #THIRTYONE holo.v 31
scoreboard players set #SEVENTEEN holo.v 17
scoreboard players set #SHL8 holo.v 256
scoreboard players set #SHL16 holo.v 65536
scoreboard players set #ALPHA_C0 holo.v -1073741824
# Center offsets so grid is centered on anchor. Spacing 0.2 blocks.
# col center: (c - 15.5) * 0.2 ; row center: (8.5 - r) * 0.2
# We'll compute these via `store result ... float 0.2` directly from signed ints.

scoreboard players set #ACTIVE holo.state 0
scoreboard players set #SCENE holo.state 0
scoreboard players set #PARITY holo.state 0
scoreboard players set #FRAME holo.frame 0

scoreboard players set #MODE holo.state 0
scoreboard players set #CAM_MODE holo.state 0
function holo:math/init_sin
tellraw @a [{"text":"[Holo] Loaded (Phases 1-3). ","color":"aqua"},{"text":"[Get Projector] ","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function holo:control/give_item"}},{"text":"[Get Book]","color":"yellow","underlined":true,"click_event":{"action":"run_command","command":"/function holo:control/give_book"}}]
