---@class Interactions
local funcs = {}

function funcs.throwTo(x,y,z)
  if ie_immune() or not ie_host then return end
  if not player:isLoaded() then return end
  local v = ie_vec(x,y,z)
  silly:setVelocity((v - player:getPos()):clamped(0,ie_vel))
end

function funcs.addVel(x,y,z)
  if ie_immune() or not ie_host then return end
  if not player:isLoaded() then return end
  local v = ie_vec(x,y,z)
  local vel = vec(table.unpack(player:getNbt().Motion))
  ie_api:setVelocity(vel + v:clamped(0,ie_vel))
end

return funcs