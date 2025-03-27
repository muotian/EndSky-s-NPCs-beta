scoreboard players set $temp npc.state 1
execute unless data storage endsky_npc:common Data.Buy[].buy.Name unless data storage endsky_npc:common Data.Buy[].sell.Name unless data storage endsky_npc:common Data.Sell[].buy.Name unless data storage endsky_npc:common Data.Sell[].sell.Name run scoreboard players set $temp npc.state 0
execute if score $temp npc.state matches 1 run function endsky_npc:trader/interpret/main with storage endsky_npc:common Data.Id
