# holo:viz/auto_pulse_tick — triggered when jukebox detected, pulses a random bar
execute store result score #BR holo.tmp run random value 0..3
execute if score #BR holo.tmp matches 0 run function holo:viz/pulse
