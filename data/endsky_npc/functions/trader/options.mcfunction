scoreboard players set @s npc.state 3
scoreboard players set @s npc.option 0
scoreboard players set @s npc.look_option 0
function endsky_npc:trader/get_override with storage endsky_npc:common Data.Id
data remove storage endsky_npc:common Data.Dialogue.Option
execute positioned ~ ~1.4 ~ run function endsky_npc:trader/option/summon_b
execute positioned ~ ~1.4 ~ run function endsky_npc:trader/option/summon_s
execute if score @s npc.quest matches 0 if data storage endsky_npc:common Data.TraderNormal[] positioned ~ ~1.1 ~ run function endsky_npc:trader/option/summon_d
execute if score @s npc.quest matches 1 positioned ~ ~1.1 ~ run function endsky_npc:trader/option/summon_d
execute positioned ~ ~0.8 ~ run function endsky_npc:trader/option/summon_e
scoreboard players operation @e[tag=npc.option,tag=npc.this] npc.user = @s npc.player
function endsky_npc:actionbar/state_2
