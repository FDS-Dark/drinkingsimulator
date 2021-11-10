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

local function round(n)
	return math.ceil (n - 0.5)
end

script.AddDrinks.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Drinks.Value += 1
end)

script.AddBackpackUsage.OServerEvent:Connect(function(plr, amount)
		local mps = game:GetService("MarketplaceService")
		local gamepass2x = 21278494
		local gamepassvip = --SET ID
		local usage = plr.playerstats.BackpackUsage.value
		local cap = plr.playerstats.Capacity.Value
		local owns2xgamepass = mps:UserOwnsGamePassAsync(plr.UserId, gamepass2x)
		local ownsvipgamepass = mps:UserOwnsGamePassAsync(plr.UserId, gamepassvip)
		
		if usage >= capacity
			usage = capacity
			game.Workspace.Events.Disabled = true
			print("Backpack FUll!")
		
		if usage <= capacity then
			if owns2xgamepass and ownsvipgamepass then
				game.Workspace.Events.Disabled = false
				print("Owns 2x gamepass and vip gamepass - BPU event received")
				script.Sound:Play()
					
				local finalamount = amount * (2 * 1.2)
				local finalvalue = round(finalamount)
				usage += finalvalue
					
			elseif ownsvipgamepass and not owns2xgamepass then
				game.Workspace.Events.Disabled = false
				print("Owns vip gamepass - BPU event received")
				script.Sound:Play()
					
				local finalamount = amount * 1.2
				local finalvalue = round(finalamount)
				usage += finalvalue
					
			elseif owns2xgamepass and not ownsvipgamepass
				game.Workspace.Events.Disabled = false
				print("Owns 2x gamepass - BPU event received")
				script.Sound:Play()
					
				local finalamount = amount * 2
				local finalvalue = round(finalamount)
				usage += finalvalue
			
			elseif not owns2xgamepass and not ownsvipgamepass
				game.Workspace.Events.Disabled = false
				print("No gamepasses - BPU event received")
				script.Sound:Play()
					
				usage += amount
		end
	end)
