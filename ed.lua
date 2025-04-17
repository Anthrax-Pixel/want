local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local head = character:WaitForChild("Head")

-- Create an attachment and align orientation to spin the head
local attachment = Instance.new("Attachment", head)

local alignOrientation = Instance.new("AlignOrientation")
alignOrientation.Attachment0 = attachment
alignOrientation.RigidityEnabled = true
alignOrientation.MaxTorque = math.huge
alignOrientation.Responsiveness = 200
alignOrientation.Parent = head

-- Spin speed (in radians per second)
local spinSpeed = 5

-- Get RunService once at the top
local RunService = game:GetService("RunService")

-- Run the spinning loop
RunService.Heartbeat:Connect(function(deltaTime)
	local currentOrientation = attachment.Orientation
	attachment.Orientation = Vector3.new(
		currentOrientation.X,
		currentOrientation.Y + math.deg(spinSpeed * deltaTime),
		currentOrientation.Z
	)
end)

