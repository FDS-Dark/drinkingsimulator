game.Players.PlayerAdded:Connect(function(plr)
	local new = game.ReplicatedStorage:WaitForChild("Server"):Clone()
	new.Parent = plr:WaitForChild("PlayerGui")
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").DisplayDistanceType = "None"
		for i,v in pairs(plr:WaitForChild("PetsEquiped"):GetChildren())do
			if game.ReplicatedStorage:WaitForChild("Pets"):FindFirstChild(tostring(v)) then
				local get = game.ReplicatedStorage:WaitForChild("Pets")[tostring(v)]:Clone()
				get.Name = v.Value
				get.Parent = char:WaitForChild("HumanoidRootPart")
			end
		end
	end)
end)