execute store result score $soundOverride npc.count run data get storage endsky_npc:common SoundOverrides[0].index
execute if score @s npc.count = $soundOverride npc.count run data modify storage endsky_npc:common SoundPool set from storage endsky_npc:common SoundOverrides[0].pool
data remove storage endsky_npc:common SoundOverrides[0]
execute if score @s npc.count > $soundOverride npc.count if data storage endsky_npc:common SoundOverrides[] run function endsky_npc:common/playsound/override
