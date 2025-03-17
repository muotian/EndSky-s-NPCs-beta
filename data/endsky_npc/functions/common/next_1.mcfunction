# executed by marker
data modify storage endsky_npc:common Data set from entity @s data
execute unless data storage endsky_npc:common Data.Dialogue.Texts[] run function endsky_npc:common/empty
execute if data storage endsky_npc:common Data.Dialogue.Texts[] run function endsky_npc:common/display_text
data modify entity @s data set from storage endsky_npc:common Data
