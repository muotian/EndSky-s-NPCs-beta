data modify storage endsky_npc:utils input set value {}
data modify storage endsky_npc:utils input.command set from storage endsky_npc:common Data.Dialogue.Extra.StartCommand
execute as @a[limit=1,tag=npc.user] run function endsky_npc:utils/execute with storage endsky_npc:utils input
