scoreboard players set @s npc.state 1
kill @e[tag=npc.option,tag=npc.this]
execute if data storage endsky_npc:common Data.Dialogue.Extra.StartCommand run function endsky_npc:common/extra/start_command
