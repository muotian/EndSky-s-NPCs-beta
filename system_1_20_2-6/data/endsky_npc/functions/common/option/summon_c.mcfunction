scoreboard players set $condition npc.state 1
execute if data storage endsky_npc:common Data.Dialogue.Options.List[2].Condition run function endsky_npc:common/option/condition/check {index:2}
summon minecraft:interaction ~ ~ ~ {Tags:["npc.tag","npc.option","npc.option_c","npc.this"],width:1.0f,height:0.25f}
summon minecraft:text_display ~ ~ ~ {Tags:["npc.tag","npc.option","npc.option_c","npc.this"],text:'{"color":"black","text":""}',alignment:"center",billboard:"vertical",background:-1073741825,transformation:{translation:[0.0f,0.0f,0.5f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.8f,0.8f,0.8f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute if score $condition npc.state matches 0 run tag @e[tag=npc.option_c,tag=npc.this] add npc.invalid
execute if score $condition npc.state matches 0 run data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_c,tag=npc.this] text set value '{"color":"gray","text":"","extra":[{"nbt":"Data.Dialogue.Options.List[2].Option","storage":"endsky_npc:common","interpret":true}]}'
execute if score $condition npc.state matches 1 run data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_c,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"Data.Dialogue.Options.List[2].Option","storage":"endsky_npc:common","interpret":true}]}'
