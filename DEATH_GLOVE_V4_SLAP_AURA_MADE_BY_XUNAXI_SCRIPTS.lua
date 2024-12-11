

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Carregando o script! espere.",
    Icon = "rbxassetid://115726632148815",
    Text = "Script",
    Button1 = "OK",
    Duration = 7,
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/ANTIVOID_XUNAXI_SCRIPTS_SLAP_BATTLES.lua"))();

wait(0.3)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Função para ajustar a velocidade constantemente
local function setLoopSpeed()
    while true do
        humanoid.WalkSpeed = 40 -- Define a velocidade para 40
        wait(0.1) -- Aguarda 0.1 segundos antes de verificar novamente
    end
end

-- Executa a função em uma nova thread para manter o loop ativo
spawn(setLoopSpeed)

-- Localizar a mão direita (se necessário, mantendo a estrutura do código original)
local rightHalocal player = game.Players.LocalPlayer

local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")

if rightHand then
    print("Right hand localizada: " .. rightHand.Name)
else
    warn("Right hand part not found.")
end

-- Remover partículas relacionadas ao "ModelDeath"
local ModelDeath = game:GetObjects("rbxassetid://12195574482")[1]
if ModelDeath then
    for _, a in pairs(ModelDeath.Torso:GetDescendants()) do
        if a.Name == "Attachment4" or a.Name == "Flare" or a.Name == "Star3" or a.Name == "Bits" then
            a:Destroy()
        end
    end
    for _, a in pairs(ModelDeath.Torso:GetChildren()) do
        if a.ClassName == "Attachment" and a:FindFirstChildWhichIsA("ParticleEmitter") then
            a:Clone().Parent = game.Players.LocalPlayer.Character.Torso
        end
    end
    ModelDeath:Destroy()
end

-- Deixar o personagem completamente preto com um contorno vermelho
local function makeCharacterCompletelyBlack()
    for _, descendant in pairs(character:GetDescendants()) do
        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.Color = Color3.new(0, 0, 0) -- Preto
            descendant.Material = Enum.Material.SmoothPlastic
        elseif descendant:IsA("Accessory") and descendant:FindFirstChild("Handle") then
            local handle = descendant.Handle
            handle.Color = Color3.new(0, 0, 0)
            handle.Material = Enum.Material.SmoothPlastic
        elseif descendant:IsA("Decal") or descendant:IsA("Texture") or descendant:IsA("Clothing") or descendant:IsA("ShirtGraphic") then
            descendant:Destroy()
        end
    end

    local outlineEffect = Instance.new("Highlight")
    outlineEffect.Parent = character
    outlineEffect.OutlineColor = Color3.new(1, 0, 0) -- Vermelho
    outlineEffect.FillTransparency = 1 -- Apenas contorno
end

local player = game.Players.LocalPlayer
local screenGui2 = Instance.new("ScreenGui")
screenGui2.Parent = player.PlayerGui

-- Criar o efeito de flash branco
local flashFrame = Instance.new("Frame")
flashFrame.Size = UDim2.new(1, 0, 1, 0)  -- Ocupa toda a tela
flashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- Cor branca
flashFrame.BackgroundTransparency = 0  -- Sem transparência (tela cheia de branco)
flashFrame.Parent = screenGui2

-- Criar o texto no meio da tela
local textLabelflash = Instance.new("TextLabel")
textLabelflash.Size = UDim2.new(0, 300, 0, 50)  -- Tamanho do texto
textLabelflash.Position = UDim2.new(0.5, -150, 0.5, -25)  -- Posiciona o texto no centro
textLabelflash.Text = "Made by XUNAXI Scripts do not Copy or the script is deleted."
textLabelflash.TextSize = 24
textLabelflash.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Cor preta para o texto
textLabelflash.BackgroundTransparency = 1  -- Sem fundo para o texto
textLabelflash.Parent = screenGui2

-- Espera 1.5 segundos e depois remove o flash
task.wait(1.5)

-- Remove a tela branca e o texto
flashFrame:Destroy()
textLabelflash:Destroy()

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = true -- Isso impede que a GUI seja destruída quando o personagem morrer ou renasce

makeCharacterCompletelyBlack()

local buttonGOD = Instance.new("TextButton")
buttonGOD.Size = UDim2.new(0, 125, 0, 40)
buttonGOD.Position = UDim2.new(1, -90, 0, 10)
buttonGOD.AnchorPoint = Vector2.new(1, 0)
buttonGOD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonGOD.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonGOD.Text = "GOD MODE V4"
buttonGOD.Font = Enum.Font.SourceSansBold
buttonGOD.TextScaled = true
buttonGOD.Parent = gui

-- Adicionando evento ao botão
buttonGOD.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(-5, -5, 15)
    end
end)

-- Criando o botão TITAN
local buttonTITAN = Instance.new("TextButton")
buttonTITAN.Size = UDim2.new(0, 125, 0, 40)
buttonTITAN.Position = UDim2.new(1, -90, 0, -30)
buttonTITAN.AnchorPoint = Vector2.new(1, 0)
buttonTITAN.BackgroundColor3 = Color3.fromRGB(255, 165, 0) -- Laranja
buttonTITAN.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonTITAN.Text = "TITAN"
buttonTITAN.Font = Enum.Font.SourceSansBold
buttonTITAN.TextScaled = true
buttonTITAN.Parent = gui -- Certifica-se de que o botão seja filho da ScreenGui existente

-- Adicionando evento ao botão
buttonTITAN.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/TITAN_GLOVE_GIVER.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/Titan_ability.lua"))();
end)

local buttonT = Instance.new("TextButton")
buttonT.Size = UDim2.new(0, 65, 0, 65) -- Tamanho 65x65
buttonT.Text = "T"
buttonT.AnchorPoint = Vector2.new(1, 0)
buttonT.TextSize = 24 -- Define o tamanho da fonte como 24
buttonT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonT.TextColor3 = Color3.fromRGB(0, 0, 0) -- Cor do texto
buttonT.Position = UDim2.new(1, -10, 0, -5)  -- Posicionado abaixo do botão "Y"
buttonT.Parent = gui

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

local isInvisible = false -- Variável para rastrear o estado de invisibilidade

local buttonGHOST = Instance.new("TextButton")
buttonGHOST.Size = UDim2.new(0, 125, 0, 40)
buttonGHOST.Position = UDim2.new(1, -90, 0, 50)
buttonGHOST.AnchorPoint = Vector2.new(1, 0)
buttonGHOST.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
buttonGHOST.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonGHOST.Text = "INVISIBILIDADE"
buttonGHOST.Font = Enum.Font.SourceSansBold
buttonGHOST.TextScaled = true
buttonGHOST.Parent = gui

-- Função para verificar se o jogador já está com a luva "Ghost"
local function hasGhostGlove()
    local player = game.Players.LocalPlayer
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local glove = leaderstats:FindFirstChild("glove")
        if glove and glove.Value == "Ghost" then
            return true
        end
    end
    return false
end

-- Função para ativar o script adicional
local function activateScript()
    for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
        -- Verifica se o nome contém o caractere '{'
        if v.Name:find("{") then
            local args = {
                [1] = "Ghost"
            }

            -- Verifica se v é um RemoteEvent e pode chamar FireServer
            if v:IsA("RemoteEvent") then
                v:FireServer(unpack(args))
            elseif v:IsA("RemoteFunction") then
                -- Se for um RemoteFunction, usa InvokeServer
                local result = v:InvokeServer(unpack(args))
                print("Resultado do InvokeServer:", result)  -- Opcional: Imprime o resultado
            else
                print("v não é nem um RemoteEvent nem um RemoteFunction.")
            end
        end
    end
end

-- Adicionando evento ao botão
buttonGHOST.MouseButton1Click:Connect(function()
    -- Verifica se o jogador já tem a luva "Ghost"
    if not hasGhostGlove() then
        -- Ativa o script adicional se o jogador não estiver com a luva "Ghost"
        activateScript()
    end

    if not isInvisible then
        -- Ativa a invisibilidade
        game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
        buttonGHOST.Text = "VISIBILIDADE" -- Altera o texto do botão
        buttonGHOST.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Altera a cor do botão para verde
    else
        -- Desativa a invisibilidade
        game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
        buttonGHOST.Text = "INVISIBILIDADE" -- Restaura o texto do botão
        buttonGHOST.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Altera a cor do botão para vermelho
    end
    isInvisible = not isInvisible -- Alterna o estado
end)

-- Adicionando evento ao botão
buttonGOD.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(-5, -5, 15)
    end
end)

local buttonR = Instance.new("TextButton")
buttonR.Size = UDim2.new(0, 65, 0, 65)
buttonR.Text = "R"
buttonR.TextSize = 24
buttonR.AnchorPoint = Vector2.new(1, 0)
buttonR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonR.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonR.Position = UDim2.new(1, -10, 0, 125)
buttonR.Parent = gui

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

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Carregado! espere 1 Segundo.",
    Icon = "rbxassetid://115726632148815",
    Text = "📜",
    Button1 = "OK",
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
letterE.TextColor3 = Color3.fromRGB(0, 0, 0)
letterE.TextScaled = true
letterE.Font = Enum.Font.SourceSansBold

-- Criando a TextBox para o jogador escolher qual evento será chamado
local textBox = Instance.new("TextBox", gui)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0, 0, 0, 400)
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

local player = game.Players.LocalPlayer -- Obtenção do jogador local
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- IDs das animações
local idleAnimationId = "rbxassetid://16163355836" -- Ficar parado
local walkAnimationId = "rbxassetid://16163350920" -- Andar
local jumpAnimationId = "rbxassetid://180435571"   -- Pulo
local customAnimationId1 = "rbxassetid://17670135152" -- Animação personalizada 1
local customAnimationId2 = "rbxassetid://16102413143" -- Animação personalizada 2

-- Criando as animações
local idleAnimation = Instance.new("Animation")
idleAnimation.AnimationId = idleAnimationId
local walkAnimation = Instance.new("Animation")
walkAnimation.AnimationId = walkAnimationId
local jumpAnimation = Instance.new("Animation")
jumpAnimation.AnimationId = jumpAnimationId

-- Carregando as animações
local idleTrack = humanoid:LoadAnimation(idleAnimation)
local walkTrack = humanoid:LoadAnimation(walkAnimation)
local jumpTrack = humanoid:LoadAnimation(jumpAnimation)

-- Variável de rastreamento para animações personalizadas
local customTrack1 = nil -- Será definida quando a primeira animação personalizada for tocada
local customTrack2 = nil -- Será definida quando a segunda animação personalizada for tocada

-- Função para parar todas as animações (exceto as personalizadas)
local function stopOtherAnimations()
    if walkTrack.IsPlaying then walkTrack:Stop() end
    if idleTrack.IsPlaying then idleTrack:Stop() end
    if jumpTrack.IsPlaying then jumpTrack:Stop() end
end

-- Monitorar o status das animações personalizadas
local function monitorCustomAnimations()
    if (customTrack1 and customTrack1.IsPlaying) or (customTrack2 and customTrack2.IsPlaying) then
        stopOtherAnimations()
    end
end

-- Função para alternar entre as animações
local function updateAnimation()
    monitorCustomAnimations()

    if humanoid.MoveDirection.Magnitude > 0 then
        -- Jogador está se movendo, tocar animação de andar
        if not walkTrack.IsPlaying and (not customTrack1 or not customTrack1.IsPlaying) and (not customTrack2 or not customTrack2.IsPlaying) then
            walkTrack:Play()
        end
        if idleTrack.IsPlaying then idleTrack:Stop() end
    else
        -- Jogador está parado, tocar animação idle
        if not idleTrack.IsPlaying and (not customTrack1 or not customTrack1.IsPlaying) and (not customTrack2 or not customTrack2.IsPlaying) then
            idleTrack:Play()
        end
        if walkTrack.IsPlaying then walkTrack:Stop() end
    end
end

-- Monitorar o estado de pulo do jogador
humanoid.StateChanged:Connect(function(_, state)
    if state == Enum.HumanoidStateType.Jumping then
        if not customTrack1 or not customTrack1.IsPlaying and not customTrack2 or not customTrack2.IsPlaying then
            jumpTrack:Play()
            stopOtherAnimations()
        end
    elseif state == Enum.HumanoidStateType.Landed then
        if jumpTrack.IsPlaying then
            jumpTrack:Stop()
        end
        updateAnimation()
    end
end)

-- Monitorar movimentação
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(updateAnimation)

-- Monitorar animações personalizadas
humanoid.AnimationPlayed:Connect(function(track)
    if track.Animation.AnimationId == customAnimationId1 then
        customTrack1 = track
        track.Stopped:Connect(function()
            customTrack1 = nil -- Reseta quando a animação personalizada 1 parar
            updateAnimation()
        end)
        stopOtherAnimations()
    elseif track.Animation.AnimationId == customAnimationId2 then
        customTrack2 = track
        track.Stopped:Connect(function()
            customTrack2 = nil -- Reseta quando a animação personalizada 2 parar
            updateAnimation()
        end)
        stopOtherAnimations()
    end
end)

-- Iniciar animação idle ao carregar
idleTrack:Play()

-- Chamando a função de animação a cada frame para verificar a movimentação do jogador
game:GetService("RunService").Heartbeat:Connect(updateAnimation)

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

local buttonZ = Instance.new("TextButton")
buttonZ.Size = UDim2.new(0, 65, 0, 65)
buttonZ.Text = "Z"
buttonZ.TextSize = 24
buttonZ.AnchorPoint = Vector2.new(1, 0)
buttonZ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonZ.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonZ.Position = UDim2.new(1, -10, 0, 60)
buttonZ.Parent = gui

local animationId = "rbxassetid://16102535685"
local animationX = Instance.new("Animation")
animationX.AnimationId = animationId

-- Obter o personagem e humanoide
local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Carregar e preparar a animação
local animationTrackX = humanoid:LoadAnimation(animationX)

-- Criando o botão
local buttonX = Instance.new("TextButton")
buttonX.Size = UDim2.new(0, 65, 0, 65)
buttonX.Text = "X"
buttonX.TextSize = 24
buttonX.AnchorPoint = Vector2.new(1, 0)
buttonX.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
buttonX.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonX.Position = UDim2.new(1, -75, 0, 125)
buttonX.Parent = gui  -- Certifique-se de que 'gui' está definido corretamente

local gradient = Instance.new("UIGradient", buttonX)

-- Definindo a cor do gradiente com transições suaves
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.new(0.8, 0, 0)),  -- Vermelho escuro
    ColorSequenceKeypoint.new(0.25, Color3.new(1, 0, 0)), -- Vermelho puro
    ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.5, 0)), -- Laranja suave
    ColorSequenceKeypoint.new(0.75, Color3.new(1, 0, 1)), -- Rosa
    ColorSequenceKeypoint.new(1, Color3.new(0.8, 0, 0))   -- Vermelho escuro novamente
}

-- Rotação do gradiente para criar um efeito bonito
gradient.Rotation = 45
-- Função fullcharged que envia o comando para o servidor
local function fullcharged()
    local args = { [1] = "fullcharged" }
    game:GetService("ReplicatedStorage").slapstick:FireServer(unpack(args))
end

-- Função chamada quando o botão X for clicado
local function onButtonXClick()
    -- Tocar a animação
    animationTrackX:Play()

    -- Chamar a função 'slapClosestPlayer()' (garanta que essa função esteja definida no código)
    slapClosestPlayer()

    -- Enviar comando para o servidor (ScytheWeapon)
    local args = { [1] = "ScytheWeapon" }
    for i = 1, 5 do
        game:GetService("ReplicatedStorage").Scythe:FireServer(unpack(args))
    end

    -- Enviar o comando fullcharged para o servidor
    fullcharged()

    -- Aguardar um pequeno intervalo antes de mover o personagem
    wait(0.1)

    -- Mover o HumanoidRootPart para trás
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -50)
    end
end

-- Conectar a função ao evento de clique do botão X
buttonX.MouseButton1Click:Connect(onButtonXClick)

local animationId = "rbxassetid://16102413143"
local animation = Instance.new("Animation")
animation.AnimationId = animationId

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animationTrackZ = humanoid:LoadAnimation(animation)

-- Função para lidar com o clique no botão
local function onButtonZClick()
    slapClosestPlayer()
    -- Executa o remote 3 vezes
    local args = { [1] = "ScytheWeapon" }
    for i = 1, 3 do
        game:GetService("ReplicatedStorage").Scythe:FireServer(unpack(args))
    end
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

-- Detectar quando a tecla "E" for pressionada
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.E then
        onSquareClick()  -- Chama a função para ativar o botão vermelho
    end
end)

buttonZ.MouseButton1Click:Connect(function()
    animationTrackZ:Play()
    onButtonZClick()
    slapClosestPlayer()
end)

-- Player e variáveis para gravidade
local player = game.Players.LocalPlayer  -- Certificando-se de que o player está definido
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local originalGravity = game.Workspace.Gravity  -- Salva a gravidade original do jogo

-- Função para teleportar o jogador para cima
local function teleportUpwards()
    local hrp = character:WaitForChild("HumanoidRootPart")  -- Espera o jogador ter um HumanoidRootPart
    hrp.CFrame = hrp.CFrame + Vector3.new(0, 40, 0)  -- Mover 40 studs para cima
end

-- Função para alterar a gravidade (gravidade baixa por 5 segundos)
local function applyLowGravity()
    game.Workspace.Gravity = 50  -- Define a gravidade para um valor baixo (ajuste conforme necessário)
end

-- Função para restaurar a gravidade original
local function restoreGravity()
    game.Workspace.Gravity = originalGravity  -- Restaura a gravidade original
end

-- Envia o comando para o servidor
local function fullcharged()
    local args = { [1] = "fullcharged" }
    game:GetService("ReplicatedStorage").slapstick:FireServer(unpack(args))
end

-- Conecta a função ao clique do botão
buttonR.MouseButton1Click:Connect(function()
    teleportUpwards()  -- Teletransporta para cima
    fullcharged()  -- Envia o comando "fullcharged"

    -- Carrega o script externo
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/Titan_ability.lua"))()

    -- Aplica a gravidade baixa
    applyLowGravity()

    -- Espera 1.7 segundos e depois restaura a gravidade
    wait(1.7)
    restoreGravity()
end)

-- Atualizar o nome da luva na TextBox a cada 0.2 segundos
while true do
    verificarLuva() -- Chama a função para verificar a luva
    wait(0.2)  -- Espera 0.2 segundos antes de atualizar novamente
end
