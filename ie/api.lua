local api = {
  clampVel = 1000,
  lib = silly
}



local funcs = {immune = false}
for _, path in pairs(listFiles("./modules")) do
for k,v in pairs(require(path)) do funcs[k]=v end end
avatar:store("movement", funcs)

---@class Interactions
---@field immune boolean

---Gets the table stored in your avatar variables.
---@return Interactions
function api.getVars()
  return funcs
end

---Registers a new function that other players can run.
---@param key string
---@param func fun(...)
function api.register(key, func)
  funcs[key] = func
end

---Toggles immunity.
---@param state boolean
function api.setImmune(state)
  funcs.immune = state
end

---Gets if you are currently immune.
function api.isImmune()
  return funcs.immune
end



local function unnan(v)
  if v.x ~= v.x then v.x = 0 end
  if v.y ~= v.y then v.y = 0 end
  if v.z ~= v.z then v.z = 0 end
  return v
end

---@package
---@return Vector3
function ie_vec(x,y,z)
  local isVec = not not type(x):find("Vector")
  return unnan(vec(
    isVec and x.x or x or 0,
    isVec and x.y or y or 0,
    isVec and x.z or z or 0
  ))
end

ie_immune = api.isImmune ---@package
ie_host = host:isHost() ---@package
ie_vel = api.clampVel ---@package
ie_api = api.lib ---@package

return api