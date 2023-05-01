local plr=game.Players.LocalPlayer
local mouse=plr:GetMouse()
local filter=game.Workspace:WaitForChild("Filter")
local thickness=1

function drawLine(x1,z1,x2,z2)
	local length=(Vector2.new(x1,z1)-Vector2.new(x2,z2)).Magnitude
	local fakelength=math.clamp(length,thickness,2048)
	local line=Instance.new("Part")
	line.Size=Vector3.new(thickness,0.1,fakelength)
	local la=CFrame.lookAt(Vector3.new(x1,0.5,z1),Vector3.new(x2,0.5,z2))
	local x,y,z=la:ToOrientation()
	local p=(la*Vector3.new(0,0,-length/2))
	line.CFrame=CFrame.new(p.X,p.Y,p.Z)*CFrame.Angles(x,y,z)
	line.Anchored=true
	line.Material=Enum.Material.SmoothPlastic
	line.Color=Color3.new(0,0,0)
	line.Parent=filter
end

local last=mouse.Hit.Position
local start=nil
local lastAngle=0
local down=false

mouse.Button1Down:Connect(function()
	down=true
end)

mouse.Button1Up:Connect(function()
	down=false
end)

function diff(a,b)
	if a>b then
		return a-b
	end
	return b-a
end

game:GetService("RunService").Heartbeat:Connect(function()
	local p=mouse.Hit.Position
	local xr=math.abs(p.X-last.X)
	local yr=math.abs(p.Z-last.Z)
	local angle=math.deg(math.atan2(yr,xr))
	if down then
		if start then
			if diff(angle,lastAngle)>=5 then
				drawLine(start.X,start.Z,p.X,p.Z)
				start=p
			end
		else
			start=p
		end
	else
		if start then
			drawLine(start.X,start.Z,p.X,p.Z)
			start=nil
		end
	end
	last=p
	lastAngle=angle
end)
