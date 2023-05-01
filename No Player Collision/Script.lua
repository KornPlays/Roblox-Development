local filter=game.Workspace:WaitForChild("Filter")
game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		char.AncestryChanged:Wait()
		game:GetService("RunService").Stepped:Wait()
		plr.Character.Parent=filter
	end)
end)
