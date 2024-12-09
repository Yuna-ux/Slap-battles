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

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 125, 0, 40)
button.Position = UDim2.new(1, -160, 0, 10)
button.AnchorPoint = Vector2.new(1, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.Text = "GOD MODE"
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true
button.Parent = screenGui

button.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-5, -5, 15)
    end
end)

-- Criando o botão "R" com a funcionalidade do botão "4"
local buttonR = Instance.new("TextButton")
buttonR.Size = UDim2.new(0, 65, 0, 65) -- Tamanho 65x65
buttonR.Text = "R"
buttonR.TextSize = 24 -- Define o tamanho da fonte como 24
buttonR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonR.TextColor3 = Color3.fromRGB(0, 0, 0) -- Cor do texto
buttonR.Position = UDim2.new(0, 10, 0, 10) -- Posicionado no topo do frame
buttonR.Parent = frame

buttonR.MouseButton1Click:Connect(function()
    -- Modifica JumpPower e força o humanoide a pular
    local originalJumpPower = humanoid.JumpPower -- Salva o valor original
    humanoid.JumpPower = 130
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    -- Espera 2 segundos
    wait(0.2)

    -- Restaura o JumpPower para o valor original
    humanoid.JumpPower = originalJumpPower

    -- Envia o evento remoto para o servidor
    local args = {
        [1] = "fullcharged"
    }
    game:GetService("ReplicatedStorage").slapstick:FireServer(unpack(args))
end)

-- Criando o botão "Y" (Aqui é o que você pediu para adicionar a funcionalidade)
local buttonY = Instance.new("TextButton")
buttonY.Size = UDim2.new(0, 65, 0, 65) -- Tamanho 65x65
buttonY.Text = "Y"
buttonY.TextSize = 24 -- Define o tamanho da fonte como 24
buttonY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonY.TextColor3 = Color3.fromRGB(0, 0, 0) -- Cor do texto
buttonY.Position = UDim2.new(0, 10, 0, 85) -- Posicionado abaixo do botão "R"
buttonY.Parent = frame

-- Criando o botão "T"
local buttonT = Instance.new("TextButton")
buttonT.Size = UDim2.new(0, 65, 0, 65) -- Tamanho 65x65
buttonT.Text = "T"
buttonT.TextSize = 24 -- Define o tamanho da fonte como 24
buttonT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonT.TextColor3 = Color3.fromRGB(0, 0, 0) -- Cor do texto
buttonT.Position = UDim2.new(0, 10, 0, 160) -- Posicionado abaixo do botão "Y"
buttonT.Parent = frame

-- Criando a animação
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://16144846625"
local animationTrack = humanoid:LoadAnimation(animation)

-- Função para ativar a habilidade e animação
local function activateAbility()
    -- Reproduz a animação
    animationTrack:Play()

    -- Envia a habilidade para o servidor
    local args = {
        [1] = "Bomb"
    }
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))

    -- Move o personagem para frente
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 30
    end
end

-- Conectando o evento de clique do botão "T"
buttonT.MouseButton1Click:Connect(activateAbility)

-- Função para executar a aura de slap
local slapDistance = 30
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false
local selectedRemote = "GeneralHit"

local function slapClosestPlayer()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = player.Character.HumanoidRootPart.Position

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
            if closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local head = closestPlayer.Character.Head
                local args = {head}
                local remote = game.ReplicatedStorage:FindFirstChild(selectedRemote)
                if remote then
                    remote:FireServer(unpack(args))
                else
                    warn("Remote not found:", selectedRemote)
                end
            end
        end
    end
end

local function rollForward()
    -- Reproduz a animação de rolagem
    animationTrackY:Play()

    -- Move o jogador para frente
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        -- Distância do movimento
        local rollDistance = 10

        -- Atualiza a posição do jogador
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * rollDistance
    end
end

-- Atribuindo funcionalidade ao botão Y
buttonY.MouseButton1Click:Connect(function()

    -- Habilitar slap aura por 0.4 segundos
    slapEnabled = true
    task.delay(0.4, function()
        slapEnabled = false -- Desativa a aura após 0.4 segundos
    end)
end)

-- Verifica continuamente a presença do jogador mais próximo durante a aura de slap
game:GetService("RunService").RenderStepped:Connect(function()
    if slapEnabled then
        slapClosestPlayer()
    end
end)
