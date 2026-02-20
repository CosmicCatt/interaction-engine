---@class Interactions
local funcs = {}

function funcs.setPos(x,y,z)
  if ie_immune() or not ie_host then return end
  local v = ie_vec(x,y,z)
  silly:setPos(v)
end

function funcs.setVel(x,y,z)
  if ie_immune() or not ie_host then return end
  local v = ie_vec(x,y,z)
  ie_api:setVelocity(v:clamped(0,ie_vel))
end

function funcs.setRot(x,y)
  if ie_immune() or not ie_host then return end
  local v = ie_vec(x,y).xy
  ie_api:setRot(v)
end

return funcs