local ie = require("ie.api")

function events.entity_init()
  ie.picker[player:getUUID()].setVel(0,1)
end