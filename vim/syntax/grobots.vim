" Vim syntax file
" Language:	   Grobots
" Last Change: 2009-08-08
" Maintainer:  Jon Distad <jon.distad@gmail.com>

if exists("b:current_syntax")
  finish
endif

set iskeyword+=-

syn match grobotsComment   ";.*$"
syn match grobotsReaderTag "#\w\(-\?\w\)*"
syn match grobotsLabel     "\w\(-\?\w\)*:"
syn match grobotsWriteVar  "\w\(-\?\w\)*!"
syn match grobotsReferenceLabel "\w\(-\?\w\)*[&^]"
syn match grobotsConditional "\<\(ife[cg]\|n\?ifr\|c\?else\|then\|n\?if[gc]\?\)\>"
syn match grobotsRepeat "\<\(while-loop\|until-loop\|do\|\while\|until\|loop\|forever\)\>"
syn match grobotsDirective "\<\(jump\|call\|return\)\>"
syn match grobotsNoop "\<nop\>"
syn match grobotsHwInstruction "\<\(time\|world-size\|world-width\|world-height\|position\|velocity\|radius\|mass\|speed\|side\|type\|id\|parent-id\|processor\|remaining\|engine-power\|engine-max-power\|engine-velocity\|collision\|friendly-collision\|enemy-collision\|food-collision\|shot-collision\|wall-collision\|flag\|seek-location\|engine-velocity\|food-position seek-location\|seek-moving-location\|seek-location\|robot-position\|robot-velocity\|seek-moving-location\|restrict-position\|die\|write\|read\|vwrite\|vread\|messages\|send\|food-position\|receive\|clear-messages\|skip-messages\|type-population\|energy\|max-energy\|solar-cells\|eater\|eaten\|syphon-max-rate\|syphon-range\|syphon-distance\|syphon-direction\|syphon-rate\|syphoned\|constructor-max-rate\|constructor-rate\|constructor-type\|constructor-progress\|constructor-remaining\|child-id\|autoconstruct\|balance-type\|robot-sensor-range\|robot-sensor-firing-cost\|robot-sensor-time\|robot-found\|num-robot-results\|robot-position\|robot-velocity\|robot-position-overall\|robot-distance\|robot-direction\|robot-distance-overall\|robot-position-overall\|robot-direction-overall\|robot-position-overall\|robot-side\|robot-type\|robot-id\|robot-radius\|robot-mass\|robot-energy\|robot-flag\|flag\|shot-power\|robot-shield-fraction\|robot-bomb\|robot-reloading\|num-robot-results\|current-robot-result\|robot-sensor-sees-friends\|robot-sensor-sees-enemies\|shot-sensor-sees-friendly\|robot-sensor-sees-friends\|enemies\|shot-sensor-sees-enemy\|robot-sensor-focus-distance\|robot-sensor-focus-direction\|fire-robot-sensor\|next-robot\|robot-found\|periodic-robot-sensor\|armor\|max-armor\|repair-rate\|max-repair-rate\|shield\|max-shield\|shield-fraction\|last-hit\|blaster-damage\|blaster-range\|blaster-speed\|blaster-lifetime\|blaster-reload-time\|blaster-firing-cost\|blaster-cooldown\|grenades-damage\|grenades-range\|grenades-speed\|grenades-lifetime\|grenades-reload-time\|grenades-firing-cost\|grenades-cooldown\|grenades-radius\|force-field-max-power\|force-field-range\|force-field-distance\|force-field-direction\|force-field-power\|force-field-angle\|force-field-radius\|enemy-syphon-max-rate\|enemy-syphon-range\|enemy-syphon-distance\|enemy-syphon-direction\|enemy-syphon-rate\|enemy-syphoned\|fire-blaster\|fire-grenade\|lead-blaster\|lead-grenade\|set-force-field\)\>"
syn match grobotsHardware "\<\(processor\|engine\|constructor\|energy\|solar-cells\|eater\|syphon\|enemy-syphon\|robot-sensor\|food-sensor\|shot-sensor\|armor\|repair-rate\|shield\|blaster\|grenades\|force-field\|bomb\)\>"
syn match grobotsNumber "\<-\?[0-9]\+\>"
syn match grobotsFloat "\<-\?[0-9]\+\.[0-9]\+\>"
syn match grobotsLogic "\<\(not\|n\?and\|[xn]\?or\|ifev\)\>"

highlight link grobotsComment Comment
highlight link grobotsReaderTag Statement
highlight link grobotsLabel Label
highlight link grobotsReferenceLabel Label
highlight link grobotsWriteVar Special
highlight link grobotsConditional Conditional
highlight link grobotsRepeat Repeat
highlight link grobotsDirective Statement
highlight link grobotsNoop Constant
highlight link grobotsHwInstruction Delimiter
highlight link grobotsHardware Delimiter
highlight link grobotsNumber Number
highlight link grobotsFloat Float
highlight link grobotsLogic Statement

let b:current_syntax = "grobots"
