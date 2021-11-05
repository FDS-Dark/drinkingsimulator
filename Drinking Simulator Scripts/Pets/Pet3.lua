local torso = script.Parent.Parent.Parent:WaitForChild("HumanoidRootPart")
local bp = script.Parent:WaitForChild("BodyPosition")
local bg = script.Parent:WaitForChild("BodyGyro")
local pety = script.Parent:WaitForChild("pety").Value
local petx = 4

local currentForce = bp.MaxForce

wait()
script.Parent:SetNetworkOwner(game.Players:GetPlayerFromCharacter(torso.Parent))

for _ = 1, math.huge, 0.00001 do
    if script.Parent.Name == "pet1" then
        petx = 4
    elseif script.Parent.Name == "pet2" then
        petx = 2
    elseif script.Parent.Name == "pet3" then
        petx = 0
    elseif script.Parent.Name == "pet4" then
        petx = -2
    elseif script.Parent.Name == "pet5" then
        petx = -4
	elseif script.Parent.Name == "pet6" then
        petx = 4
	elseif script.Parent.Name == "pet7" then
        petx = 2
	elseif script.Parent.Name == "pet8" then
        petx = -2
	elseif script.Parent.Name == "pet9" then
        petx = -4
    end
	if (torso.Position-script.Parent.Position).Magnitude > 1 then
        bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    elseif (torso.Position-script.Parent.Position).Magnitude < 1 and bp.MaxForce ~= currentForce then
        bp.MaxForce = currentForce
    end
	if script.Parent.Name == "pet6" or script.Parent.Name == "pet7" or script.Parent.Name == "pet8" or script.Parent.Name == "pet9" then
		bp.Position = ((torso.CFrame * CFrame.new(petx, pety/100, 0)).Position)
	else
		bp.Position = ((torso.CFrame * CFrame.new(petx, pety/100, 3)).Position)
	end 
    bg.CFrame = torso.CFrame
    wait(0.05)
end