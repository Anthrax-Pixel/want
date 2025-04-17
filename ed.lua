-- Server-side Script (Place in ServerScriptService)
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Wait for Humanoid and HumanoidRootPart to load
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Invert character orientation (rotate by 180 degrees)
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)
        
        -- Set gravity for everyone to inverted gravity
        workspace.Gravity = -196.2
        
        -- Optional: Loop to ensure the character stays upside down
        while true do
            wait(0.1)
            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)
        end
    end)
end)
