# holo:vm/prog_rain — 120 random colored pixels
scoreboard players set #VM_HALTED holo.state 1
data modify storage holo:vm program_name set value "RAIN"
data modify storage holo:vm program set value [{o:"CLEAR"},{o:"PUSH",a:0},{o:"STORE",a:0},{o:"COLS"},{o:"RAND"},{o:"ROWS"},{o:"RAND"},{o:"GOTO"},{o:"PUSH",a:16777215},{o:"RAND"},{o:"PUSH",a:-16777216},{o:"ADD"},{o:"COLOR"},{o:"PLOT"},{o:"LOAD",a:0},{o:"PUSH",a:1},{o:"ADD"},{o:"STORE",a:0},{o:"LOAD",a:0},{o:"PUSH",a:120},{o:"LT"},{o:"JNZ",a:3},{o:"HALT"}]
function holo:vm/start
