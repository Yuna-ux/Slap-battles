-- Função para tratar os RemoteEvents e RemoteFunctions
local function fireRemote(v, arg)
    local args = { [1] = arg }
    
    if v:IsA("RemoteEvent") then
        v:FireServer(unpack(args))
    elseif v:IsA("RemoteFunction") then
        -- Se for RemoteFunction, usamos InvokeServer
        local result = v:InvokeServer(unpack(args))
        print("Result from InvokeServer:", result)  -- Opcional: Imprimir o resultado
    else
        print("v is neither a RemoteEvent nor a RemoteFunction.")
    end
end

-- Primeira parte: Titan
for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
    if v.Name:find("{") then
        fireRemote(v, "Titan")
    end
end

wait(0.2)

-- Transformar em Titan
local args = { [1] = "Transform" }
game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))

wait(0.1)

-- Segunda parte: Diamond
for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
    if v.Name:find("{") then
        fireRemote(v, "Diamond")
    end
end

wait(0.3)

-- Acionando o Rockmode duas vezes
game:GetService("ReplicatedStorage").Rockmode:FireServer()
wait(1.2)
game:GetService("ReplicatedStorage").Rockmode:FireServer()
