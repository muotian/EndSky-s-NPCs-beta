data modify storage endsky_npc:common SoundPool set value []
data modify storage endsky_npc:common SoundPool set from storage endsky_npc:common Data.SoundPool
execute as @s[tag=npc.idle] run data modify storage endsky_npc:common SoundPool set from storage endsky_npc:common Data.Idle[0].SoundPool

data modify storage endsky_npc:common SoundOverrides set value []
execute as @s[tag=!npc.idle] unless data storage endsky_npc:common Data{End:1b} run data modify storage endsky_npc:common SoundOverrides set from storage endsky_npc:common Data.Dialogue.Extra.SoundOverrides
execute as @s[tag=!npc.idle] if data storage endsky_npc:common Data{End:1b} run data modify storage endsky_npc:common SoundOverrides set from storage endsky_npc:common Data.Exit.Extra.SoundOverrides
execute if data storage endsky_npc:common SoundOverrides[] run function endsky_npc:common/playsound/override
execute as @s[tag=!npc.idle] unless data storage endsky_npc:common Data{End:1b} run data modify storage endsky_npc:common Data.Dialogue.Extra.SoundOverrides set from storage endsky_npc:common SoundOverrides
execute as @s[tag=!npc.idle] if data storage endsky_npc:common Data{End:1b} run data modify storage endsky_npc:common Data.Exit.Extra.SoundOverrides set from storage endsky_npc:common SoundOverrides

execute store result storage endsky_npc:common Sound.pool_size int 1 if data storage endsky_npc:common SoundPool[]
execute unless data storage endsky_npc:common Sound{pool_size:0} unless data storage endsky_npc:common Sound{pool_size:1} run function endsky_npc:common/playsound/shuffle with storage endsky_npc:common Sound

execute if data storage endsky_npc:common SoundPool[] unless data storage endsky_npc:common SoundPool[0].setting run data modify storage endsky_npc:common SoundPool[0].setting set value {}
execute if data storage endsky_npc:common SoundPool[] at @s run function endsky_npc:common/playsound/process with storage endsky_npc:common SoundPool[0]
execute unless data storage endsky_npc:common SoundPool[] at @s run function endsky_npc:common/playsound/process {id:"minecraft:entity.villager.ambient",setting:{}}
