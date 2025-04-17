-- LocalScript — place this in StarterPlayerScripts or a GUI callback

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Getting key parts
local rootPart = character:WaitForChild("HumanoidRootPart")
local head = character:WaitForChild("Head")
local leftArm = character:WaitForChild("LeftUpperArm")
local rightArm = character:WaitForChild("RightUpperArm")

-- Getting Motor6D joints
local neck = head:FindFirstChildWhichIsA("Motor6D")
local leftArmMotor = leftArm:FindFirstChildWhichIsA("Motor6D")
local rightArmMotor = rightArm:FindFirstChildWhichIsA("Motor6D")

-- Timing and angle control
local angle = 0
local speed = 3  -- Controls speed of movement
local rotationAmount = math.rad(20)  -- How far to rotate per loop

local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function(deltaTime)
	angle = angle + speed * deltaTime  -- Increment the angle over time
	
	-- Creating oscillating effect for arms and head using sine and cosine for smooth movement
	local leftArmRotation = math.sin(angle) * rotationAmount
	local rightArmRotation = -math.sin(angle) * rotationAmount
	local headRotation = math.cos(angle) * rotationAmount

	-- Apply the rotations to the Motor6D joints (arms and head)
	if leftArmMotor then
		leftArmMotor.C0 = CFrame.Angles(0, leftArmRotation, 0)
	end
	if rightArmMotor then
		rightArmMotor.C0 = CFrame.Angles(0, rightArmRotation, 0)
	end
	if neck then
		neck.C0 = CFrame.Angles(headRotation, 0, 0)
	end
end)
