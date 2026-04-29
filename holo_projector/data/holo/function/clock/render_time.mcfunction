$data modify storage holo:m msg set value "DAY $(day) $(hour_s)$(hour_d):$(min_s)$(min_d)$(ampm)"
scoreboard players set #SILENT_ERROR holo.tmp 1
function holo:text/render_from_storage
