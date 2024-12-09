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

    spawn(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/VQtT96tq", true))()
    end)

    spawn(function()
        loadstring(game:HttpGet("https://pastefy.app/N7pxiTFK/raw", true))()
    end)

    spawn(function()
        loadstring(game:HttpGet("https://pastefy.app/FCSAHpU5/raw", true))()
    end)

    spawn(function()
        loadstring(game:HttpGet("https://pastefy.app/57FC6Xd5/raw", true))()
    end)

    spawn(function()
        loadstring(game:HttpGet("https://pastefy.app/X7VYuqA5/raw", true))()
    end)

    wait(33)

    for _, data in pairs(originalTransparency) do
        if data.object and data.object.Parent then
            data.object.Transparency = data.transparency
        end
    end
end)
