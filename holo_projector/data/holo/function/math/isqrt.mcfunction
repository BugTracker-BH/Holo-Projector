# holo:math/isqrt — integer sqrt via Newton-Raphson
# input:  #IN  holo.tmp  (non-negative int)
# output: #OUT holo.tmp  (floor(sqrt(#IN)))
# Handles 0 explicitly.
execute if score #IN holo.tmp matches 0 run scoreboard players set #OUT holo.tmp 0
execute if score #IN holo.tmp matches 0 run return 0

# Initial guess x = IN/2 + 1
scoreboard players operation #X holo.tmp = #IN holo.tmp
scoreboard players operation #X holo.tmp /= #TWO holo.v
scoreboard players add #X holo.tmp 1

# 12 unrolled Newton iterations: x = (x + IN/x) / 2
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step
function holo:math/isqrt_step

scoreboard players operation #OUT holo.tmp = #X holo.tmp
