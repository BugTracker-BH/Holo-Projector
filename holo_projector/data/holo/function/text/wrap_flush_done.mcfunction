# holo:text/wrap_flush_done — commit remaining word + final line
function holo:text/wrap_commit_word
execute store result score #CURLEN holo.tmp run data get storage holo:m cur_line
execute if score #CURLEN holo.tmp matches 1.. run data modify storage holo:m lines append from storage holo:m cur_line
