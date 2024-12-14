local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
   if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "GRAB" then
       return
   end
   return Namecall(self, ...)
end)

local Players = game:GetService("Players")
local StarterPlayer = game:GetService("StarterPlayer")

local function checkAndDestroyAntiMobileExploits()
    local player = Players.LocalPlayer
    local antiMobileExploits = StarterPlayer.StarterPlayerScripts:FindFirstChild("ClientAnticheat")

    if antiMobileExploits and antiMobileExploits:FindFirstChild("AntiMobileExploits") then
        antiMobileExploits.AntiMobileExploits:Destroy()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Bypassed",Text = "anti-cheat bypassed!" ,Duration = 10, Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = ":)"})
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "anti-cheat arleady bypassed!" ,Duration = 10, Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = ":)"})
    end
end

checkAndDestroyAntiMobileExploits()
