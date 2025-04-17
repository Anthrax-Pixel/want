--update 2222222

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
local speed = 1  -- Speed of the dance
local stepTime = 1 / speed  -- Time for each step
local currentStep = 0

local RunService = game:GetService("RunService")

-- Helper function to animate one step
local function animateStep(step)
    local leftArmRotation, rightArmRotation, leftLegRotation, rightLegRotation, headRotation

    if step == 0 then
        -- Step 1: Arms raised forward and bent, legs straight
        leftArmRotation = math.rad(90)  -- Left arm forward
        rightArmRotation = math.rad(-90)  -- Right arm forward
        leftLegRotation = 0  -- Legs straight
        rightLegRotation = 0  -- Legs straight
        headRotation = 0
    elseif step == 1 then
        -- Step 2: Left arm up, right arm up, legs spread apart
        leftArmRotation = math.rad(45)  -- Left arm up
        rightArmRotation = math.rad(45)  -- Right arm up
        leftLegRotation = math.rad(45)  -- Left leg bent
        rightLegRotation = math.rad(-45)  -- Right leg bent
        headRotation = math.rad(5)
    elseif step == 2 then
        -- Step 3: Arms down, legs straight, head slightly tilted
        leftArmRotation = 0  -- Left arm down
        rightArmRotation = 0  -- Right arm down
        leftLegRotation = 0  -- Legs straight
        rightLegRotation = 0  -- Legs straight
        headRotation = math.rad(5)
    elseif step == 3 then
        -- Step 4: Arms crossed, legs crossed
        leftArmRotation = math.rad(-45)  -- Left arm across
        rightArmRotation = math.rad(45)  -- Right arm across
        leftLegRotation = math.rad(45)  -- Left leg bent
        rightLegRotation = math.rad(-45)  -- Right leg bent
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
