-- LocalScript — place it in StarterPlayerScripts

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local RunService = game:GetService("RunService")

local spinSpeed = 5 -- Radians per second
local angle = 0

RunService.Heartbeat:Connect(function(deltaTime)
	angle = angle + spinSpeed * deltaTime
	rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, spinSpeed * deltaTime, 0)
end)


