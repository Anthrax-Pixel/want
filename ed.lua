-- LocalScript — place this in StarterPlayerScripts

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Getting key parts
local rootPart = character:WaitForChild("HumanoidRootPart")
local head = character:WaitForChild("Head")
local leftArm = character:WaitForChild("LeftUpperArm")
local rightArm = character:WaitForChild("RightUpperArm")
local leftLeg = character:WaitForChild("LeftUpperLeg")
local rightLeg = character:WaitForChild("RightUpperLeg")

-- Getting Motor6D joints
local neck = head:FindFirstChildWhichIsA("Motor6D")
local leftArmMotor = leftArm:FindFirstChildWhichIsA("Motor6D")
local rightArmMotor = rightArm:FindFirstChildWhichIsA("Motor6D")
local leftLegMotor = leftLeg:FindFirstChildWhichIsA("Motor6D")
local rightLegMotor = rightLeg:FindFirstChildWhichIsA("Motor6D")

-- Macarena steps control (timing and angle)
local stepAngle = math.rad(45)  -- How much to rotate the arms and legs each step
local speed = 1.5  -- Speed of the dance

local stepTime = 1 / speed  -- Time for each step
local currentStep = 0

local RunService = game:GetService("RunService")

-- Helper function to animate one step
local function animateStep(step)
    local leftArmRotation, rightArmRotation, leftLegRotation, rightLegRotation, headRotation

    if step == 0 then
        -- Position for first step of Macarena
        leftArmRotation = math.rad(90)
        rightArmRotation = math.rad(-90)
        leftLegRotation = math.rad(90)
        rightLegRotation = math.rad(-90)
        headRotation = 0
    elseif step == 1 then
        -- Second step of Macarena
        leftArmRotation = math.rad(-45)
        rightArmRotation = math.rad(45)
        leftLegRotation = math.rad(-45)
        rightLegRotation = math.rad(45)
        headRotation = math.rad(5)
    elseif step == 2 then
        -- Third step of Macarena
        leftArmRotation = math.rad(90)
        rightArmRotation = math.rad(-90)
        leftLegRotation = math.rad(90)
        rightLegRotation = math.rad(-90)
        headRotation = math.rad(10)
    elseif step == 3 then
        -- Fourth step of Macarena
        leftArmRotation = math.rad(-45)
        rightArmRotation = math.rad(45)
        leftLegRotation = math.rad(-45)
        rightLegRotation = math.rad(45)
        headRotation = math.rad(5)
    end

    -- Apply rotations to parts
    if leftArmMotor then
        leftArmMotor.C0 = CFrame.new(leftArmMotor.C0.Position) * CFrame.Angles(0, leftArmRotation, 0)
    end
    if rightArmMotor then
        rightArmMotor.C0 = CFrame.new(rightArmMotor.C0.Position) * CFrame.Angles(0, rightArmRotation, 0)
    end
    if leftLegMotor then
        leftLegMotor.C0 = CFrame.new(leftLegMotor.C0.Position) * CFrame.Angles(0, leftLegRotation, 0)
    end
    if rightLegMotor then
        rightLegMotor.C0 = CFrame.new(rightLegMotor.C0.Position) * CFrame.Angles(0, rightLegRotation, 0)
    end
    if neck then
        neck.C0 = CFrame.new(neck.C0.Position) * CFrame.Angles(headRotation, 0, 0)
    end
end

-- Dance loop
RunService.Heartbeat:Connect(function(deltaTime)
    -- Update step based on time
    currentStep = math.floor((tick() / stepTime) % 4)

    -- Animate the current step of the dance
    animateStep(currentStep)
end)
