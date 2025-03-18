# executed by marker
scoreboard players reset @s npc.count
execute if data storage endsky_npc:common Data.Dialogue{End:1b} run scoreboard players set $next npc.state 0
execute if score @s npc.trader matches 1 if data storage endsky_npc:common Data.Dialogue{Option:1b} if data storage endsky_npc:common Data.Dialogue{End:1b} run scoreboard players set $next npc.state 3
execute if score $next npc.state matches 1 if data storage endsky_npc:common Data.Dialogue.Options run scoreboard players set $next npc.state 2
execute if score $next npc.state matches 1 if score @s npc.trader matches 1 run scoreboard players set $next npc.state 3
execute if score $next npc.state matches 1 if score @s npc.trader matches 0 run scoreboard players set $next npc.state 0
execute if score $next npc.state matches 0 if data storage endsky_npc:common Data.Dialogue.Extra.EndCommand run function endsky_npc:common/extra/end_command
execute if score $next npc.state matches 2..3 if data storage endsky_npc:common Data.Dialogue{Sub:1b} if data storage endsky_npc:common Data.Dialogue.Extra.EndCommand run function endsky_npc:common/extra/end_command
execute if data storage endsky_npc:common Data.Dialogue.Extra.Hidden run data modify storage endsky_npc:common Data.Dialogue.Extra set from storage endsky_npc:common Data.Dialogue.Extra.Hidden
execute if score $next npc.state matches 0 if data storage endsky_npc:common Data.Dialogue{Sub:1b} if data storage endsky_npc:common Data.Dialogue.Extra.EndCommand run function endsky_npc:common/extra/end_command

execute if score $next npc.state matches 0 run data remove storage endsky_npc:common Data.Dialogue
execute if score $next npc.state matches 0 run execute if score @s npc.trader matches 1 run function endsky_npc:trader/save_trade with storage endsky_npc:common Data.Id
