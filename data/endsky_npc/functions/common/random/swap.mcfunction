$data modify storage endsky_npc:common Temp set from storage endsky_npc:common Data.Normal[$(value)]
$data remove storage endsky_npc:common Data.Normal[$(value)]
data modify storage endsky_npc:common Data.Normal prepend from storage endsky_npc:common Temp
data remove storage endsky_npc:common Temp
