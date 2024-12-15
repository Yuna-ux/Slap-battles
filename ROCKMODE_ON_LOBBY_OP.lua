
-- Criar efeito de flash branco
local playerGui = player:WaitForChild("PlayerGui")
local screenGui2 = Instance.new("ScreenGui")
screenGui2.Parent = playerGui

local flashFrame = Instance.new("Frame")
flashFrame.Size = UDim2.new(1, 0, 1, 0)
flashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flashFrame.BackgroundTransparency = 0
flashFrame.Parent = screenGui2

local textLabelflash = Instance.new("TextLabel")
textLabelflash.Size = UDim2.new(0, 300, 0, 50)
textLabelflash.Position = UDim2.new(0.5, -150, 0.5, -25)
textLabelflash.Font = Enum.Font.Fantasy
textLabelflash.Text = "Made by XUNAXI Scripts do not Copy"
textLabelflash.TextSize = 24
textLabelflash.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabelflash.BackgroundTransparency = 1
textLabelflash.Parent = screenGui2

task.wait(1.5)
flashFrame:Destroy()
textLabelflash:Destroy()

-- Cria uma plataforma de 50x1x50 na posição (-910, 342, 1)
local function createPlatform()
    local platform = Instance.new("Part") -- Cria uma nova peça
    platform.Size = Vector3.new(50, 0.5, 50) -- Define o tamanho da plataforma
    platform.Position = Vector3.new(-910, 338, 1) -- Define a posição da plataforma
    platform.Anchored = true -- Torna a plataforma fixa
    platform.BrickColor = BrickColor.new("Bright green") -- Define a cor da plataforma
    platform.Name = "CustomPlatform" -- Nome da plataforma
    platform.Parent = game.Workspace -- Adiciona a plataforma ao Workspace
end

createPlatform() -- Chama a função para criar a plataforma

task.wait(0.5)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Coordenadas de destino (ajuste para o local desejado)
local teleportPosition = Vector3.new(-910, 342, 1)
local lookAtPosition = Vector3.new(-910, 342, 10) -- Coordenada da parede que o personagem deve olhar

if character and character:FindFirstChild("HumanoidRootPart") then
    -- Teletransporta o personagem para a posição desejada e faz ele olhar para a parede de trás
    local humanoidRootPart = character.HumanoidRootPart
    humanoidRootPart.CFrame = CFrame.new(teleportPosition, lookAtPosition)
    
    -- Agora, gira o personagem 90 graus para a direita duas vezes (180 graus no total)
    humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(90), 0) -- Primeira rotação de 90 graus
    humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(90), 0) -- Segunda rotação de 90 graus
end

task.wait(2)

-- Função para processar _NETWORK
for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
    if v.Name:find("{") then -- Verifica se o nome contém '{'
        local args = { [1] = "Ghost" } -- Argumento para Ghost
        if v:IsA("RemoteEvent") then
            v:FireServer(unpack(args)) -- Envia para RemoteEvent
        elseif v:IsA("RemoteFunction") then
            local result = v:InvokeServer(unpack(args)) -- Responde para RemoteFunction
            print("Result from InvokeServer:", result) -- Mostra o resultado no Output
        else
            print("v is neither a RemoteEvent nor a RemoteFunction.")
        end
    end
end

-- Ativa habilidade Ghost
game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
task.wait(1.7)

-- Ativa habilidade Rocky
for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
    if v.Name:find("{") then
        local args = { [1] = "Rocky" }
        if v:IsA("RemoteEvent") then
            v:FireServer(unpack(args))
        elseif v:IsA("RemoteFunction") then
            local result = v:InvokeServer(unpack(args))
            print("Result from InvokeServer:", result)
        else
            print("v is neither a RemoteEvent nor a RemoteFunction.")
        end
    end
end

task.wait(0.7)

-- Atira com habilidade Rocky
game:GetService("ReplicatedStorage").RockyShoot:FireServer()
task.wait(0.3)

-- Ativa habilidade Titan
for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
    if v.Name:find("{") then
        local args = { [1] = "Titan" }
        if v:IsA("RemoteEvent") then
            v:FireServer(unpack(args))
        elseif v:IsA("RemoteFunction") then
            local result = v:InvokeServer(unpack(args))
            print("Result from InvokeServer:", result)
        else
            print("v is neither a RemoteEvent nor a RemoteFunction.")
        end
    end
end

task.wait(2)

-- Ativa habilidade Transform
local args = { [1] = "Transform" }
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))

-- Ativa habilidade Diamond
for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
    if v.Name:find("{") then
        local args = { [1] = "Diamond" }
        if v:IsA("RemoteEvent") then
            v:FireServer(unpack(args))
        elseif v:IsA("RemoteFunction") then
            local result = v:InvokeServer(unpack(args))
            print("Result from InvokeServer:", result)
        else
            print("v is neither a RemoteEvent nor a RemoteFunction.")
        end
    end
end

task.wait(1)

-- Ativa modo Rockmode
game:GetService("ReplicatedStorage").Rockmode:FireServer()

loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/BYPASS_ANTICHEAT_XUNAXI_Scripts.lua"))();
