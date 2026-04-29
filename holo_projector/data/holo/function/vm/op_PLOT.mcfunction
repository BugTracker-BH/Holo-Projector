# holo:vm/op_PLOT — draw at turtle if in bounds, with VM_COLOR
scoreboard players operation #X_P holo.tmp = #VM_TX holo.tmp
scoreboard players operation #Y_P holo.tmp = #VM_TY holo.tmp
execute if score #X_P holo.tmp matches 0.. if score #Y_P holo.tmp matches 0.. if score #X_P holo.tmp < #COLS holo.v if score #Y_P holo.tmp < #ROWS holo.v run function holo:vm/plot_at
