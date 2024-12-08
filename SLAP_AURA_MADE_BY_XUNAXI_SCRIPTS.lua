local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Locate the right hand part (may vary depending on the rig)
local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")

if rightHand then
    -- Código sem a criação do ParticleEmitter
    print("Right hand localizado: " .. rightHand.Name)
end

-- Script para ajustar a velocidade e remover eventos específicos

-- Ajusta a velocidade do personagem para 35 em loop
while true do
    if character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = 35
    end
    wait(0.1) -- Ajusta a cada 0.1 segundos para garantir a consistência
end

-- Remove eventos específicos
local function removeEvent(eventName)
    for _, child in pairs(game:GetDescendants()) do
        if child:IsA("RemoteEvent") and child.Name == eventName then
            child:Destroy()
            print("Evento '" .. eventName .. "' removido.")
        end
    end
end

-- Loop para verificar e remover os eventos
spawn(function()
    while true do
        removeEvent("Ban")
        removeEvent("AdminGUI")
        wait(1) -- Verifica a cada 1 segundo
    end
end)

    -- Function to create a new PointLight with specific settings
    local function createPointLight(parent)
        local pointLight = Instance.new("PointLight")
        pointLight.Color = Color3.fromRGB(170, 0, 255) -- Bright purple
        pointLight.Range = 12 -- Larger light radius
        pointLight.Brightness = 3 -- Increased intensity
        pointLight.Parent = parent
        return pointLight
    end

    -- Create multiple ParticleEmitters and PointLights
    for i = 1, 3 do
        
        createPointLight(rightHand)
    end
else
    warn("Right hand part not found.")
end

local ModelDeath = game:GetObjects("rbxassetid://12195574482")[1]
if ModelDeath then
    for i,a in pairs(ModelDeath.Torso:GetDescendants()) do
        if a.Name == "Attachment4" or a.Name == "Flare" or a.Name == "Star3" or a.Name == "Bits" then
            a:Destroy() 
        end
    end
    for i,a in pairs(ModelDeath.Torso:GetChildren()) do
        if a.ClassName == "Attachment" and a:FindFirstChildWhichIsA("ParticleEmitter") then
            a:Clone().Parent = game.Players.LocalPlayer.Character.Torso
        end
    end
    ModelDeath:Destroy()
end

-- Get the local player and their character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to make the character, including hair and accessories, fully black and apply a red outline
local function makeCharacterCompletelyBlack()
    for _, descendant in pairs(character:GetDescendants()) do
        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.Color = Color3.new(0, 0, 0) -- Make all body parts black
            descendant.Material = Enum.Material.SmoothPlastic
        elseif descendant:IsA("Accessory") then
            if descendant:FindFirstChild("Handle") then
                -- Turn the handle of the accessory black
                descendant.Handle.Color = Color3.new(0, 0, 0)
                descendant.Handle.Material = Enum.Material.SmoothPlastic

                -- Check for meshes or textures in the accessory's handle
                for _, child in pairs(descendant.Handle:GetDescendants()) do
                    if child:IsA("MeshPart") or child:IsA("Part") or child:IsA("UnionOperation") then
                        child.Color = Color3.new(0, 0, 0)
                        child.Material = Enum.Material.SmoothPlastic
                    elseif child:IsA("SpecialMesh") then
                        child.TextureId = "" -- Remove texture for a uniform color
                    end
                end
            end
        elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
            descendant:Destroy() -- Remove decals and textures
        elseif descendant:IsA("Clothing") or descendant:IsA("ShirtGraphic") then
            descendant:Destroy() -- Remove clothing to keep the body fully black
        end
    end

    -- Add a red outline effect to the character
    local outlineEffect = Instance.new("Highlight")
    outlineEffect.Parent = character
    outlineEffect.OutlineColor = Color3.new(1, 0, 0) -- Red outline
    outlineEffect.FillColor = Color3.new(0, 0, 0) -- Black fill
    outlineEffect.FillTransparency = 1 -- Only show the outline
end

-- Execute the function
makeCharacterCompletelyBlack()

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Criando o som para a notificação
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://74499492757133"
sound.Looped = true
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
textBox.PlaceholderText = "Nome da luva será mostrado aqui"
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- Função para pegar o nome da luva e adicionar "Hit", com exceção de casos específicos
local function verificarLuva()
    -- Verificar se o jogador tem leaderstats
    local leaderstats = player:FindFirstChild("leaderstats")
    
    if leaderstats then
        -- Obter a categoria "Glove"
        local glove = leaderstats:FindFirstChild("Glove")
        
        if glove then
            -- Pegar o nome da luva e adicionar "Hit"
            local gloveName = glove.Value
            local hitName

            -- Condicional para casos especiais
            if gloveName == "Killstreak" then
                hitName = "KSHit"
            elseif gloveName == "Titan" then
                hitName = "GeneralHit"
            elseif gloveName == "Dual" then
                hitName = "GeneralHit"  -- Exibe "GeneralHit" ao invés de "DualHit"
            elseif gloveName == "Default" then
                hitName = "b"  -- Exibe "b" ao invés de "DefaultHit"
            elseif gloveName == "Extended" then
                hitName = "b"  -- Exibe "b" ao invés de "ExtendedHit"
            else
                hitName = gloveName .. "Hit"  -- Adiciona "Hit" normalmente
            end
            
            -- Atualizar o texto da TextBox com o nome da luva + "Hit" (ou modificado para KSHit/GeneralHit)
            textBox.Text = hitName  -- A TextBox é atualizada aqui com o nome da luva + "Hit"
            
            print("O nome da luva com 'Hit' é: " .. hitName) -- Log para ver no console
        else
            print("A categoria 'Glove' não foi encontrada nos leaderstats.")
        end
    else
        print("O jogador não tem leaderstats.")
    end
end

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
        local eventToCall = game:GetService("ReplicatedStorage"):FindFirstChild(eventName)
        
        -- Se o evento não for válido, tentar "GeneralHit"
        if not eventToCall then
            print("Evento não encontrado: " .. eventName .. ". Tentando 'GeneralHit'...")
            eventToCall = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralHit")
        end
        
        -- Verificar se o evento foi encontrado e disparar
        if eventToCall then
            eventToCall:FireServer(unpack(args))
        else
            warn("Evento 'GeneralHit' também não encontrado.")
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

-- Script para ajustar a velocidade e remover eventos específicos
-- Detectar quando a tecla "E" for pressionada
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.E then
        onSquareClick()  -- Chama a função para ativar o botão vermelho
    end
end)

-- Atualizar o nome da luva na TextBox a cada 2 segundos
while true do
    verificarLuva()  -- Atualiza o nome da luva com "Hit"
    wait(2)  -- Espera 2 segundos antes de atualizar novamente
end
