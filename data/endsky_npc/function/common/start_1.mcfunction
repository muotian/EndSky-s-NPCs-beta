# executed by marker
tag @s remove npc.idle
scoreboard players reset @s npc.idle
$data modify storage endsky_npc:common Data set from storage npc:$(region) $(npc)
$data modify storage endsky_npc:common Data.Id set value {region:$(region),npc:$(npc)}
execute store result score @s npc.trader run data get storage endsky_npc:common Data.Trader
$execute if score @s npc.trader matches 0 run function npc:$(region)/$(npc)/override
execute store success score @s npc.quest if data storage endsky_npc:common Data.Dialogue
execute if score @s npc.quest matches 0 run function endsky_npc:common/normal
$execute if score @s npc.quest matches 0 run data modify storage npc:$(region) $(npc).Normal set from storage endsky_npc:common Data.Normal
data merge entity @e[limit=1,type=minecraft:text_display,tag=npc.name,tag=npc.this] {text:{"color":"black","text":"","extra":[{"nbt":"CustomName","entity":"@e[limit=1,tag=npc.figure,tag=npc.this]","interpret":true},{"text":":"}]},start_interpolation:0,interpolation_duration:2,transformation:{translation:[0.0f,0.355f,0.0f]}}
execute if data storage endsky_npc:common Data.Dialogue.Extra.StartCommand run function endsky_npc:common/extra/start_command
execute if data storage endsky_npc:common Data{Trader:1b} run function endsky_npc:trader/interpret
function endsky_npc:common/display_text
data modify entity @s data merge from storage endsky_npc:common Data
