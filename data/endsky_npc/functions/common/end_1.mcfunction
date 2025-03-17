scoreboard players reset @s npc.count
data modify entity @s Rotation set from entity @s data.Rotation
execute if data entity @s data.Idle[] run function endsky_npc:idle/marker
