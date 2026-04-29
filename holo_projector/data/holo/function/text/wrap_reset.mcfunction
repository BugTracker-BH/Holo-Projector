# holo:text/wrap_reset — init word-wrap state
data modify storage holo:m lines set value []
data modify storage holo:m cur_line set value ""
data modify storage holo:m cur_word set value ""
scoreboard players set #I holo.tmp 0
scoreboard players set #WRAP_ERROR holo.tmp 0
execute store result score #MSGLEN holo.tmp run data get storage holo:m msg
scoreboard players operation #MAX_CHARS holo.tmp = #COLS holo.v
scoreboard players set #SIXW holo.v 6
scoreboard players operation #MAX_CHARS holo.tmp /= #SIXW holo.v
