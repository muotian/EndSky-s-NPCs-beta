data remove storage endsky_npc:common Data.Override
data modify storage endsky_npc:common Data.Temp set from storage endsky_npc:common Data.Dialogue
data remove storage endsky_npc:common Data.Dialogue
$function npc:$(region)/$(npc)/override
execute store success score @e[limit=1,type=minecraft:marker,tag=npc.this] npc.quest if data storage endsky_npc:common Data.Dialogue
data modify storage endsky_npc:common Data.Override set from storage endsky_npc:common Data.Dialogue
data modify storage endsky_npc:common Data.Dialogue set from storage endsky_npc:common Data.Temp
data remove storage endsky_npc:common Data.Temp
