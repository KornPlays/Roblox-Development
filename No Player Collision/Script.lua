local ps=game:GetService("PhysicsService")
ps:RegisterCollisionGroup("Player")
ps:CollisionGroupSetCollidable("Player","Player",false)
game.Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAppearanceLoaded:Connect(function(char)
        for i,v in ipairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CollisionGroup="Player"
            end
        end
    end)
end)
