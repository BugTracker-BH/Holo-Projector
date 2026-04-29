# x = (x + IN/x) / 2
scoreboard players operation #NX holo.tmp = #IN holo.tmp
scoreboard players operation #NX holo.tmp /= #X holo.tmp
scoreboard players operation #X holo.tmp += #NX holo.tmp
scoreboard players operation #X holo.tmp /= #TWO holo.v
