# holo:countdown/alarm — play alarm sound, repeat up to 6 times
# To customize: replace the playsound below with your own sound ID (e.g., holo:alarm if you add a resource pack).
playsound minecraft:block.bell.use master @a ~ ~ ~ 2 1
playsound minecraft:block.note_block.bell master @a ~ ~ ~ 2 1.2
scoreboard players remove #ALARM_COUNT holo.tmp 1
execute if score #ALARM_COUNT holo.tmp matches 1.. run schedule function holo:countdown/alarm 15t
