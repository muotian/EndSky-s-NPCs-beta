kill @e[tag=npc.demo.radio]
summon minecraft:armor_stand ~ ~ ~ {Tags:["npc.this","npc.tag","npc.figure","npc.demo.radio"],Rotation:[90.0f,0.0f],CustomName:{"text":"測試測試收音機"},ShowArms:1b,NoBasePlate:1b,NoGravity:1b,Invulnerable:1b,equipment:{feet:{id:"minecraft:leather_boots",count:1b,components:{"minecraft:dyed_color":5592490}},legs:{id:"minecraft:leather_leggings",count:1b,components:{"minecraft:dyed_color":5592405}},chest:{id:"minecraft:leather_chestplate",count:1b,components:{"minecraft:dyed_color":11206655}},head:{id:"minecraft:player_head",count:1b,components:{"minecraft:profile":"Blue_Radio"}}}}
summon minecraft:interaction ~ ~-0.05 ~ {Tags:["npc.this","npc.tag","npc.demo.radio"],width:0.6f,height:2.1f}
summon minecraft:text_display ~ ~2.475 ~ {Tags:["npc.this","npc.tag","npc.name","npc.demo.radio"],alignment:"center",billboard:"center",background:-1073741825,transformation:{translation:[0.0f,-0.255f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
function endsky_npc:common/summon {region:"demo",npc:"radio"}
