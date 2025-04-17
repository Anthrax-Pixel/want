-- LocalScript (Inside StarterCharacterScripts)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Wait for the Humanoid and HumanoidRootPart to load
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Invert character orientation (rotate by 180 degrees once)
rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)

-- Adjust humanoid's walk direction so they can walk on their head
humanoid.PlatformStand = true  -- Disable humanoid default control
humanoid.PlatformStand = false -- Re-enable humanoid movement so it walks properly

-- Keep the character upside down permanently
while true do
    wait(0.1)
    rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(math.rad(180), 0, 0)
end
