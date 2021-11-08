local db = true
script.Parent.Touched:connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") ~= nil then
		if db == true then
			db = false
			script.Parent.Transparency = 1
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			local randomint = math.random(1,80)
			player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + (1 * player.playerstats.PickupMultiplier.Value)
			script.Sound:Play()
			script.Parent.Transparency = 1
			
			for _,Part in pairs (workspace.Part.Model:GetChildren()) do
				Part.Transparency = 1
			end
			print(randomint)
			wait(randomint)
			db = true
			script.Parent.Transparency = 0.5
			for _,Part in pairs (workspace.Part.Model:GetChildren()) do
				Part.Transparency = 0.3
			end
		end
	end	
end)