# holo:xray/stop
kill @e[tag=xray_probe]
function holo:mode/stop
tellraw @s {"text":"[X-Ray] Stopped.","color":"gray"}
