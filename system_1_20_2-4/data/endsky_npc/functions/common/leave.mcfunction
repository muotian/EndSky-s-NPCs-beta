data modify storage endsky_npc:common Data set from entity @e[limit=1,type=minecraft:marker,tag=npc.this] data
execute if data storage endsky_npc:common Data.Dialogue.Extra.LeaveCommand run function endsky_npc:common/extra/leave_command
function endsky_npc:common/end
