local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Função para ajustar a velocidade constantemente
local function setLoopSpeed(humanoid)
    while humanoid and humanoid.Parent do
        humanoid.WalkSpeed = 40 -- Define a velocidade para 40
        task.wait(0.1) -- Aguarda 0.1 segundos antes de verificar novamente
    end
end

-- Executa a função em uma nova thread para manter o loop ativo
spawn(function()
    setLoopSpeed(humanoid)
end)

-- Criar efeito de flash branco
local player = game.Players.LocalPlayer
local screenGui2 = Instance.new("ScreenGui")
screenGui2.Parent = player:WaitForChild("PlayerGui")

local flashFrame = Instance.new("Frame")
flashFrame.Size = UDim2.new(1, 0, 1, 0)
flashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flashFrame.BackgroundTransparency = 0
flashFrame.Parent = screenGui2

local textLabelflash = Instance.new("TextLabel")
textLabelflash.Size = UDim2.new(0, 300, 0, 50)
textLabelflash.Position = UDim2.new(0.5, -150, 0.5, -25)
textLabelflash.Font = Enum.Font.Fantasy
textLabelflash.Text = "Made by XUNAXI_SCRIPTS on Youtube🟥"
textLabelflash.TextSize = 24
textLabelflash.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabelflash.BackgroundTransparency = 1
textLabelflash.Parent = screenGui2

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Carregado! espere 1 Segundo.",
    Icon = "rbxassetid://115726632148815",
    Text = "📜",
    Button1 = "OK",
    Duration = 15,
})

task.wait(1.5)
flashFrame:Destroy()
textLabelflash:Destroy()

-- Enviar a notificação com som
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Carregado, Feito por XUNAXI Scripts!",
    Icon = "rbxassetid://79497088035434",
    Text = "Divirta-se!",
    Button1 = "Sim kkk",
    Button2 = "Cancel",
    Duration = 15,
})

-- Criando a TextBox para o jogador escolher qual evento será chamado
local textBox = Instance.new("TextBox", screenGui2)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0, 0, 0, 1000)
textBox.Text = "Nome da luva será mostrado aqui"
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- Função para verificar o nome da luva e retornar o nome correto
local function verificarLuva(gloveName)
    local hitName = "GeneralHit" -- Valor padrão

  -- Verificar o nome da luva e atribuir o respectivo "Hit"
            if gloveName == "Default" then
                hitName = "b"
            elseif gloveName == "Dual" then
                hitName = "GeneralHit"
            elseif gloveName == "Diamond" then
                hitName = "DiamondHit"
            elseif gloveName == "ZZZZZZZ" then
                hitName = "ZZZZZZZHit"
            elseif gloveName == "Extended" then
                hitName = "b"
            elseif gloveName == "Brick" then
                hitName = "BrickHit"
            elseif gloveName == "Snow" then
                hitName = "SnowHit"
            elseif gloveName == "Pull" then
                hitName = "PullHit"
            elseif gloveName == "Flash" then
                hitName = "FlashHit"
            elseif gloveName == "Spring" then
                hitName = "springhit"
            elseif gloveName == "Swapper" then
                hitName = "HitSwapper"
            elseif gloveName == "Bull" then
                hitName = "BullHit"
            elseif gloveName == "Dice" then
                hitName = "DiceHit"
            elseif gloveName == "Ghost" then
                hitName = "GhostHit"
            elseif gloveName == "Thanos" then
                hitName = "ThanosHit"
            elseif gloveName == "Stun" then
                hitName = "HtStun"
            elseif gloveName == "L.O.L.B.O.M.B" then
                hitName = "GeneralHit"
            elseif gloveName == "Za Hando" then
                hitName = "zhrmat"
            elseif gloveName == "Fort" then
                hitName = "Fort"
            elseif gloveName == "Magnet" then
                hitName = "MagnetHIT"
            elseif gloveName == "Pusher" then
                hitName = "PusherHit"
            elseif gloveName == "Anchor" then
                hitName = "hitAnchor"
            elseif gloveName == "Space" then
                hitName = "HtSpace"
            elseif gloveName == "Boomerang" then
                hitName = "BoomerangH"
            elseif gloveName == "Speedrun" then
                hitName = "Speedrunhit"
            elseif gloveName == "Mail" then
                hitName = "MailHit"
            elseif gloveName == "T H I C K" then
                hitName = "GeneralHit"
            elseif gloveName == "Golden" then
                hitName = "GoldenHit"
            elseif gloveName == "Squid" then
                hitName = "GeneralHit"
            elseif gloveName == "MR" then
                hitName = "MisterHit"
            elseif gloveName == "Hive" then
                hitName = "GeneralHit"
            elseif gloveName == "Reaper" then
                hitName = "GeneralHit"
            elseif gloveName == "Replica" then
                hitName = "ReplicaHit"
            elseif gloveName == "Defense" then
                hitName = "DefenseHit"
            elseif gloveName == "Killstreak" then
                hitName = "KSHit"
            elseif gloveName == "Reverse" then
                hitName = "ReverseHit"
            elseif gloveName == "Shukuchi" then
                hitName = "ShukuchiHit"
            elseif gloveName == "Duelist" then
                hitName = "DuelistHit"
            elseif gloveName == "Woah" then
                hitName = "(woahHit)"
            elseif gloveName == "Ice (doesnt work, idk why)" then
                hitName = "(IceHit)"
            elseif gloveName == "Gummy" then
                hitName = "(GeneralHit)"
            elseif gloveName == "Adios" then
                hitName = "(hitAdios)"
            elseif gloveName == "The Flex" then
                hitName = "FlexHit"
            elseif gloveName == "CULT" then
                hitName = "CULTHit"
            elseif gloveName == "Tycoon" then
                hitName = "GeneralHit"
            elseif gloveName == "Orbit" then
                hitName = "Orbihit"
            elseif gloveName == "Avatar (works for Avatar and the Normal Glove)" then
                hitName = "GeneralHit"
            elseif gloveName == "Frostbite" then
                hitName = "GeneralHit"
            end

    return hitName
end

-- Função para atualizar a TextBox com base no nome da luva
local function atualizarTextBox()
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local glove = leaderstats:FindFirstChild("Glove")
        if glove then
            local hitName = verificarLuva(glove.Value)
            textBox.Text = hitName
            print("Nome da luva atualizado: " .. hitName)
        else
            print("A categoria 'Glove' não foi encontrada nos leaderstats.")
        end
    else
        print("O jogador não tem leaderstats.")
    end
end

-- Monitorar mudanças no valor da luva
local leaderstats = player:FindFirstChild("leaderstats")
if leaderstats then
    local glove = leaderstats:FindFirstChild("Glove")
    if glove then
        glove:GetPropertyChangedSignal("Value"):Connect(atualizarTextBox)
    else
        print("A categoria 'Glove' não foi encontrada nos leaderstats.")
    end
else
    print("O jogador não tem leaderstats.")
end

-- Atualizar a TextBox no início
atualizarTextBox()

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

local newIdleAnimationId = 16163355836
local newWalkAnimationId = 16163350920
local eAnimationId = 17670135152
local punchAnimationId = 17794367623
local soundId = "rbxassetid://3609296008"

loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/ANTIVOID_XUNAXI_SCRIPTS_SLAP_BATTLES.lua"))()

local isMusicPlaying = false
local isTeleporting = false
local musicArgs = {
    [1] = "rbxassetid://9133844756",
    [2] = nil
}
local currentMusic

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local buttonFrame = Instance.new("Frame")
buttonFrame.Size = UDim2.new(0, 220, 0, 220)
buttonFrame.Position = UDim2.new(1, -230, 0.5, -110)
buttonFrame.BackgroundTransparency = 1
buttonFrame.Parent = screenGui

local function createButton(text, position, parent)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 70, 0, 70)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 28
    button.Text = text
    button.Parent = parent
    return button
end

local buttonE = createButton("E", UDim2.new(0.5, -35, 0, 0), buttonFrame)
local buttonT = createButton("T", UDim2.new(0.1, 10, 0, 80), buttonFrame)
local buttonF = createButton("F", UDim2.new(0.7, -45, 0, 80), buttonFrame)

local function blendAnimations(character)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if animator then
            local newIdleAnimation = Instance.new("Animation")
            newIdleAnimation.AnimationId = "rbxassetid://" .. newIdleAnimationId
            
            local newWalkAnimation = Instance.new("Animation")
            newWalkAnimation.AnimationId = "rbxassetid://" .. newWalkAnimationId

            local idleAnimTrack = animator:LoadAnimation(newIdleAnimation)
            local walkAnimTrack = animator:LoadAnimation(newWalkAnimation)

            idleAnimTrack.Priority = Enum.AnimationPriority.Idle
            walkAnimTrack.Priority = Enum.AnimationPriority.Movement

            idleAnimTrack:Play()
            
            humanoid.Running:Connect(function(speed)
                if speed > 0 then
                    if not walkAnimTrack.IsPlaying then
                        walkAnimTrack:Play()
                    end
                else
                    if walkAnimTrack.IsPlaying then
                        walkAnimTrack:Stop()
                    end
                end
            end)

            idleAnimTrack:AdjustSpeed(1)
            walkAnimTrack:AdjustSpeed(1)
        end
    end
end

local function playEAnimation()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
        
        if animator then
            local eAnimation = Instance.new("Animation")
            eAnimation.AnimationId = "rbxassetid://" .. eAnimationId
            local eAnimTrack = animator:LoadAnimation(eAnimation)
            eAnimTrack:Play()
            slapClosestPlayer()
        end
    end

    -- Punch logic
    local character = player.Character or player.CharacterAdded:Wait()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Events = ReplicatedStorage:WaitForChild("Events")
    local BoxingEvent = Events:WaitForChild("Boxing")
    
    -- Load punch animation
    local punchAnim = Instance.new("Animation")
    punchAnim.AnimationId = "rbxassetid://" .. punchAnimationId
    local punchTrack = character:WaitForChild("Humanoid"):LoadAnimation(punchAnim)
    
    punchTrack:Play()
    
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local args = {otherPlayer, true}
            BoxingEvent:FireServer(unpack(args))
        end
    end

    -- Play sound effect
    local args = {
        [1] = soundId,
        [2] = player.Character.Torso
    }
    game:GetService("ReplicatedStorage"):WaitForChild("PlaySoundRemote"):InvokeServer(unpack(args))
end

local function toggleMusicAndParticles()
    local player = game.Players.LocalPlayer

    local ModelEffect = game:GetObjects("rbxassetid://14949130713")[1]
    if ModelEffect then
        if not isMusicPlaying then
            for i, v in pairs(ModelEffect.HumanoidRootPart:GetChildren()) do
                if v.ClassName == "ParticleEmitter" then
                    for i, p in pairs(player.Character:GetChildren()) do
                        if p:IsA("Part") then
                            v:Clone().Parent = p
                        end
                    end
                end
            end
            ModelEffect:Destroy()

            musicArgs[2] = player.Character and player.Character:WaitForChild("Torso")
            currentMusic = game:GetService("ReplicatedStorage"):WaitForChild("PlaySoundRemote"):InvokeServer(unpack(musicArgs))
            currentMusic.Volume = 1

            isMusicPlaying = true
        else
            currentMusic:Stop()
            for _, part in ipairs(player.Character:GetChildren()) do
                if part:IsA("Part") then
                    for _, child in ipairs(part:GetChildren()) do
                        if child:IsA("ParticleEmitter") then
                            child:Destroy()
                        end
                    end
                end
            end
            isMusicPlaying = false
        end
    end
end

local function enableTeleportMode()
    isTeleporting = true
    local player = game.Players.LocalPlayer
    local playerMouse = player:GetMouse()

    local function onClick()
        if isTeleporting then
            local targetPosition = playerMouse.Hit.p
            player.Character:MoveTo(targetPosition)
            isTeleporting = false
            playerMouse.Button1Down:Disconnect()
        end
    end

    playerMouse.Button1Down:Connect(onClick)
end

buttonE.MouseButton1Click:Connect(playEAnimation)
buttonT.MouseButton1Click:Connect(enableTeleportMode)
buttonF.MouseButton1Click:Connect(toggleMusicAndParticles)

local slideButton = Instance.new("TextButton")
slideButton.Size = UDim2.new(0, 80, 0, 40)
slideButton.Position = UDim2.new(0.5, -40, 0, 160)
slideButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
slideButton.BackgroundTransparency = 0.5
slideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
slideButton.Text = "Close"
slideButton.Parent = buttonFrame

local isOpen = true
slideButton.MouseButton1Click:Connect(function()
    if isOpen then
        buttonE.Visible = false
        buttonT.Visible = false
        buttonF.Visible = false
        slideButton.Text = "Open"
    else
        buttonE.Visible = true
        buttonT.Visible = true
        buttonF.Visible = true
        slideButton.Text = "Close"
    end
    isOpen = not isOpen
end)

local player = game.Players.LocalPlayer
if player.Character then
    blendAnimations(player.Character)
else
    player.CharacterAdded:Connect(blendAnimations)
end

local function teleportToPart(part)
    local player = game.Players.LocalPlayer
    if player.Character and part then
        player.Character:MoveTo(part.Position)
    end
end

local desiredPart = workspace.Arena["main island"].Grass
teleportToPart(desiredPart)

print("Script loaded successfully!")

-- Remover barreiras no jogo
local partsToDelete = {
    workspace:FindFirstChild("DEATHBARRIER"),
    workspace:FindFirstChild("DEATHBARRIER2"),
    workspace:FindFirstChild("ArenaBarrier"),
    workspace:FindFirstChild("AntiDefaultArena"),
}

for _, part in ipairs(partsToDelete) do
    if part then
        part:Destroy()
    end
end

-- Sets the default NameTag
local newNameTag = "Edgelord V1.7"

-- Updates the NameTag of the local player
local function updateNameTag()
local player = game.Players.LocalPlayer
if player.Character then
-- Finds the NameTag within the character
local nameTag = player.Character:FindFirstChild("Nametag", true)
if nameTag and nameTag:FindFirstChild("TextLabel") then
nameTag.TextLabel.Text = newNameTag
end
end
end

-- Monitors changes to the player's character
game.Players.LocalPlayer.CharacterAdded:Connect(function()
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("Nametag", true)
updateNameTag()
end)

-- Sets the initial NameTag
updateNameTag()

-- Monitors changes to the NameTag
game.Workspace.ChildAdded:Connect(function(child)
    if child.Name == "NametagChanged" then
        updateNameTag()
    end
end)

space.ChildAdded:Connect(function(child)
    if child.Name == "NametagChanged" then
        updateNameTag()
    end
end)
