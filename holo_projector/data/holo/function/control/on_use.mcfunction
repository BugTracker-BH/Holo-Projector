# holo:control/on_use — fired by using_item advancement reward
# Immediately revoke so the trigger can fire again next use
advancement revoke @s only holo:use_projector

# Sneak + use -> cycle shader (Phase 2 placeholder: message only)
# Normal use -> toggle projector on/off
execute if entity @s[predicate=holo:sneaking] run function holo:control/cycle_mode
execute unless entity @s[predicate=holo:sneaking] run function holo:control/toggle
