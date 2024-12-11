local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Espera o jogador ter um HumanoidRootPart
local hrp = character:WaitForChild("HumanoidRootPart")

-- Define a função para calcular a posição no chão
local function getGroundPosition()
    -- Origem do Raycast no meio do personagem
    local origin = hrp.Position

    -- Direção do Raycast para baixo
    local direction = Vector3.new(0, -100, 0)  -- O valor -100 é para garantir que o Ray encontre o chão

    -- Configuração do Raycast
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}  -- Ignorar o próprio personagem
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    -- Realiza o Raycast
    local result = workspace:Raycast(origin, direction, raycastParams)

    if result then
        return result.Position  -- Retorna a posição do impacto com o chão
    else
        return origin - Vector3.new(0, 5, 0)  -- Caso não encontre o chão, retorna uma posição padrão
    end
end

-- Calcula a posição exata no chão
local groundPosition = getGroundPosition()

-- Cria o argumento para enviar a habilidade ao servidor
local args = {
    [1] = "UseAbility",
    [2] = Vector3.new(groundPosition.X, groundPosition.Y, groundPosition.Z)  -- Garante o uso de Vector3.new
}

-- Envia o comando para o servidor
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))

