# holo:vm/prog_spiral — loads an Archimedean spiral program and starts
scoreboard players set #VM_HALTED holo.state 1
data modify storage holo:vm program_name set value "SPIRAL"
data modify storage holo:vm program set value [{o:"CLEAR"},{o:"PUSH",a:-16711681},{o:"COLOR"},{o:"PUSH",a:0},{o:"STORE",a:0},{o:"LOAD",a:0},{o:"PUSH",a:10},{o:"DIV"},{o:"LOAD",a:0},{o:"COS"},{o:"MUL"},{o:"PUSH",a:1000},{o:"DIV"},{o:"HCOLS"},{o:"ADD"},{o:"LOAD",a:0},{o:"PUSH",a:10},{o:"DIV"},{o:"LOAD",a:0},{o:"SIN"},{o:"MUL"},{o:"PUSH",a:1000},{o:"DIV"},{o:"HROWS"},{o:"ADD"},{o:"GOTO"},{o:"PLOT"},{o:"LOAD",a:0},{o:"PUSH",a:3},{o:"ADD"},{o:"STORE",a:0},{o:"LOAD",a:0},{o:"PUSH",a:720},{o:"LT"},{o:"JNZ",a:5},{o:"HALT"}]
function holo:vm/start
