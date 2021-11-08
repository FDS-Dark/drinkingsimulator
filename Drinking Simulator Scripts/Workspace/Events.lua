local Players = game:GetService("Players")
Players.PlayerAdded:Connect(function(plr)
	local playerstats = Players:WaitForChild("playerstats")
	local backpackusage = playerstats.BackpackUsage
	local capacity = playerstats.Capacity
	if backpackusage.Value >= capacity.Value then
		backpackusage.Value = capacity.Value
		game.Workspace.Events.Disabled = true
	end
end)

script.AddDrinks.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Drinks.Value = plr.leaderstats.Drinks.Value + 1
end)

script.AddBackpackUsage.OnServerEvent:Connect(function(plr, amount)	
	local mps = game:GetService("MarketplaceService")
	local gamepass = 21278494
	if plr.playerstats.BackpackUsage.Value >= plr.playerstats.Capacity.Value then
		game.Workspace.Events.Disabled = true
		print("Backpack Full!")
		
	elseif plr.playerstats.BackpackUsage.Value < plr.playerstats.Capacity.Value and mps:UserOwnsGamePassAsync(plr.UserId, gamepass) then
		game.Workspace.Events.Disabled = false
		print("Backpack Usage Event Received!")
		script.Sound:Play()
		plr.playerstats.BackpackUsage.Value += amount * 2
	
	elseif plr.playerstats.BackpackUsage.Value < plr.playerstats.Capacity.Value then
		game.Workspace.Events.Disabled = false
		print("Backpack Usage Event Received!")
		script.Sound:Play()
		plr.playerstats.BackpackUsage.Value += amount
	end
end)