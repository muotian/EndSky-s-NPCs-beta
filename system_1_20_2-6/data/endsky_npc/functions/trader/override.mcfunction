data modify storage endsky_npc:common Data.Override.Extra.Hidden set value {}
data modify storage endsky_npc:common Data.Override.Extra.Hidden set from storage endsky_npc:common Data.Dialogue.Extra
data modify storage endsky_npc:common Data.Dialogue set from storage endsky_npc:common Data.Override
data remove storage endsky_npc:common Data.Override
