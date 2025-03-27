execute unless entity @e[tag=npc.trader_interpret] at @s run summon minecraft:item_display ~ ~ ~ {Tags:["npc.trader_interpret"],transformation:[0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f]}

data modify storage endsky_npc:common Data.Buy[].interpret set value 1b
execute if data storage endsky_npc:common Data.Buy[{interpreted:1b}] run data modify storage endsky_npc:common Data.Buy[{interpreted:1b}].interpret set value 0b
data modify storage endsky_npc:trader Interpret.Buy set value []
data modify storage endsky_npc:trader Interpret.Buy append from storage endsky_npc:common Data.Buy[{interpret:1b}]
data remove storage endsky_npc:common Data.Buy[{interpret:1b}]
data remove storage endsky_npc:common Data.Buy[].interpret
data remove storage endsky_npc:trader Interpret.Buy[].interpret

data modify storage endsky_npc:trader Interpreted.Buy set value []
execute if data storage endsky_npc:trader Interpret.Buy[] run function endsky_npc:trader/interpret/buy

data modify storage endsky_npc:common Data.Sell[].interpret set value 1b
execute if data storage endsky_npc:common Data.Sell[{interpreted:1b}] run data modify storage endsky_npc:common Data.Sell[{interpreted:1b}].interpret set value 0b
data modify storage endsky_npc:trader Interpret.Sell set value []
data modify storage endsky_npc:trader Interpret.Sell append from storage endsky_npc:common Data.Sell[{interpret:1b}]
data remove storage endsky_npc:common Data.Sell[{interpret:1b}]
data remove storage endsky_npc:common Data.Sell[].interpret
data remove storage endsky_npc:trader Interpret.Sell[].interpret

data modify storage endsky_npc:trader Interpreted.Sell set value []
execute if data storage endsky_npc:trader Interpret.Sell[] run function endsky_npc:trader/interpret/sell

data modify storage endsky_npc:common Data.Buy append from storage endsky_npc:trader Interpreted.Buy[]
data modify storage endsky_npc:common Data.Buy[].interpreted set value 1b
data modify storage endsky_npc:common Data.Sell append from storage endsky_npc:trader Interpreted.Sell[]
data modify storage endsky_npc:common Data.Sell[].interpreted set value 1b
kill @e[tag=npc.trader_interpret]

$data modify storage npc:$(region) $(npc).Buy set from storage endsky_npc:common Data.Buy
$data modify storage npc:$(region) $(npc).Sell set from storage endsky_npc:common Data.Sell
