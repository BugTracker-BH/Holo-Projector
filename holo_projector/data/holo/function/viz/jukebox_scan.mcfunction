# holo:viz/jukebox_scan — scan 7x3x7 volume around anchor for jukeboxes with records
scoreboard players set #JUKEBOX_ACTIVE holo.state 0
execute unless entity @e[tag=holo_anchor,limit=1] run return 0
scoreboard players set #JX holo.tmp -3
function holo:viz/scan_x
