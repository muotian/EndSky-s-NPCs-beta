$data modify storage endsky_npc:common Data.TraderNormal set from storage npc:$(region) $(npc).TraderNormal
execute if data storage endsky_npc:common Data{TraderNormalRandom:1b} run function endsky_npc:trader/random/generate
data modify storage endsky_npc:common Data.TraderNormal[0].Extra.Hidden set value {}
data modify storage endsky_npc:common Data.TraderNormal[0].Extra.Hidden set from storage endsky_npc:common Data.Dialogue.Extra
data modify storage endsky_npc:common Data.Dialogue set from storage endsky_npc:common Data.TraderNormal[0]
data remove storage endsky_npc:common Data.TraderNormal[0].Extra.Hidden
execute unless data storage endsky_npc:common Data.TraderNormal[0].Once run data modify storage endsky_npc:common Data.TraderNormal append from storage endsky_npc:common Data.TraderNormal[0]
data remove storage endsky_npc:common Data.TraderNormal[0]
$data modify storage npc:$(region) $(npc).TraderNormal set from storage endsky_npc:common Data.TraderNormal
