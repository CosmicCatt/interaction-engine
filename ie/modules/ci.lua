local funcs = {}

function funcs.SetPos(x,y,z)
  if ie_immune() or not ie_host then return end
  local v = ie_vec(x,y,z)
  silly:setPos(v)
end

function funcs.SetVelocity(x,y,z)
  if ie_immune() or not ie_host then return end
  local v = ie_vec(x,y,z)
  ie_api:setVelocity(v:clamped(0,ie_vel))
end

function funcs.ThrowToPos(x,y,z)
  if ie_immune() or not ie_host then return end
  if not player:isLoaded() then return end
  local v = ie_vec(x,y,z)
  silly:setVelocity((v - player:getPos()):clamped(0,ie_vel))
end

function funcs.AddVelocity(x,y,z)
  if ie_immune() or not ie_host then return end
  if not player:isLoaded() then return end
  local v = ie_vec(x,y,z)
  local vel = vec(table.unpack(player:getNbt().Motion))
  ie_api:setVelocity(vel + v:clamped(0,ie_vel))
end

avatar:store("MovementAPI", funcs)
return {}