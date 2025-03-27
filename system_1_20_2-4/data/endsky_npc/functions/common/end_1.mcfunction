scoreboard players reset @s npc.count
data modify storage endsky_npc:common Data set from entity @s data
data modify entity @s Rotation set from storage endsky_npc:common Data.Rotation
execute if data storage endsky_npc:common Data.Idle[] run function endsky_npc:idle/marker
data remove storage endsky_npc:common Data.Dialogue
execute if score @s npc.trader matches 1 run function endsky_npc:trader/save_trade with storage endsky_npc:common Data.Id
data modify entity @s data set from storage endsky_npc:common Data
