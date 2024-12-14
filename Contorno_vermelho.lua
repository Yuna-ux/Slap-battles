local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Função para aplicar o efeito de contorno ao personagem
local function applyOutlineEffect()
    local outlineEffect = Instance.new("Highlight")
    outlineEffect.Parent = character
    outlineEffect.Adornee = character -- Aponta para o personagem
    outlineEffect.OutlineColor = Color3.new(1, 0, 0) -- Vermelho
    outlineEffect.FillTransparency = 1 -- Apenas contorno
end

-- Garantir que o personagem esteja carregado antes de aplicar o efeito
if character then
    applyOutlineEffect()
else
    player.CharacterAdded:Connect(function(newCharacter)
        character = newCharacter
        applyOutlineEffect()
    end)
end
