local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- IDs das animações
local idleAnimationId = "rbxassetid://16163355836" -- Ficar parado
local walkAnimationId = "rbxassetid://16163350920" -- Andar

-- Criando as animações
local idleAnimation = Instance.new("Animation")
idleAnimation.AnimationId = idleAnimationId
local walkAnimation = Instance.new("Animation")
walkAnimation.AnimationId = walkAnimationId

-- Carregando as animações
local idleTrack = humanoid:LoadAnimation(idleAnimation)
local walkTrack = humanoid:LoadAnimation(walkAnimation)

-- Função para alternar entre as animações
local function updateAnimation()
    if humanoid.MoveDirection.Magnitude > 0 then
        -- Jogador está se movendo, tocar animação de andar
        if not walkTrack.IsPlaying then
            walkTrack:Play()
        end
        if idleTrack.IsPlaying then
            idleTrack:Stop()
        end
    else
        -- Jogador não está se movendo, tocar animação de ficar parado
        if not idleTrack.IsPlaying then
            idleTrack:Play()
        end
        if walkTrack.IsPlaying then
            walkTrack:Stop()
        end
    end
end

-- Atualizar a animação a cada frame
game:GetService("RunService").Heartbeat:Connect(updateAnimation)

