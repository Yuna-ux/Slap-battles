-- Test Script
local DefaultConfig = {
test = true
}

local function InitConfigs()
   _G.test = _G.test or DefaultConfig.test
end

InitConfigs()
