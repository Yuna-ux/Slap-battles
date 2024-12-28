local _0x1A7B = game:GetService("Players")
local _0x2B4F = game:GetService("StarterGui")
local _0x3C5E = game:GetService("ReplicatedStorage")

local _0x4D62 = _0x1A7B.LocalPlayer
local _0x5E3F = _0x4D62:WaitForChild("PlayerScripts")
local _0x6F4A = _0x5E3F:FindFirstChild("ClientAnticheat")

local _0x7B59
_0x7B59 = hookmetamethod(game, "__namecall", function(_0x8A63, ...)
    local _0x9B74 = getnamecallmethod()
    local _0xA85C = {...}

    if _0x9B74 == "FireServer" then
        local _0xB75D = {"Ban", "WalkSpeedChanged", "AdminGUI", "GRAB"}
        if table.find(_0xB75D, tostring(_0x8A63)) then
            return
        end
    end

    return _0x7B59(_0x8A63, unpack(_0xA85C))
end)

local function _0xC82F()
    if _0x6F4A and _0x6F4A:FindFirstChild("AntiMobileExploits") then
        _0x6F4A.AntiMobileExploits:Destroy()
    else
        _0x2B4F:SetCore("SendNotification", {
            Title = "Error",
            Text = "Anti-cheat already bypassed!",
            Duration = 10,
            Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",
            Button1 = ":)"
        })
    end
end

local function _0xD91A()
    local _0xE9BB = _0x3C5E:FindFirstChild("GRAB")
    if _0xE9BB then
        _0xE9BB:Destroy()
    end
end

_0xC82F()
_0xD91A()
