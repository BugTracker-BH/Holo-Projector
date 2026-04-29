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

scoreboard players set #TEXT_COLOR holo.v -16711681
scoreboard players set #FORCED_SCALE holo.v 0
scoreboard players set #CHAR_SPACING holo.v 1
scoreboard players set #CHAR_STRIDE holo.v 6

scoreboard players set #ACTIVE holo.state 0
scoreboard players set #SCENE holo.state 0
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players set #PENDING_MODE holo.state 0
scoreboard players set #TRANSITIONING holo.state 0
scoreboard players set #RAINBOW holo.state 0
scoreboard players set #CLOCK_12H holo.state 0

scoreboard players set #INPUT_MODE holo.v 0

scoreboard players set #DIFFICULTY holo.v 2
scoreboard players set #PONG_SIZE_OVERRIDE holo.v 0
scoreboard players set #PONG_SENSITIVITY holo.v 20
scoreboard players set #PONG_BALL_SPEED holo.v 1

scoreboard players set #SNAKE_DIFFICULTY holo.v 2
scoreboard players set #SNAKE_SPEED holo.v 2
scoreboard players set #SNAKE_SIZE_OVERRIDE holo.v 0

scoreboard players set #RAINBOW_OFFSET holo.v 0

scoreboard players set #XRAY_Y_OFFSET holo.v 0
scoreboard players set #XRAY_PHASE holo.v 0

function holo:text/init_font
function holo:vm/load

tellraw @a [{"text":"[Holo] Loaded. ","color":"aqua"},{"text":"[Get Projector] ","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function holo:control/give_item"}},{"text":"[Get Book] ","color":"yellow","underlined":true,"click_event":{"action":"run_command","command":"/function holo:control/give_book"}},{"text":"[Get Plus Book]","color":"light_purple","underlined":true,"click_event":{"action":"run_command","command":"/function holo:control/give_book_plus"}}]
