-- Test Script
local DefaultConfig = {
    test = 50
}

local function InitConfigs()
    _G.test = _G.test or DefaultConfig.test
end

InitConfigs()

if type(_G.test) == "number" then
    print(_G.test)
end
