local mt = {__index = function(_,uuid)
  return setmetatable({},{__index=function(_,k)
    local vars = world.avatarVars()[uuid]
    if not (vars and vars.movement) then return function() end end
    return vars.movement[k]
  end})
end}

---@class IEPicker
---@field [string] Interactions
local api = setmetatable({},mt)



---@alias IEError
---| "VARS"
---| "FUNCTION"
---| "IMMUNE"
---| "SUCCESS"

---@param entity string|Entity
---@param func string
---@return boolean, IEError, ...?
function api.runFunc(entity, func, ...)
  local vars
  if type(entity) == "string" then
    vars = world.avatarVars()[entity]
  else
    vars = entity:getVariable()
  end

  if not (vars and vars.movement) then return false, "VARS" end
  if not vars.movement[func] then return false, "FUNCTION" end

  if vars.movement.immunity then
    return true, "IMMUNE"
  else
    return true, "SUCCESS",
    vars.movement[func](...)
  end
end

return api