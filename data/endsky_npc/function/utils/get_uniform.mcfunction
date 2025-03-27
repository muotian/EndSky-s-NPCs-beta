data modify storage endsky_npc:utils output set value {value:0}
$execute store result storage endsky_npc:utils output.value int 1 run random value $(min)..$(max)
