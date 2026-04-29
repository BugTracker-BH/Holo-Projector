# holo:vm/prog_wave — sine wave across full width
# mem[0]=x, plot y = HROWS + sin(x*deg_step)*amp
scoreboard players set #VM_HALTED holo.state 1
data modify storage holo:vm program_name set value "WAVE"
data modify storage holo:vm program set value [{o:"CLEAR"},{o:"PUSH",a:-256},{o:"COLOR"},{o:"PUSH",a:0},{o:"STORE",a:0},{o:"LOAD",a:0},{o:"LOAD",a:0},{o:"PUSH",a:15},{o:"MUL"},{o:"SIN"},{o:"HROWS"},{o:"MUL"},{o:"PUSH",a:1500},{o:"DIV"},{o:"HROWS"},{o:"ADD"},{o:"GOTO"},{o:"PLOT"},{o:"LOAD",a:0},{o:"PUSH",a:1},{o:"ADD"},{o:"STORE",a:0},{o:"LOAD",a:0},{o:"COLS"},{o:"LT"},{o:"JNZ",a:5},{o:"HALT"}]
function holo:vm/start
