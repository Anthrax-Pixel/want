-- LocalScript — place it in StarterPlayerScripts or a GUI button callback

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

-- Run the spinning loop
game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
	local currentOrientation = attachment.Orientation
	attachment.Orientation = Vector3.new(
		currentOrientation.X,
		currentOrientation.Y + math.deg(spinSpeed * deltaTime),
		currentOrientation.Z
	)
end)
