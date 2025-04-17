-- LocalScript (Inside StarterCharacterScripts)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Wait for the Humanoid and HumanoidRootPart
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Invert character orientation (rotate by 180 degrees once)
rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)

-- Keep the character upside down permanently without changing gravity
while true do
    wait(0.1)
    rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(math.rad(180), 0, 0)
end
