scoreboard players set $refresh npc.look_option 0
execute if data storage endsky_npc:common Data.Dialogue.Options.List[0].Condition run function endsky_npc:common/option/condition/update_a
execute if data storage endsky_npc:common Data.Dialogue.Options.List[1].Condition run function endsky_npc:common/option/condition/update_b
execute if data storage endsky_npc:common Data.Dialogue.Options.List[2].Condition run function endsky_npc:common/option/condition/update_c
execute if data storage endsky_npc:common Data.Dialogue.Options.List[3].Condition run function endsky_npc:common/option/condition/update_d
execute if score $refresh npc.look_option matches 1 run scoreboard players set @s npc.look_option 0
