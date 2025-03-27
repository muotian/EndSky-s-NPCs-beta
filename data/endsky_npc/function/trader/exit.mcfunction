data modify storage endsky_npc:common Data set from entity @s data
data modify storage endsky_npc:common Data.Dialogue.Texts set from storage endsky_npc:common Data.Exit.Texts
data modify storage endsky_npc:common Data.Dialogue.End set value 1b
data modify storage endsky_npc:common Data.Exit.Extra.Hidden set value {}
data modify storage endsky_npc:common Data.Exit.Extra.Hidden set from storage endsky_npc:common Data.Dialogue.Extra
data modify storage endsky_npc:common Data.Dialogue.Extra set from storage endsky_npc:common Data.Exit.Extra
data remove storage endsky_npc:common Data.Exit.Extra.Hidden
data modify storage endsky_npc:common Data.Dialogue.Sub set value 1b
function endsky_npc:trader/save_trade with storage endsky_npc:common Data.Id
function endsky_npc:common/display_text
data modify entity @s data set from storage endsky_npc:common Data
