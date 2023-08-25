local Run = game:GetService("RunService")
local AVGTableLength = 50
local AVG = {}
Run.RenderStepped:Connect(function(dt)
	table.insert(AVG, 1/dt)
	if #AVG > AVGTableLength then
		table.remove(AVG,1)
	end
	local average=0
	for _,v in AVG do
		average+=v
	end
	average/=#AVG
	
	print("FPS: "..math.floor(average))
end)
