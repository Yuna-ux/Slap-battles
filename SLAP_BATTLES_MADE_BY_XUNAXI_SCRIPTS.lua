
--Notificação.
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Carregado, Feito por XUNAXI Scripts!",
    Icon = "rbxassetid://79497088035434",
    Text = "Divirta-se!",
    Button1 = "Sim kkk",
    Button2 = "Cancel",
    Duration = 15,
})

--Instance
local ScreenGui = Instance.new("ScreenGui")
local FrameG = Instance.new("Frame")
local cornerUi = Instance.new("UICorner")
local cornerUi2 = Instance.new("UICorner")
local CloseButton = Instance.new("TextButton")
local ButtonRojo = Instance.new("TextButton")
local ButtonNull = Instance.new("TextButton")
local ButtonError = Instance.new("TextButton")
local ButtonFish = Instance.new("TextButton")
local ButtonR1 = Instance.new("TextButton")
local ButtonR2 = Instance.new("TextButton")
local ButtonR3 = Instance.new("TextButton")
local ButtonR = Instance.new("TextButton")
--ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
--Frame
FrameG.Parent = ScreenGui
FrameG.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FrameG.Position = UDim2.new(0.2, -100, 0.5, -25)
FrameG.Size = UDim2.new(0, 475, 0, 50)
FrameG.Active = true
FrameG.Draggable = true

CloseButton.Parent = FrameG
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(-0.05, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 50)
CloseButton.Text = "X"
CloseButton.TextSize = 15
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Button ability
ButtonRojo.Parent = FrameG
ButtonRojo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonRojo.Position = UDim2.new(0, 10, 0, 5)
ButtonRojo.Size = UDim2.new(0, 45, 0, 40)
ButtonRojo.Text = "Rojo"
ButtonRojo.TextSize = 10
ButtonRojo.BorderSizePixel = 2
ButtonRojo.BorderColor3 = Color3.new(1, 1, 1)

ButtonNull.Parent = FrameG
ButtonNull.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonNull.Position = UDim2.new(0, 65, 0, 5)
ButtonNull.Size = UDim2.new(0, 45, 0, 40)
ButtonNull.Text = "Null"
ButtonNull.TextSize = 10
ButtonNull.BorderSizePixel = 2
ButtonNull.BorderColor3 = Color3.new(1, 1, 1)

ButtonError.Parent = FrameG
ButtonError.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonError.Position = UDim2.new(0, 120, 0, 5)
ButtonError.Size = UDim2.new(0, 45, 0, 40)
ButtonError.Text = "Rhythm"
ButtonError.TextSize = 10
ButtonError.BorderSizePixel = 2
ButtonError.BorderColor3 = Color3.new(1, 1, 1)

ButtonFish.Parent = FrameG
ButtonFish.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonFish.Position = UDim2.new(0, 175, 0, 5)
ButtonFish.Size = UDim2.new(0, 45, 0, 40)
ButtonFish.Text = "Killer Fish"
ButtonFish.TextSize = 8
ButtonFish.BorderSizePixel = 2
ButtonFish.BorderColor3 = Color3.new(1, 1, 1)

ButtonR1.Parent = FrameG
ButtonR1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonR1.Position = UDim2.new(0, 230, 0, 5)
ButtonR1.Size = UDim2.new(0, 45, 0, 40)
ButtonR1.Text = "Retro 1"
ButtonR1.TextSize = 8
ButtonR1.BorderSizePixel = 2
ButtonR1.BorderColor3 = Color3.new(1, 1, 1)

ButtonR2.Parent = FrameG
ButtonR2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonR2.Position = UDim2.new(0, 285, 0, 5)
ButtonR2.Size = UDim2.new(0, 45, 0, 40)
ButtonR2.Text = "Retro 2"
ButtonR2.TextSize = 8
ButtonR2.BorderSizePixel = 2
ButtonR2.BorderColor3 = Color3.new(1, 1, 1)

ButtonR3.Parent = FrameG
ButtonR3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonR3.Position = UDim2.new(0, 340, 0, 5)
ButtonR3.Size = UDim2.new(0, 45, 0, 40)
ButtonR3.Text = "Retro 3"
ButtonR3.TextSize = 8
ButtonR3.BorderSizePixel = 2
ButtonR3.BorderColor3 = Color3.new(1, 1, 1)

ButtonR.Parent = FrameG
ButtonR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonR.Position = UDim2.new(0, 395, 0, 5)
ButtonR.Size = UDim2.new(0, 45, 0, 40)
ButtonR.Text = "Piano"
ButtonR.TextSize = 8
ButtonR.BorderSizePixel = 2
ButtonR.BorderColor3 = Color3.new(1, 1, 1)
--Fishy
local replicatedStorage = game:GetService("ReplicatedStorage")
local camera = game:GetService("Workspace").CurrentCamera

-- wait for SelfKnockback 
local selfKnockback = replicatedStorage:WaitForChild("SelfKnockback")
-- function to active
local function Fish()
    local cameraLookVector = camera.CFrame.LookVector
    local knockBackDirection = Vector3.new(cameraLookVector.X, 0, cameraLookVector.Z).Unit
    knockBackDirection = knockBackDirection + (Vector3.new(0, 1, 0) * 0.5)

    selfKnockback:FireServer({
        ["Force"] = 90,
        ["Direction"] = knockBackDirection
    })
end

--Function
local function Error()
    game:GetService("ReplicatedStorage").ErrorDeath:FireServer()
end

local function Null()
    game:GetService("ReplicatedStorage").NullAbility:FireServer()
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerScripts = Player:WaitForChild("PlayerScripts")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function Rojo()
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
    game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Rojo.Animation, game.Players.LocalPlayer.Character.Humanoid):Play()
    ButtonRojo.Visible = false
    
wait(5) game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
    game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Rojo.AnimationRecoil, game.Players.LocalPlayer.Character.Humanoid):Play()
wait(3)
    ButtonRojo.Visible = true
end

local function R1()
game:GetService("ReplicatedStorage").RetroAbility:FireServer("Ban Hammer")
end

local function R2()
game:GetService("ReplicatedStorage").RetroAbility:FireServer("Rocket Launcher")
end

local function R3()
game:GetService("ReplicatedStorage").RetroAbility:FireServer("Bomb")
end

local function R()
game:GetService("ReplicatedStorage").Piano:FireServer()
end
--Button
ButtonRojo.MouseButton1Click:Connect(Rojo)
ButtonNull.MouseButton1Click:Connect(Null)
ButtonError.MouseButton1Click:Connect(Error)
ButtonFish.MouseButton1Click:Connect(Fish)
ButtonR1.MouseButton1Click:Connect(R1)
ButtonR2.MouseButton1Click:Connect(R2)
ButtonR3.MouseButton1Click:Connect(R3)
ButtonR.MouseButton1Click:Connect(R)
--Corner
cornerUi.CornerRadius = UDim.new(0, 10)
cornerUi.Parent = FrameG

cornerUi2.CornerRadius = UDim.new(0, 5)
cornerUi2.Parent = CloseButton
