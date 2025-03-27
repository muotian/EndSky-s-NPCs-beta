data modify storage endsky_npc:common Data.Buy set from entity @e[limit=1,type=minecraft:villager,tag=npc.trader_b,tag=npc.this] Offers.Recipes
data modify storage endsky_npc:common Data.Sell set from entity @e[limit=1,type=minecraft:villager,tag=npc.trader_s,tag=npc.this] Offers.Recipes
$data modify storage npc:$(region) $(npc).Buy set from storage endsky_npc:common Data.Buy
$data modify storage npc:$(region) $(npc).Sell set from storage endsky_npc:common Data.Sell
