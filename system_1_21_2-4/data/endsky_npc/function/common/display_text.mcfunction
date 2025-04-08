# executed by marker
execute if score @s npc.count = @s npc.count run scoreboard players add @s npc.count 1
execute unless score @s npc.count = @s npc.count run scoreboard players set @s npc.count 0

function endsky_npc:common/playsound/main

data merge entity @e[type=minecraft:text_display,limit=1,tag=npc.text,tag=npc.this] {text:'{"color":"black","text":"","extra":[{"nbt":"Data.Dialogue.Texts[0]","storage":"endsky_npc:common","interpret":true}]}',transformation:{scale:[1.0f,1.0f,1.0f]}}
data remove storage endsky_npc:common Data.Dialogue.Texts[0]
execute as @a[tag=npc.user] run function endsky_npc:actionbar/state_1
