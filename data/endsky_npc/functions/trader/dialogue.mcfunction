data modify storage endsky_npc:common Data set from entity @s data
execute if score @s npc.quest matches 0 run function endsky_npc:trader/normal with storage endsky_npc:common Data.Id
execute if score @s npc.quest matches 1 run function endsky_npc:trader/override
data modify storage endsky_npc:common Data.Dialogue.Sub set value 1b
function endsky_npc:trader/save_trade with storage endsky_npc:common Data.Id
function endsky_npc:common/display_text
data modify entity @s data set from storage endsky_npc:common Data
