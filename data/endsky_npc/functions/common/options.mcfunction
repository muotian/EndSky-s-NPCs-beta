scoreboard players set @s npc.state 2
scoreboard players set @s npc.option 0
scoreboard players set @s npc.look_option 0
execute store result score $count npc.option if data storage endsky_npc:common Data.Dialogue.Options.List[]
execute if score $count npc.option matches 1 run function endsky_npc:common/option/summon_1
execute if score $count npc.option matches 2 run function endsky_npc:common/option/summon_2
execute if score $count npc.option matches 3 run function endsky_npc:common/option/summon_3
execute if score $count npc.option matches 4 run function endsky_npc:common/option/summon_4
scoreboard players operation @e[tag=npc.option,tag=npc.this] npc.user = @s npc.player
function endsky_npc:actionbar/state_2
