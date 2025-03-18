data modify storage endsky_npc:common Data set from entity @s data
$execute if data storage endsky_npc:common Data.Dialogue.Options.List[$(index)].Condition run function endsky_npc:common/option/condition/check {index:$(index)}
execute if score $condition npc.state matches 0 run return 0
data modify storage endsky_npc:common Data.Dialogue.Sub set value 1b
$data modify storage endsky_npc:common Data.Dialogue.Texts set from storage endsky_npc:common Data.Dialogue.Options.List[$(index)].React
$execute store result storage endsky_npc:common Data.Dialogue.Options.LoopBack byte 1 run data get storage endsky_npc:common Data.Dialogue.Options.List[$(index)].LoopBack
$data modify storage endsky_npc:common Data.Dialogue.Options.List[$(index)].Extra.Hidden set value {}
$data modify storage endsky_npc:common Data.Dialogue.Options.List[$(index)].Extra.Hidden set from storage endsky_npc:common Data.Dialogue.Extra
$data modify storage endsky_npc:common Data.Dialogue.Extra set from storage endsky_npc:common Data.Dialogue.Options.List[$(index)].Extra
$data remove storage endsky_npc:common Data.Dialogue.Options.List[$(index)].Extra.Hidden
function endsky_npc:common/display_text
data modify entity @s data set from storage endsky_npc:common Data
