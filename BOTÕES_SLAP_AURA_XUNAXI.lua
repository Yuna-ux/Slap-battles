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

-- Função para criar um botão
local function createButton(text, position, clickFunction)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 65, 0, 65)
    button.Text = text
    button.TextSize = 24
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.Position = position
    button.Parent = frame
    button.MouseButton1Click:Connect(clickFunction)
    return button
end

-- Função de pulo
local function jump()
    local originalJumpPower = humanoid.JumpPower
    humanoid.JumpPower = 130
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.2)
    humanoid.JumpPower = originalJumpPower

    local args = {[1] = "fullcharged"}
    game:GetService("ReplicatedStorage").slapstick:FireServer(unpack(args))
end

-- Função para a habilidade "T"
local function activateTAbility()
    local animationT = Instance.new("Animation")
    animationT.AnimationId = "rbxassetid://16144846625"
    local animationTrackT = humanoid:LoadAnimation(animationT)
    animationTrackT:Play()

    local args = {[1] = "Bomb"}
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 30
    end
end

-- Função para a habilidade "Y"
local function activateYAbility()
    local animationY = Instance.new("Animation")
    animationY.AnimationId = "rbxassetid://16102413143" -- Substitua pelo ID correto
    local animationTrackY = humanoid:LoadAnimation(animationY)
    animationTrackY:Play()

    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local rollDistance = 15
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * rollDistance
    end
end

-- Função para slap no jogador mais próximo
local function slapClosestPlayer()
    local slapDistance = 30
    local slapCooldown = 0.585
    local lastSlapTime = 0
    local slapEnabled = true

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

-- Criando os botões
local buttonR = createButton("R", UDim2.new(0, 10, 0, 10), jump)
local buttonY = createButton("Y", UDim2.new(0, 10, 0, 85), activateYAbility)
local buttonT = createButton("T", UDim2.new(0, 10, 0, 160), activateTAbility)

-- Função para o botão "GOD MODE V4"
local function toggleGodMode()
    -- A implementação do "GOD MODE" pode ser colocada aqui
end

-- Criando o botão "GOD MODE V4"
local godModeButton = Instance.new("TextButton")
godModeButton.Size = UDim2.new(0, 125, 0, 40)
godModeButton.Position = UDim2.new(1, -160, 0, 10)
godModeButton.AnchorPoint = Vector2.new(1, 0)
godModeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
godModeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
godModeButton.Text = "GOD MODE V4"
godModeButton.Font = Enum.Font.SourceSansBold
godModeButton.TextScaled = true
godModeButton.Parent = screenGui
godModeButton.MouseButton1Click:Connect(toggleGodMode)
