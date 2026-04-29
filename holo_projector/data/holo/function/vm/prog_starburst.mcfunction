# holo:vm/prog_starburst — radial beams from center, every 15 degrees, 12 colors
# Uses mem[0] = angle i, mem[1] = radius step r
scoreboard players set #VM_HALTED holo.state 1
data modify storage holo:vm program_name set value "STARBURST"
data modify storage holo:vm program set value [{o:"CLEAR"},{o:"PUSH",a:0},{o:"STORE",a:0},{o:"LOAD",a:0},{o:"PUSH",a:30},{o:"MOD"},{o:"PUSH",a:-16711681},{o:"ADD"},{o:"COLOR"},{o:"PUSH",a:1},{o:"STORE",a:1},{o:"LOAD",a:1},{o:"LOAD",a:0},{o:"COS"},{o:"MUL"},{o:"PUSH",a:1000},{o:"DIV"},{o:"HCOLS"},{o:"ADD"},{o:"LOAD",a:1},{o:"LOAD",a:0},{o:"SIN"},{o:"MUL"},{o:"PUSH",a:1000},{o:"DIV"},{o:"HROWS"},{o:"ADD"},{o:"GOTO"},{o:"PLOT"},{o:"LOAD",a:1},{o:"PUSH",a:1},{o:"ADD"},{o:"STORE",a:1},{o:"LOAD",a:1},{o:"HCOLS"},{o:"LT"},{o:"JNZ",a:11},{o:"LOAD",a:0},{o:"PUSH",a:15},{o:"ADD"},{o:"STORE",a:0},{o:"LOAD",a:0},{o:"PUSH",a:360},{o:"LT"},{o:"JNZ",a:3},{o:"HALT"}]
function holo:vm/start
