local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Criando o ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyScreenGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Criando o Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 80, 0, 220) -- Ajustado para acomodar os três botões
frame.Position = UDim2.new(1, -90, 0, 40) -- Posicionado no canto superior direito
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- Criando o botão "R"
local buttonR = Instance.new("TextButton")
buttonR.Size = UDim2.new(0, 65, 0, 65)
buttonR.Text = "R"
buttonR.TextSize = 24
buttonR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonR.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonR.Position = UDim2.new(0, 10, 0, 10)
buttonR.Parent = frame

buttonR.MouseButton1Click:Connect(function()
    local originalJumpPower = humanoid.JumpPower
    humanoid.JumpPower = 130
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.2)
    humanoid.JumpPower = originalJumpPower

    local args = {[1] = "fullcharged"}
    game:GetService("ReplicatedStorage").slapstick:FireServer(unpack(args))
end)

-- Criando o botão "Y"
local buttonY = Instance.new("TextButton")
buttonY.Size = UDim2.new(0, 65, 0, 65)
buttonY.Text = "Y"
buttonY.TextSize = 24
buttonY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonY.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonY.Position = UDim2.new(0, 10, 0, 85)
buttonY.Parent = frame

-- Criando o botão "T"
local buttonT = Instance.new("TextButton")
buttonT.Size = UDim2.new(0, 65, 0, 65)
buttonT.Text = "T"
buttonT.TextSize = 24
buttonT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonT.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonT.Position = UDim2.new(0, 10, 0, 160)
buttonT.Parent = frame

-- Criando a animação para "T"
local animationT = Instance.new("Animation")
animationT.AnimationId = "rbxassetid://16144846625"
local animationTrackT = humanoid:LoadAnimation(animationT)

-- Função para habilidade "T"
local function activateAbility()
    animationTrackT:Play()
    local args = {[1] = "Bomb"}
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 30
    end
end

buttonT.MouseButton1Click:Connect(activateAbility)

-- Criando a animação para "Y"
local animationY = Instance.new("Animation")
animationY.AnimationId = "rbxassetid://16102413143" -- Substitua pelo ID correto
local animationTrackY = humanoid:LoadAnimation(animationY)

-- Função para rolar para frente
local function rollForward()
    animationTrackY:Play()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local rollDistance = 15
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * rollDistance
    end
end

-- Variáveis para slap aura
local slapDistance = 30
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false

-- Função para slap no jogador mais próximo
local function slapClosestPlayer2()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance
    local playerPosition = character:FindFirstChild("HumanoidRootPart").Position

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
            local distance = (playerPosition - otherPlayerPosition).Magnitude

            if distance <= closestDistance then
                closestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    if closestPlayer and tick() - lastSlapTime >= slapCooldown then
        lastSlapTime = tick()
        local head = closestPlayer.Character:FindFirstChild("Head")
        if head then
            local args = {head}
            local remote = game.ReplicatedStorage:FindFirstChild("GeneralHit")
            if remote then
                remote:FireServer(unpack(args))
            end
        end
    end
end

-- Evento do botão "Y"
buttonY.MouseButton1Click:Connect(function()
    rollForward()
    slapEnabled = true
    task.delay(0.4, function()
        slapEnabled = false
    end)
end)

-- Verifica continuamente para aplicar slap aura
game:GetService("RunService").RenderStepped:Connect(function()
    if slapEnabled then
        slapClosestPlayer2()
     end
end)

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 125, 0, 40)
button.Position = UDim2.new(1, -160, 0, 10)
button.AnchorPoint = Vector2.new(1, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.Text = "GOD MODE V4"
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true
button.Parent = screenGui

button.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-5, -5, 15)
    end
end)
