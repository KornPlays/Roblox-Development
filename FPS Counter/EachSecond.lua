local totalDelta=0
local frames=0
game:GetService("RunService").RenderStepped:Connect(function(delta)
	totalDelta+=delta
	frames+=1
	if totalDelta>=1 then
		print("FPS:",math.round(frames/totalDelta))
		totalDelta=0
		frames=0
	end
end)
