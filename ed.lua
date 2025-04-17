game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Wait for Humanoid and HumanoidRootPart to load
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Invert character orientation (rotate by 180 degrees once)
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)
        
        -- Adjust humanoid's walk direction so they can walk on their head
        humanoid.PlatformStand = true  -- Disable humanoid default control to prevent abnormal behavior
        humanoid.PlatformStand = false  -- Re-enable it to let the humanoid move, keeping the inverted position
        
        -- Keep the character upside down permanently
        while true do
            wait(0.1)
            -- This line will keep the character upside down at all times
            rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(math.rad(180), 0, 0)
        end
    end)
end)
