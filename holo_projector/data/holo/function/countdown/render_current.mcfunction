# holo:countdown/render_current — compute formatted time and render
scoreboard players set #D60V holo.tmp 60
scoreboard players set #D3600V holo.tmp 3600
scoreboard players operation #CD_H holo.tmp = #CD_TOTAL holo.tmp
scoreboard players operation #CD_H holo.tmp /= #D3600V holo.tmp
scoreboard players operation #CD_REM holo.tmp = #CD_TOTAL holo.tmp
scoreboard players operation #CD_REM holo.tmp %= #D3600V holo.tmp
scoreboard players operation #CD_M holo.tmp = #CD_REM holo.tmp
scoreboard players operation #CD_M holo.tmp /= #D60V holo.tmp
scoreboard players operation #CD_S holo.tmp = #CD_REM holo.tmp
scoreboard players operation #CD_S holo.tmp %= #D60V holo.tmp

data modify storage holo:cd h_s set value ""
execute if score #CD_H holo.tmp matches 0..9 run data modify storage holo:cd h_s set value "0"
execute store result storage holo:cd h_d int 1 run scoreboard players get #CD_H holo.tmp
data modify storage holo:cd m_s set value ""
execute if score #CD_M holo.tmp matches 0..9 run data modify storage holo:cd m_s set value "0"
execute store result storage holo:cd m_d int 1 run scoreboard players get #CD_M holo.tmp
data modify storage holo:cd s_s set value ""
execute if score #CD_S holo.tmp matches 0..9 run data modify storage holo:cd s_s set value "0"
execute store result storage holo:cd s_d int 1 run scoreboard players get #CD_S holo.tmp

scoreboard players set #TEXT_COLOR holo.v -256
scoreboard players set #SILENT_ERROR holo.tmp 1

execute if score #CD_TOTAL holo.tmp matches ..59 run function holo:countdown/fmt_s with storage holo:cd
execute if score #CD_TOTAL holo.tmp matches 60..3599 run function holo:countdown/fmt_ms with storage holo:cd
execute if score #CD_TOTAL holo.tmp matches 3600.. run function holo:countdown/fmt_hms with storage holo:cd
