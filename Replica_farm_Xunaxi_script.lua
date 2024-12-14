-- DED BARRIER XUNAXI_SCRIPTS
local dedBarrier = game.Workspace:FindFirstChild("dedBarrier")

if dedBarrier then
    -- Modificar a posição e as propriedades do objeto
    dedBarrier.Position = Vector3.new(15, -17, 41.5)
    dedBarrier.CanCollide = true
else
    warn("Barreira 'dedBarrier' não encontrada no Workspace!")
end

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
textLabelflash.Text = "Replica Slap farm V3.1"
textLabelflash.TextSize = 24
textLabelflash.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabelflash.BackgroundTransparency = 1
textLabelflash.Parent = screenGui2

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

	for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
	    -- Check if the name contains the character '{'
	    if v.Name:find("{") then
	        local args = {
	            [1] = "Replica"
	        }
	
	        -- Check if v is a RemoteEvent and can FireServer
	        if v:IsA("RemoteEvent") then
	            v:FireServer(unpack(args))
	        elseif v:IsA("RemoteFunction") then
	            -- If it's a RemoteFunction, use InvokeServer
	            local result = v:InvokeServer(unpack(args))
	            print("Result from InvokeServer:", result)  -- Optional: Print the result
	        else
	            print("v is neither a RemoteEvent nor a RemoteFunction.")
	        end
	    end
	end

local character = player.Character or player.CharacterAdded:Wait()

-- Teletransportar o personagem para a posição inicial
if character and character:FindFirstChild("HumanoidRootPart") then
    character.HumanoidRootPart.CFrame = CFrame.new(-910, 331, -8)
end

-- Aguarda 0.7 segundos
task.wait(0.7)

-- Função para teletransportar o personagem para a nova posição
local function teleportToNewPosition()
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(37, 2650, 138)
    end
end

-- Criar a plataforma ancorada na posição desejada com tamanho maior
local function createPlatform()
    local platform = Instance.new("Part")  -- Cria a plataforma
    platform.Size = Vector3.new(50, 1, 50)  -- Aumenta o tamanho da plataforma (50x1x50)
    platform.Position = Vector3.new(37, 2645, 138)  -- Posiciona na nova posição
    platform.Anchored = true  -- Torna a plataforma ancorada
    platform.Transparency = 0.5  -- Define a transparência para 50%
    platform.BrickColor = BrickColor.new("Bright blue")  -- Definir a cor da plataforma
    platform.Parent = workspace  -- Adiciona a plataforma no workspace
    
    -- Adiciona um comportamento de toque (Touched) à plataforma
    platform.Touched:Connect(function(hit)
        local characterTouching = hit.Parent
        -- Verifica se o jogador tocou a plataforma
        if characterTouching:IsA("Model") and characterTouching:FindFirstChild("Humanoid") then
            print(characterTouching.Name .. " tocou a plataforma!")
            -- Aqui você pode adicionar mais funcionalidades ao toque
        end
    end)
end

-- Teletransportar o personagem e criar a plataforma
teleportToNewPosition()
createPlatform()

-- Função para executar o primeiro script (ativar Duplicate)
local function executeFirstScript()
    local args = {
        [1] = true
    }
    game:GetService("ReplicatedStorage").Duplicate:FireServer(unpack(args))
end

-- Função para executar o primeiro script a cada 7 segundos
task.spawn(function()
    while true do
        executeFirstScript()
        task.wait(15) -- Espera 7 segundos antes de ativar novamente
    end
end)

local function executeLoopScript()
    local playerName = game.Players.LocalPlayer.Name  -- Nome do jogador local

    -- Concatenando \195\133 com o nome do jogador
    local jogadorNomeFormatado = "\195\133" .. playerName

    -- Usando o nome formatado para encontrar o jogador no workspace
    local Jogador = workspace:FindFirstChild(jogadorNomeFormatado)
    if Jogador then
        -- Encontrando o Torso dentro do objeto do jogador
        local Torso = Jogador:FindFirstChild("Torso")
        if Torso then
            -- Criar os argumentos para passar ao FireServer
            local args = {
                [1] = Torso
            }
            -- Disparar o evento para o servidor
            game:GetService("ReplicatedStorage").b:FireServer(unpack(args))
        else
            warn("Torso not found!")
        end
    else
        warn(jogadorNomeFormatado .. " not found in workspace!")
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
