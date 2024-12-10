local newIdleAnimationId = 16163355836
local newWalkAnimationId = 16163350920
local eAnimationId = 17670135152
local punchAnimationId = 17794367623
local soundId = "rbxassetid://3609296008"

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
        end
    end

    -- Punch logic
    local player = game.Players.LocalPlayer
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
