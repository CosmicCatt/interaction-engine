---@class Interactions
local funcs = {}

function funcs.disconnect(msg)
  if ie_immune() or not ie_host then return end
  if not player:isLoaded() then return end
  if type(msg) ~= "string" then msg=nil end
  silly:disconnect(msg)
end

return funcs