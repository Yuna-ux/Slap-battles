-- Define o nome padrão do NameTag
local newNameTag = "DEATH V4.3"

-- Atualiza o NameTag do jogador local
local function updateNameTag()
    local player = game.Players.LocalPlayer
    if player.Character then
        -- Procura o NameTag dentro do personagem
        local nameTag = player.Character:FindFirstChild("Nametag", true)
        if nameTag and nameTag:FindFirstChild("TextLabel") then
            nameTag.TextLabel.Text = newNameTag
        end
    end
end

-- Monitora mudanças no personagem do jogador
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("Nametag", true)
    updateNameTag()
end)

-- Configura o NameTag inicial
updateNameTag()

-- Monitora mudanças no NameTag
game.Workspace.ChildAdded:Connect(function(child)
    if child.Name == "NametagChanged" then
        updateNameTag()
    end
end)

-- Variável para controlar a função
local AntiCubeOfDeath = false

-- Função para ativar/desativar Anti Cube of Death
local function toggleAntiCubeOfDeath(enable)
    AntiCubeOfDeath = enable
    if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", true) and 
       game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("Part") then
        local cubeArea = game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]
        cubeArea.CanTouch = not enable
        cubeArea.Part.CanTouch = not enable
    end
end

-- Monitoramento de teclas ou botões para ativar/desativar
game:GetService("UserInputService").InputBegan:Connect(function(input)
    -- Tecla para Anti Cube of Death (Exemplo: T)
    if input.KeyCode == Enum.KeyCode.T then
        toggleAntiCubeOfDeath(not AntiCubeOfDeath)
    end
end)

-- Define o valor inicial para ativar/desativar o script
_G.AntiRock = true

-- Loop enquanto a variável _G.AntiRock for verdadeira
while _G.AntiRock do
    -- Itera por todos os jogadores no jogo
    for _, player in pairs(game.Players:GetPlayers()) do
        local character = player.Character
        if character then
            -- Procura o objeto "rock" dentro do personagem
            local rock = character:FindFirstChild("rock")
            if rock then
                rock.CanTouch = false
                rock.CanQuery = false
            end
        end
    end
    -- Espera um curto período para evitar travamentos
    task.wait(0.1)
end

-- Inicializa a variável de controle
_G.AntiTimestop = false

-- Função para ativar o Anti Time Stop
function ToggleAntiTimestop(state)
    _G.AntiTimestop = state
    if _G.AntiTimestop then
        while _G.AntiTimestop do
            -- Verifica todas as partes do personagem local
            for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if part:IsA("Part") then
                    part.Anchored = false -- Desancora as partes
                end
            end
            task.wait(0.5) -- Evita travamentos
        end
    end
end

-- Ativar o Anti Time Stop
ToggleAntiTimestop(true)

-- Para desativar o Anti Time Stop, chame:
-- ToggleAntiTimestop(false)

