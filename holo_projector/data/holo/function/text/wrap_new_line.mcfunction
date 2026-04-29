# holo:text/wrap_new_line — commit cur_line, start new with cur_word
data modify storage holo:m lines append from storage holo:m cur_line
data modify storage holo:m cur_line set from storage holo:m cur_word
