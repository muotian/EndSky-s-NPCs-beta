# executed by marker
data modify storage endsky_npc:common Condition set value {}
$data modify storage endsky_npc:common Condition set from storage endsky_npc:common Data.Dialogue.Options.List[$(index)].Condition

execute if data storage endsky_npc:common Condition{Type:"item"} run function endsky_npc:common/option/condition/item with storage endsky_npc:common Condition.Value
execute if data storage endsky_npc:common Condition{Type:"score"} run function endsky_npc:common/option/condition/score with storage endsky_npc:common Condition.Value
execute if data storage endsky_npc:common Condition{Type:"command"} run function endsky_npc:common/option/condition/command with storage endsky_npc:common Condition
