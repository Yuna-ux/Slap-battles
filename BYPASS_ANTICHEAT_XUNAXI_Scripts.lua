-- Hook para interceptar funções críticas
local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    -- Bloqueia chamadas específicas
    if method == "FireServer" then
        local blockList = {"Ban", "WalkSpeedChanged", "AdminGUI", "GRAB"}
        if table.find(blockList, tostring(self)) then
            return -- Intercepta e bloqueia
        end
    end

    return Namecall(self, unpack(args)) -- Chama a função original
end)

-- Serviços necessários
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Função para verificar e remover anticheat
local function checkAndDestroyAntiMobileExploits()
    local player = Players.LocalPlayer
    local playerScripts = player:WaitForChild("PlayerScripts") -- Scripts do cliente
    local antiMobileExploits = playerScripts:FindFirstChild("ClientAnticheat")

    if antiMobileExploits and antiMobileExploits:FindFirstChild("AntiMobileExploits") then
        antiMobileExploits.AntiMobileExploits:Destroy()
        StarterGui:SetCore("SendNotification", {
            Title = "Bypassed",
            Text = "Anti-cheat bypassed!",
            Duration = 10,
            Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",
            Button1 = ":)"
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Anti-cheat already bypassed!",
            Duration = 10,
            Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",
            Button1 = ":)"
        })
    end
end

-- Função para deletar o evento GRAB
local function deleteGrabEvent()
    local grabEvent = ReplicatedStorage:FindFirstChild("GRAB")
    if grabEvent then
        grabEvent:Destroy()
        
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Evento Não Encontrado",
            Text = "O evento 'GRAB' não foi localizado no ReplicatedStorage.",
            Duration = 1
        })
    end
end

-- Executa as funções
checkAndDestroyAntiMobileExploits()
deleteGrabEvent()
