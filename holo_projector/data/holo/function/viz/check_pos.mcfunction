$execute at @e[tag=holo_anchor,limit=1] positioned ~$(sx) ~$(sy) ~$(sz) if block ~ ~ ~ minecraft:jukebox[has_record=true] run scoreboard players set #JUKEBOX_ACTIVE holo.state 1
