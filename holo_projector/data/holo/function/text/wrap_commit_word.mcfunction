# holo:text/wrap_commit_word — try to add cur_word to cur_line; else commit line and start new
execute store result score #WORDLEN holo.tmp run data get storage holo:m cur_word
execute if score #WORDLEN holo.tmp matches ..0 run return 0
execute if score #WORDLEN holo.tmp > #MAX_CHARS holo.tmp run scoreboard players set #WRAP_ERROR holo.tmp 1
execute if score #WRAP_ERROR holo.tmp matches 1.. run return 0

execute store result score #CURLEN holo.tmp run data get storage holo:m cur_line
scoreboard players operation #NEWLEN holo.tmp = #CURLEN holo.tmp
execute if score #CURLEN holo.tmp matches 1.. run scoreboard players add #NEWLEN holo.tmp 1
scoreboard players operation #NEWLEN holo.tmp += #WORDLEN holo.tmp

execute if score #NEWLEN holo.tmp <= #MAX_CHARS holo.tmp if data storage holo:m {cur_line:""} run data modify storage holo:m cur_line set from storage holo:m cur_word
execute if score #NEWLEN holo.tmp <= #MAX_CHARS holo.tmp unless data storage holo:m {cur_line:""} run function holo:text/wrap_concat_line with storage holo:m
execute if score #NEWLEN holo.tmp > #MAX_CHARS holo.tmp run function holo:text/wrap_new_line
