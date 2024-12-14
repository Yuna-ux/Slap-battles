-- Função para aplicar o efeito de contorno ao personagem
local function applyOutlineEffect(character)
    -- Verifica se o personagem é válido
    if character and character:IsA("Model") then
        local outlineEffect = Instance.new("Highlight")
        outlineEffect.Parent = character
        outlineEffect.Adornee = character -- Aponta para o personagem
        outlineEffect.OutlineColor = Color3.new(1, 0, 0) -- Cor vermelha
        outlineEffect.FillTransparency = 1 -- Apenas contorno
    else
        warn("O parâmetro fornecido não é um personagem válido!")
    end
end

-- Exemplo de uso: passando o personagem local
local player = game.Players.LocalPlayer
if player.Character then
    applyOutlineEffect(player.Character)
end
