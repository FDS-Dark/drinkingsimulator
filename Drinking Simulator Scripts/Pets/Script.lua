local player = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent
local deb = false
script.Parent.MouseButton1Down:Connect(function()
	if deb == false then
	deb = true
	if player:FindFirstChild("PetsEquiped") and player:FindFirstChild("Pets") and player.Pets:FindFirstChild(tostring(script.Parent.Parent)) and player.Pets[tostring(script.Parent.Parent)].Value >= 1 and script.Parent.Parent.Parent.Parent.Parent:FindFirstChild("UNE") and script.Parent.Parent.Parent.Parent.Parent.UNE:FindFirstChild("Scroll") then
		if player.PetsEquiped:FindFirstChild(tostring(script.Parent.Parent)) then
			player.PetsEquiped[tostring(script.Parent.Parent)]:Destroy()
		end
		player:WaitForChild("Pets")[tostring(script.Parent.Parent)].Value =player:WaitForChild("Pets")[tostring(script.Parent.Parent)].Value - 1 		
	end
	wait(0.5)
	deb = false
	end
end)
