kill @e[tag=npc.demo.howhow]
summon minecraft:armor_stand ~ ~ ~ {Tags:["npc.this","npc.tag","npc.figure","npc.demo.howhow"],Rotation:[90.0f,0.0f],CustomName:'{"text":"宇貓教主--先知浩浩"}',ShowArms:1b,NoBasePlate:1b,NoGravity:1b,Invulnerable:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:2105376}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2105376}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2105376}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"leon_and_howhow"}}]}
summon minecraft:interaction ~ ~-0.05 ~ {Tags:["npc.this","npc.tag","npc.demo.howhow"],width:0.6f,height:2.1f}
summon minecraft:text_display ~ ~2.475 ~ {Tags:["npc.this","npc.tag","npc.name","npc.demo.howhow"],billboard:"center",background:-1073741825,transformation:{translation:[0.0f,-0.255f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
function endsky_npc:common/summon {region:"demo",npc:"howhow"}
