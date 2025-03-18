scoreboard players set @s npc.look_option 0
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_a,tag=!npc.invalid,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"Data.Dialogue.Options.List[0].Option","storage":"endsky_npc:common","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_b,tag=!npc.invalid,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"Data.Dialogue.Options.List[1].Option","storage":"endsky_npc:common","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_c,tag=!npc.invalid,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"Data.Dialogue.Options.List[2].Option","storage":"endsky_npc:common","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_d,tag=!npc.invalid,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"Data.Dialogue.Options.List[3].Option","storage":"endsky_npc:common","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_e,tag=npc.this] text set value '{"color":"black","text":"離開"}'
