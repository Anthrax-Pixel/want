-- Server-side Script (Place in ServerScriptService)
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Wait for Humanoid and HumanoidRootPart
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Invert character orientation
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)
        
        -- Set gravity for everyone to inverted gravity
        workspace.Gravity = -196.2
        
        -- Optional: You can also add a loop to make sure the character stays upside down
        while true do
            wait(0.1)
            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)
        end
    end)
end)
