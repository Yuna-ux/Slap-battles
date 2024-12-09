loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/SLAP_AURA_MADE_BY_XUNAXI_SCRIPTS.lua"))();

loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/BOTÕES_SLAP_AURA_XUNAXI.lua"))();

loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/ANTIVOID_XUNAXI_SCRIPTS_SLAP_BATTLES.lua"))();

if hookmetamethod then
local bypass;
    bypass = hookmetamethod(game, "__namecall", function(method, ...) 
        if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
            return
        end
        return bypass(method, ...)
    end)
 else
OrionLib:MakeNotification({Name = "Error",Content = "You need to be careful, You are using executor [ "..identifyexecutor().." ] There is no bypass",Image = "rbxassetid://7733658504",Time = 5})
end
