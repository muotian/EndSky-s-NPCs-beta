data modify storage endsky_npc:trader Interpret.LootTable set value {buy:"endsky_npc:empty",buyB:"endsky_npc:empty",sell:"endsky_npc:empty"}
data modify storage endsky_npc:trader Interpret.LootTable.buy set from storage endsky_npc:trader Interpret.Sell[0].buy.Name
data modify storage endsky_npc:trader Interpret.LootTable.buyB set from storage endsky_npc:trader Interpret.Sell[0].buyB.Name
data modify storage endsky_npc:trader Interpret.LootTable.sell set from storage endsky_npc:trader Interpret.Sell[0].sell.Name

function endsky_npc:trader/interpret/loot_table with storage endsky_npc:trader Interpret.LootTable

data modify storage endsky_npc:trader Interpreted.Sell append from storage endsky_npc:trader Interpret.Sell[0]
data remove storage endsky_npc:trader Interpret.Sell[0]

data remove storage endsky_npc:trader Interpreted.Sell[-1].buy.Name
execute unless data storage endsky_npc:trader Interpret.Item.buy{id:"minecraft:air"} run data modify storage endsky_npc:trader Interpreted.Sell[-1].buy.id set from storage endsky_npc:trader Interpret.Item.buy.id
execute if data storage endsky_npc:trader Interpret.Item.buy.components run data modify storage endsky_npc:trader Interpreted.Sell[-1].buy.components set from storage endsky_npc:trader Interpret.Item.buy.components
execute unless data storage endsky_npc:trader Interpreted.Sell[-1].buy.count run data modify storage endsky_npc:trader Interpreted.Sell[-1].buy.count set value 1b

data remove storage endsky_npc:trader Interpreted.Sell[-1].buyB.Name
execute unless data storage endsky_npc:trader Interpret.Item.buyB{id:"minecraft:air"} run data modify storage endsky_npc:trader Interpreted.Sell[-1].buyB.id set from storage endsky_npc:trader Interpret.Item.buyB.id
execute if data storage endsky_npc:trader Interpret.Item.buyB.components run data modify storage endsky_npc:trader Interpreted.Sell[-1].buyB.components set from storage endsky_npc:trader Interpret.Item.buyB.components

data remove storage endsky_npc:trader Interpreted.Sell[-1].sell.Name
execute unless data storage endsky_npc:trader Interpret.Item.sell{id:"minecraft:air"} run data modify storage endsky_npc:trader Interpreted.Sell[-1].sell.id set from storage endsky_npc:trader Interpret.Item.sell.id
execute if data storage endsky_npc:trader Interpret.Item.sell.components run data modify storage endsky_npc:trader Interpreted.Sell[-1].sell.components set from storage endsky_npc:trader Interpret.Item.sell.components
execute unless data storage endsky_npc:trader Interpreted.Sell[-1].sell.count run data modify storage endsky_npc:trader Interpreted.Sell[-1].sell.count set value 1b

item replace entity @e[limit=1,type=minecraft:item_display,tag=npc.trader_interpret] container.0 with minecraft:air

execute if data storage endsky_npc:trader Interpret.Sell[0] run function endsky_npc:trader/interpret/sell
