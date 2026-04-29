# holo:load
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
scoreboard players set #COLS_M1 holo.v 31
scoreboard players set #ROWS_M1 holo.v 17
scoreboard players set #PXSIZE_X100 holo.v 20
scoreboard players set #INTERLACE holo.v 2
scoreboard players set #MAX_PIX holo.v 576
scoreboard players set #TWO holo.v 2
scoreboard players set #NEG2 holo.v -2
scoreboard players set #NEG1 holo.v -1
scoreboard players set #SHL8 holo.v 256
scoreboard players set #SHL16 holo.v 65536
scoreboard players set #ALPHA_C0 holo.v -1073741824

# Text style defaults
scoreboard players set #TEXT_COLOR holo.v -16711681
scoreboard players set #FORCED_SCALE holo.v 0
scoreboard players set #CHAR_SPACING holo.v 1
scoreboard players set #CHAR_STRIDE holo.v 6

scoreboard players set #ACTIVE holo.state 0
scoreboard players set #SCENE holo.state 0

function holo:text/init_font

tellraw @a [{"text":"[Holo] Loaded. ","color":"aqua"},{"text":"[Get Projector] ","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function holo:control/give_item"}},{"text":"[Get Book]","color":"yellow","underlined":true,"click_event":{"action":"run_command","command":"/function holo:control/give_book"}}]
