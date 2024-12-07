local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Criando o som para a notificação
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://12222242"  -- ID do som
sound.Parent = player.Character or player.CharacterAdded:Wait()

-- Enviar a notificação com som
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Carregado, Feito por XUNAXI Scripts!",
    Icon = "rbxassetid://79497088035434",
    Text = "Divirta-se!",
    Button1 = "Sim kkk",
    Button2 = "Cancel",
    Duration = 15,
})

-- Tocar o som imediatamente após a notificação
sound:Play()

-- Criando a borda preta (100x100)
local border = Instance.new("Frame", gui)
border.Size = UDim2.new(0, 100, 0, 100)
border.Position = UDim2.new(0, 80, 0, 80)
border.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
border.BorderSizePixel = 0

-- Criando o UICorner para arredondar os cantos da borda preta
local borderUICorner = Instance.new("UICorner")
borderUICorner.CornerRadius = UDim.new(0, 15)
borderUICorner.Parent = border

-- Criando o quadrado vermelho escuro (100x100) que ficará centralizado dentro da borda preta
local square = Instance.new("Frame", border)
square.Size = UDim2.new(0, 90, 0, 90)
square.Position = UDim2.new(0, 5, 0, 5)
square.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
square.BorderSizePixel = 0

-- Criando o UICorner para arredondar os cantos do quadrado
local squareUICorner = Instance.new("UICorner")
squareUICorner.CornerRadius = UDim.new(0, 20)
squareUICorner.Parent = square

-- Adicionando a letra "E" como um TextLabel dentro do quadrado vermelho
local letterE = Instance.new("TextLabel", square)
letterE.Size = UDim2.new(1, 0, 1, 0)
letterE.Position = UDim2.new(0, 0, 0, 0)
letterE.BackgroundTransparency = 1
letterE.Text = "E"
letterE.TextColor3 = Color3.fromRGB(169, 169, 169)
letterE.TextScaled = true
letterE.Font = Enum.Font.SourceSansBold

-- Criando a TextBox para o jogador escolher qual evento será chamado
local textBox = Instance.new("TextBox", gui)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0, 0, 0, 180)
textBox.PlaceholderText = "Digite o nome do evento"
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- Função para tocar a animação de slap
local function playAnimation()
    -- Verificar se o personagem está disponível
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        -- Criar e carregar a animação
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://17670135152" -- ID da animação de slap
        local track = humanoid:LoadAnimation(animation)
        
        -- Tocar a animação
        track:Play()
    end
end

-- Função para encontrar o jogador mais próximo
local function slapClosestPlayer()
    local closestPlayer
    local shortestDistance = math.huge

    -- Encontrar o jogador mais próximo
    for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Head") then
            local distance = (player.Character.Head.Position - otherPlayer.Character.Head.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    -- Dar slap no jogador mais próximo
    if closestPlayer then
        playAnimation() -- Tocar animação de slap
        local args = {
            [1] = closestPlayer.Character.Head
        }

        -- Chamar o evento digitado na TextBox
        local eventName = textBox.Text
        if game:GetService("ReplicatedStorage"):FindFirstChild(eventName) then
            game:GetService("ReplicatedStorage")[eventName]:FireServer(unpack(args))
        else
            warn("Evento não encontrado: " .. eventName)
        end
    end
end

-- Função chamada ao clicar no quadrado vermelho
local function onSquareClick()
    slapClosestPlayer()  -- Realiza o slap no jogador mais próximo
end

-- Variáveis para arrastar
local dragging = false
local dragStart
local startPos

-- Detectar clique ou toque na borda
border.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = border.Position
    end
end)

-- Parar o movimento ao soltar
border.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Atualizar a posição enquanto arrasta
border.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        
        -- Mover a borda preta
        border.Position = newPos
    end
end)

-- Detectar clique no quadrado vermelho (no UICorner)
square.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        onSquareClick()  -- Chama a função para ativar a animação
    end
end)

