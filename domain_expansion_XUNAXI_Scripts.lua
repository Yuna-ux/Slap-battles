local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", playerGui)
local button = Instance.new("TextButton", screenGui)

button.Size = UDim2.new(0, 200, 0, 60)
button.Position = UDim2.new(0.85, -100, 0.5, -30)
button.Text = "Domain Expansion: Unlimited Void"
button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.Fantasy
button.BorderSizePixel = 4
button.BorderColor3 = Color3.new(0, 0, 0)

local gradient = Instance.new("UIGradient", button)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.new(0.6, 0, 0.6)),
    ColorSequenceKeypoint.new(0.5, Color3.new(1, 0, 1)),
    ColorSequenceKeypoint.new(1, Color3.new(0.6, 0, 0.6))
}
gradient.Rotation = 45

local cooldown = false

local function startCooldown()
    local cooldownTime = 40
    for i = cooldownTime, 1, -1 do
        button.Text = "Cooldown: " .. i .. "s"
        wait(1)
    end
    button.Text = "Domain Expansion: Unlimited Void"
    button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    cooldown = false
end

local function zoomToFace()
    local character = player.Character
    if not character then return end
    local head = character:FindFirstChild("Head")

    if head then
        character.HumanoidRootPart.Anchored = true
        local camera = game.Workspace.CurrentCamera
        camera.CameraType = Enum.CameraType.Scriptable

        local initialDistance = 10
        local offsetDistance = 4
        local targetPosition = head.Position + (head.CFrame.LookVector * initialDistance)
        local targetCFrame = CFrame.new(targetPosition, head.Position)

        camera.CFrame = targetCFrame

        local finalCFrame = CFrame.new(head.Position + (head.CFrame.LookVector * offsetDistance), head.Position)
        local duration = 6

        for i = 0, 1, 0.01 do
            camera.CFrame = targetCFrame:Lerp(finalCFrame, i)
            wait(duration / 100)
        end

        local fastZoomOutPosition = head.Position + (head.CFrame.LookVector * initialDistance)
        camera.CFrame = CFrame.new(fastZoomOutPosition, head.Position)

        wait(0.5)
        camera.CameraType = Enum.CameraType.Custom
        character.HumanoidRootPart.Anchored = false
    end
end

button.MouseButton1Click:Connect(function()
    if cooldown then return end
    cooldown = true
    button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)

    spawn(startCooldown)

    local character = player.Character or player.CharacterAdded:Wait()
    local originalTransparency = {}

    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:IsDescendantOf(character) then
            table.insert(originalTransparency, {object = obj, transparency = obj.Transparency})
            obj.Transparency = 1
        end
    end

    task.spawn(function()
        task.spawn(function()
            local soundId = "rbxassetid://6667923288"
            local soundVolume = 3
            local sound = Instance.new("Sound")
            sound.SoundId = soundId
            sound.Volume = soundVolume
            sound.Parent = game.Workspace
            sound:Play()
            task.wait(5)
            local soundId = "rbxassetid://6590357524"
            local soundVolume = 3
            local sound = Instance.new("Sound")
            sound.SoundId = soundId
            sound.Volume = soundVolume
            sound.Parent = game.Workspace
            sound:Play()
            local modelId = 17876272903
            local player = game.Players.LocalPlayer
            

                local character = player.Character or player.CharacterAdded:Wait()
                local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
            
                if torso then
                    local model = game:GetObjects("rbxassetid://" .. modelId)[1]
                    model.Parent = character
    
                    for _, part in ipairs(model:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CFrame = torso.CFrame
                            local weld = Instance.new("WeldConstraint")
                            weld.Part0 = torso
                            weld.Part1 = part
                            weld.Parent = part
                        end
                    end
                    task.wait(5)
                    model:Destroy()
                end
                            
            task.spawn(function()
                local player = game.Players.LocalPlayer
                local camera = workspace.CurrentCamera
                
                local function setCameraFOV(targetFOV, duration)
                    local initialFOV = camera.FieldOfView
                    local startTime = tick() -- Get the current time
                
                    while tick() - startTime < duration do
                        local elapsed = tick() - startTime
                        local alpha = elapsed / duration -- Normalized time (0 to 1)
                
                        -- Interpolate Field of View
                        camera.FieldOfView = initialFOV + (targetFOV - initialFOV) * alpha
                        wait(0.01) -- Wait for a small amount of time to create a smooth transition
                    end
                
                    camera.FieldOfView = targetFOV -- Ensure it ends at the target FOV
                end
                
                -- Main function to handle the zooming
                local function zoomOut()
                    local targetFOV = 130 -- Target FOV for zoomed out
                    local zoomDuration = 4 -- Duration for zooming out
                    local waitDuration = 0.2 -- Duration to wait at the zoomed out FOV
                    local resetDuration = 0.4 -- Duration to reset back to normal FOV
                
                    -- Zoom out
                    setCameraFOV(targetFOV, zoomDuration)
                
                    -- Wait at the zoomed out FOV
                    task.wait(waitDuration)
                
                    -- Reset back to the original FOV
                    setCameraFOV(70, resetDuration) -- Assuming 70 is the normal FOV for the game
                end
                
                zoomOut()
            end)
            
            spawn(function()
                local assetId = 15170969095
                local soundId = "rbxassetid://YOUR_SOUND_ID" -- Replace with your actual sound ID
                local player = game.Players.LocalPlayer
                
                -- Function to play sound and attach visual effect
                local function playEffectAndSound()
                    local character = player.Character or player.CharacterAdded:Wait()
                    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
                
                    if torso then
                        -- Create and play the sound
                        local sound = Instance.new("Sound")
                        sound.SoundId = soundId
                        sound.Volume = 2 -- Set volume
                        sound.Parent = game.Workspace
                        sound:Play()
                
                        -- Table to keep track of created effects
                        local effects = {}
                
                        -- Spawn the visual effect 8 times with a delay of 0.3 seconds
                        for i = 1, 10 do
                            local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
                            if effect then
                                effect.Parent = torso
                                -- Adjust position by lowering the effect further
                                effect.CFrame = torso.CFrame * CFrame.new(0, 15, -1) -- Lowered Y position to 15
                                table.insert(effects, effect) -- Store the effect in the table
                            end
                            wait(0.3) -- Wait for 0.3 seconds before the next spawn
                        end
                
                        -- Wait for 5 seconds before destroying effects
                        wait(2)
                
                        -- Destroy all effects
                        for _, effect in ipairs(effects) do
                            if effect then
                                effect:Destroy()
                            end
                        end
                
                        -- Destroy the sound after playing
                        sound:Destroy()
                    else
                        warn("Torso or UpperTorso not found in character")
                    end
                end
                
                playEffectAndSound()
            end)
            task.wait(5)
            local assetId = 17352290656
            local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
            local soundId = "rbxassetid://1841249986"
            
            local sound = Instance.new("Sound")
            sound.SoundId = soundId
            sound.Parent = game.Workspace
            sound:Play()
            
            if effect then
                local character = game.Players.LocalPlayer.Character
                local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
            
                if torso then
                    effect.Parent = torso
                    effect.CFrame = torso.CFrame * CFrame.new(0, 32, -1)
                    wait(18)
                    effect:Destroy()
                end
            end
            
        end)

        task.wait(10)

        local lighting = game:GetService("Lighting")

        local colorCorrection = Instance.new("ColorCorrectionEffect")
        colorCorrection.TintColor = Color3.new(1, 1, 1)
        colorCorrection.Brightness = 0
        colorCorrection.Contrast = 0
        colorCorrection.Saturation = 0
        colorCorrection.Parent = lighting
        
        local blur = Instance.new("BlurEffect")
        blur.Size = 0
        blur.Parent = lighting
        
        local duration = 4
        local increment = 0.05
        
        for i = 0, 1, increment / duration do
            colorCorrection.Brightness = i
            blur.Size = i * 24
            wait(increment)
        end
        
        colorCorrection.Brightness = 0
        blur.Size = 0
        
        colorCorrection:Destroy()
        blur:Destroy()
    end)

    task.spawn(function()
        local character = player.Character or player.CharacterAdded:Wait()
        local camera = workspace.CurrentCamera
        local tweenService = game:GetService("TweenService")

        -- Camera and FOV settings
        local targetFOV = 50  -- Change this to control how close the FOV gets
        local originalFOV = camera.FieldOfView
        local zoomTime = 2  -- Duration for zooming (smooth zoom)

        -- Tween settings for FOV zoom
        local fovTweenInfo = TweenInfo.new(zoomTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local fovTween = tweenService:Create(camera, fovTweenInfo, { FieldOfView = targetFOV })

        local head = character:FindFirstChild("Head") or character:WaitForChild("Head")
        if head then
            camera.CameraType = Enum.CameraType.Scriptable
        
            local offset = character.HumanoidRootPart.CFrame.LookVector * 10
            local cameraPosition = head.Position + offset
                    
            camera.CFrame = CFrame.new(cameraPosition, head.Position)
        end

        fovTween:Play()
        task.wait(17)
                
        local resetFOVTween = tweenService:Create(camera, fovTweenInfo, { FieldOfView = originalFOV })
        resetFOVTween:Play()

        resetFOVTween.Completed:Connect(function()
            camera.CameraType = Enum.CameraType.Custom
        end)
    end)

    task.spawn(function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.Anchored = true
            task.wait(17)
            humanoidRootPart.Anchored = false
        end
    end)

    task.spawn(function()
        task.wait(11)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local camera = game.Workspace.CurrentCamera
        local shakeIntensity = 1
        local RunService = game:GetService("RunService")
        local originalCFrame = camera.CFrame

        for i = 0, shakeIntensity * 250 do
            local shakeOffset = Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1)) * shakeIntensity * 0.1
            camera.CFrame = originalCFrame * CFrame.new(shakeOffset)
            RunService.Heartbeat:Wait()
        end

        camera.CFrame = originalCFrame
        
    end)

    function ActiveAnimation()
        local character = player.Character or player.CharacterAdded:Wait()
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://15561810697"

        local humanoid = character:WaitForChild("Humanoid")
        local animationTrack = humanoid:LoadAnimation(animation)

        animationTrack:Play()
        animationTrack:AdjustSpeed(0.2)
    end
    
    ActiveAnimation()
    task.wait(33)

    for _, data in pairs(originalTransparency) do
        if data.object and data.object.Parent then
            data.object.Transparency = data.transparency
        end
    end
end)
