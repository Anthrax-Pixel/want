-- LocalScript (Inside StarterCharacterScripts)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Wait for the Humanoid and HumanoidRootPart
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Invert character orientation (rotate by 180 degrees)
rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)

-- Set gravity for the local player
workspace.Gravity = -196.2

-- Optional: Loop to ensure the character stays upside down
while true do
    wait(0.1)
    rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)
end
