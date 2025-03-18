scoreboard players reset @s npc.count
data modify entity @s Rotation set from storage endsky_npc:common Data.Rotation
execute if data storage endsky_npc:common Data.Idle[] run function endsky_npc:idle/marker
