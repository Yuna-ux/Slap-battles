-- Função para tratar RemoteEvents e RemoteFunctions
local function fireRemote(v, arg)
    local args = { [1] = arg }

    if v:IsA("RemoteEvent") then
        v:FireServer(unpack(args))
    elseif v:IsA("RemoteFunction") then
        local success, result = pcall(function()
            return v:InvokeServer(unpack(args))
        end)

        if success then
            print("Result from InvokeServer:", result)  -- Opcional: imprimir resultado
        else
            warn("Failed to InvokeServer:", result)
        end
    else
        warn("Invalid Remote: ", v.Name)
    end
end

-- Função para processar _NETWORK
local function processNetwork(arg)
    local networkFolder = game:GetService("ReplicatedStorage"):FindFirstChild("_NETWORK")
    if not networkFolder then
        warn("_NETWORK folder not found")
        return
    end

    for _, v in pairs(networkFolder:GetChildren()) do
        if v.Name:find("{") then
            fireRemote(v, arg)
        end
    end
end

-- Função para teleportar o personagem
local function teleportCharacter(player, targetPosition)
    if not player or not player.Character then
        warn("Player or character not found")
        return
    end

    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(targetPosition)
    else
        warn("HumanoidRootPart not found")
    end
end

-- Execução principal
local player = game:GetService("Players").LocalPlayer

-- Parte 1: Titan
processNetwork("Titan")
task.wait(0.2)

-- Transformar em Titan
local generalAbility = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralAbility")
if generalAbility and generalAbility:IsA("RemoteEvent") then
    generalAbility:FireServer("Transform")
else
    warn("GeneralAbility RemoteEvent not found")
end

task.wait(0.1)

-- Parte 2: Diamond
processNetwork("Diamond")
task.wait(0.3)

-- Acionando o Rockmode duas vezes
local rockmode = game:GetService("ReplicatedStorage"):FindFirstChild("Rockmode")
if rockmode and rockmode:IsA("RemoteEvent") then
    rockmode:FireServer()
    task.wait(3)
    rockmode:FireServer()
else
    warn("Rockmode RemoteEvent not found")
end

task.wait(0.3)

-- Teleportar personagem
teleportCharacter(player, Vector3.new(-5, -5, 15))
