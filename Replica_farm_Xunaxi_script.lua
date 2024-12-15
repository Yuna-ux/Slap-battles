
loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/BYPASS_ANTICHEAT_XUNAXI_Scripts.lua"))();
--DED BARRIER XUNAXI_SCRIPTS
local dedBarrier = game.Workspace:FindFirstChild("dedBarrier")

if dedBarrier then
    dedBarrier.Position = Vector3.new(15, -17, 41.5)
    dedBarrier.CanCollide = true
else
    warn("Barreira 'dedBarrier' não encontrada no Workspace!")
end

-- Criar efeito de flash branco
local function createFlashEffect()
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
    textLabelflash.Text = "Replica Slap Farm V3.1"
    textLabelflash.TextSize = 24
    textLabelflash.TextColor3 = Color3.fromRGB(0, 0, 0)
    textLabelflash.BackgroundTransparency = 1
    textLabelflash.Parent = screenGui2

    task.wait(1.5)
    screenGui2:Destroy()
end
createFlashEffect()

-- Enviar notificação
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Carregado, Feito por XUNAXI Scripts!",
    Icon = "rbxassetid://79497088035434",
    Text = "Divirta-se!",
    Button1 = "Sim kkk",
    Button2 = "Cancelar",
    Duration = 15,
})

-- Manipular _NETWORK no ReplicatedStorage
for _, v in ipairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
    if v.Name:find("{") then
        local args = { "Replica" }
        if v:IsA("RemoteEvent") then
            v:FireServer(unpack(args))
        elseif v:IsA("RemoteFunction") then
            local result = v:InvokeServer(unpack(args))
            print("Result from InvokeServer:", result)
        else
            print("Elemento inválido:", v.Name)
        end
    end
end

task.wait(0.5)

-- Teletransportar personagem
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

if character and character:FindFirstChild("HumanoidRootPart") then
    character.HumanoidRootPart.CFrame = CFrame.new(-910, 331, -8)
end

task.wait(2)

local function teleportToNewPosition()
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(37, 2650, 138)
    end
end

local function createPlatformWithWallsAndCeiling()
    local platform = Instance.new("Part")
    platform.Size = Vector3.new(700, 1, 700)
    platform.Position = Vector3.new(37, 2647, 138)
    platform.Anchored = true
    platform.Transparency = 0.5
    platform.BrickColor = BrickColor.new("Bright blue")
    platform.Parent = workspace

    local wallHeight = 50
    local wallThickness = 5
    local walls = {
        { Vector3.new(platform.Size.X, wallHeight, wallThickness), Vector3.new(0, wallHeight / 2, -platform.Size.Z / 2) },
        { Vector3.new(platform.Size.X, wallHeight, wallThickness), Vector3.new(0, wallHeight / 2, platform.Size.Z / 2) },
        { Vector3.new(wallThickness, wallHeight, platform.Size.Z), Vector3.new(-platform.Size.X / 2, wallHeight / 2, 0) },
        { Vector3.new(wallThickness, wallHeight, platform.Size.Z), Vector3.new(platform.Size.X / 2, wallHeight / 2, 0) },
    }

    for _, wallData in ipairs(walls) do
        local wall = Instance.new("Part")
        wall.Size = wallData[1]
        wall.Position = platform.Position + wallData[2]
        wall.Anchored = true
        wall.BrickColor = BrickColor.new("Bright blue")
        wall.Parent = workspace
    end

    local ceiling = Instance.new("Part")
    ceiling.Size = Vector3.new(platform.Size.X, 1, platform.Size.Z)
    ceiling.Position = platform.Position + Vector3.new(0, wallHeight, 0)
    ceiling.Anchored = true
    ceiling.BrickColor = BrickColor.new("Bright blue")
    ceiling.Parent = workspace
end
createPlatformWithWallsAndCeiling()
teleportToNewPosition()

-- Ativar um Remote repetidamente
local function executeFirstScript()
    local args = { true }
    local duplicateRemote = game:GetService("ReplicatedStorage"):FindFirstChild("Duplicate")
    if duplicateRemote then
        duplicateRemote:FireServer(unpack(args))
    end
end

task.spawn(function()
    while true do
        executeFirstScript()
        task.wait(7)
    end
end)

-- Loop com argumentos para servidor
local function executeLoopScript()
    local playerName = game.Players.LocalPlayer.Name
    local formattedName = "\195\133" .. playerName
    local playerModel = workspace:FindFirstChild(formattedName)
    if playerModel then
        local torso = playerModel:FindFirstChild("Torso")
        if torso then
            game:GetService("ReplicatedStorage").b:FireServer(torso)
        else
            warn("Torso não encontrado!")
        end
    else
        warn(formattedName .. " não encontrado no Workspace!")
    end
end

task.spawn(function()
    while true do
        executeLoopScript()
        task.wait(0.3)
    end
end)

-- Remover barreiras
local barriersToDelete = { "DEATHBARRIER", "DEATHBARRIER2", "ArenaBarrier", "AntiDefaultArena" }
for _, barrierName in ipairs(barriersToDelete) do
    local barrier = workspace:FindFirstChild(barrierName)
    if barrier then
        barrier:Destroy()
    end
end

-- AntiRecord
_G.AntiRecord = true

local function monitorChat(player)
    player.Chatted:Connect(function(message)
        if _G.AntiRecord then
            local lowerMessage = message:lower()
            if lowerMessage:find("record") or lowerMessage:find("discord") then
                game.Players.LocalPlayer:Kick("Suspeita de gravação: " .. player.Name)
            end
        end
    end)
end

for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
    if otherPlayer ~= game.Players.LocalPlayer then
        monitorChat(otherPlayer)
    end
end

-- Loop com argumentos para servidor
local function executeLoopScript()
    local playerName = game.Players.LocalPlayer.Name
    local formattedName = "\195\133" .. playerName
    local playerModel = workspace:FindFirstChild(formattedName)
    if playerModel then
        local torso = playerModel:FindFirstChild("Torso")
        if torso then
            game:GetService("ReplicatedStorage").b:FireServer(torso)
        else
            warn("Torso não encontrado!")
        end
    else
        warn(formattedName .. " não encontrado no Workspace!")
    end
end

-- Inicia o loop infinito
task.spawn(function()
    while true do
        executeLoopScript()  -- Executa o script
        task.wait(0.3) -- Espera 0.3 segundos antes de executar novamente
    end
end)

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
local newNameTag = "I don't use hack lol"

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

-- Ativar ou desativar o AntiRecord
_G.AntiRecord = true  -- Inicia como desativado

-- Função para monitorar mensagens de chat
local function monitorChat(player)
    player.Chatted:Connect(function(message)
        if _G.AntiRecord then
            local words = message:split(" ")
            for _, word in ipairs(words) do
                local lowerWord = word:lower()
                if lowerWord:match("recording") or lowerWord:match(" rec") or lowerWord:match("record") or 
                   lowerWord:match("discor") or lowerWord:match(" disco") or lowerWord:match(" disc") or 
                   lowerWord:match("ticket") or lowerWord:match("tickets") or lowerWord:match(" ds") or 
                   lowerWord:match(" dc") or lowerWord:match("dizzy") or lowerWord:match("dizzycord") or 
                   lowerWord:match(" clip") or lowerWord:match("proof") or lowerWord:match("evidence") then
                    -- Desconecta o jogador local ao detectar mensagem suspeita
                    game.Players.LocalPlayer:Kick("Possible player recording detected." .. 
                        " [ " .. player.Name .. " ]" .. " [ " .. message .. " ]")
                end
            end
        end
    end)
end

-- Monitora os jogadores existentes no servidor
for _, player in ipairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        monitorChat(player)
    end
end

-- Monitora novos jogadores que entrarem no servidor
game.Players.PlayerAdded:Connect(function(player)
    monitorChat(player)
end)


    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Parent = player:WaitForChild("PlayerGui")

    local imageButton = Instance.new("ImageButton")
    imageButton.Size = UDim2.new(0, 50, 0, 50) -- Tamanho do botão
    imageButton.Position = UDim2.new(1, -70, 0, 30) -- Posição: 70 pixels para dentro e 30 para baixo
    imageButton.AnchorPoint = Vector2.new(1, 0) -- Âncora no canto superior direito
    imageButton.BackgroundTransparency = 1 -- Sem fundo para destacar a imagem
    imageButton.Image = "rbxassetid://79497088035434" -- Substitua pelo ID da sua imagem
    imageButton.Parent = gui

    -- Ação ao clicar no botão
    imageButton.MouseButton1Click:Connect(function()
        print("Botão clicado!")
        gui:Destroy() -- Remove o botão após o clique (opcional)
    end)

-- Chamada da função
createStopButton()
