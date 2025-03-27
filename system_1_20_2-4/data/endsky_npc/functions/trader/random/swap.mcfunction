$data modify storage endsky_npc:common Temp set from storage endsky_npc:common Data.TraderNormal[$(value)]
$data remove storage endsky_npc:common Data.TraderNormal[$(value)]
data modify storage endsky_npc:common Data.TraderNormal prepend from storage endsky_npc:common Temp
data remove storage endsky_npc:common Temp
