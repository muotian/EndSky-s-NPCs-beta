scoreboard players set $demo.sus_mysterious_stone quest.state 3
scoreboard players add $system quest.version 1
scoreboard players operation @a quest.version = $system quest.version
clear @s minecraft:stone[minecraft:custom_data~{mysterious_stone:{},not_mysterious_stone:{}}] 3
