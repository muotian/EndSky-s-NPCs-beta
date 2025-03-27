execute if data storage endsky_npc:common Data{NormalRandom:1b} run function endsky_npc:common/random/generate
data modify storage endsky_npc:common Data.Dialogue set from storage endsky_npc:common Data.Normal[0]
execute unless data storage endsky_npc:common Data.Normal[0].Once run data modify storage endsky_npc:common Data.Normal append from storage endsky_npc:common Data.Normal[0]
data remove storage endsky_npc:common Data.Normal[0]
