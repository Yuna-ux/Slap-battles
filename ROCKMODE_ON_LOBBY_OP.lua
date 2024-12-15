-- Obter o jogador e PlayerGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar efeito de flash branco
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

-- Criar uma plataforma 50x1x50 na posição (-910, 342, 1)
local function createPlatform()
    local platform = Instance.new("Part")
    platform.Size = Vector3.new(50, 0.5, 50)
    platform.Position = Vector3.new(-910, 338, 1)
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Bright green")
    platform.Name = "CustomPlatform"
    platform.Parent = game.Workspace
end
createPlatform()

task.wait(0.5)

-- Teletransportar e ajustar a rotação
local character = player.Character or player.CharacterAdded:Wait()
local teleportPosition = Vector3.new(-910, 342, 1)
local lookAtPosition = Vector3.new(-910, 342, 10)

if character and character:FindFirstChild("HumanoidRootPart") then
    local humanoidRootPart = character.HumanoidRootPart
    humanoidRootPart.CFrame = CFrame.new(teleportPosition, lookAtPosition)
    humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(90), 0)
    humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(90), 0)
end

-- Habilidades e eventos remotos
local function activateAbility(abilityName)
    for _, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
        if v.Name:find("{") then
            local args = { [1] = abilityName }
            if v:IsA("RemoteEvent") then
                v:FireServer(unpack(args))
            elseif v:IsA("RemoteFunction") then
                local result = v:InvokeServer(unpack(args))
                print("Result from InvokeServer:", result)
            end
        end
    end
end

activateAbility("Ghost")
game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
task.wait(1.7)

activateAbility("Rocky")
game:GetService("ReplicatedStorage").RockyShoot:FireServer()
task.wait(0.3)

activateAbility("Titan")
task.wait(2)

game:GetService("ReplicatedStorage").GeneralAbility:FireServer("Transform")
activateAbility("Diamond")
task.wait(1)

game:GetService("ReplicatedStorage").Rockmode:FireServer()

-- Executar script remoto
loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/BYPASS_ANTICHEAT_XUNAXI_Scripts.lua"))()
