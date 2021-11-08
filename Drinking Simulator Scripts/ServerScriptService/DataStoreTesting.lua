local DataStoreService = game:GetService("DataStoreService")
local playerData = DataStoreService:GetDataStore("PlayerDataTesting13")

local function onPlayerJoin(player) --Creates Leaderstats folder & Playerstats Folder
	--Folder Names--
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local playerstats = Instance.new("Folder")
	playerstats.Name = "playerstats"
	playerstats.Parent = player
	
	local petstats = Instance.new("Folder")
	petstats.Name = "petstats"
	petstats.Parent = player
	
	--Leaderstats Values (On leaderboard)--	
	local drinks = Instance.new("IntValue")
	drinks.Name = "Drinks"
	drinks.Parent = leaderstats
	
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = leaderstats
	
	local gems = Instance.new("IntValue")
	gems.Name = "Gems"
	gems.Parent = leaderstats

	local rebirths = Instance.new("IntValue")
	rebirths.Name = "Rebirths"
	rebirths.Parent = leaderstats
	
	-- Playerstats Values (Not on leaderboard)--	
	local rubies = Instance.new("IntValue")
	rubies.Name = "Rubies"
	rubies.Parent = playerstats
	
	local capacity = Instance.new("IntValue")
	capacity.Name = "Capacity"
	capacity.Parent = playerstats
	
	local backpackusage = Instance.new("IntValue")
	backpackusage.Name = "BackpackUsage"
	backpackusage.Parent = playerstats
	
	local multiplier = Instance.new("IntValue")
	multiplier.Name = "Multiplier"
	multiplier.Parent = playerstats
	
	local clickmultiplier = Instance.new("IntValue")
	clickmultiplier.Name = "ClickMultiplier"
	clickmultiplier.Parent = playerstats
	
	local sellmultiplier = Instance.new("IntValue")
	sellmultiplier.Name = "SellMultiplier"
	sellmultiplier.Parent = playerstats
	
	local pickupmultiplier = Instance.new("IntValue")
	pickupmultiplier.Name = "PickupMultiplier"
	pickupmultiplier.Parent = playerstats
	

	local rebirthmultiplier = Instance.new("IntValue")
	rebirthmultiplier.Name = "RebirthMultiplier"
	rebirthmultiplier.Parent = playerstats
	
	local playerUserId = "Player_"..player.UserId
	local data = playerData:GetAsync(playerUserId)
	
	if data then
		drinks.Value = data["Drinks"] or 0
		coins.Value = data["Coins"] or 0
		gems.Value = data["Gems"] or 0
		rubies.Value = data["Rubies"] or 0
		rebirths.Value = data["Rebirths"] or 0
		capacity.Value = data["Capacity"] or 25
		backpackusage.Value = data["BackpackUsage"] or 0
		multiplier.Value = data["Multiplier"] or 1
		clickmultiplier.Value = data["ClickMultiplier"] or 1
		sellmultiplier.Value = data["SellMultiplier"] or 1
		pickupmultiplier.Value = data["PickupMultiplier"] or 1
		rebirthmultiplier.Value = data["RebirthMultiplier"] or 1
		
	else
		drinks.Value = 0
		coins.Value = 0
		gems.Value = 0
		rebirths.Value = 0
		capacity.Value = 25
		backpackusage.Value = 0
		multiplier.Value = 1
		clickmultiplier.Value = 1
		sellmultiplier.Value = 1
		pickupmultiplier.Value = 1
		rebirthmultiplier.Value = 1
	end
end

local function create_table(player)
	local player_stats = {}
		for _, stat in pairs(player.leaderstats:GetChildren()) do
			player_stats[stat.Name] = stat.Value
		
		for _, stat in pairs(player.playerstats:GetChildren()) do
			player_stats[stat.Name] = stat.Value
			
		for _, stat in pairs(player.petstats:GetChildren()) do
				player_stats[stat.Name] = stat.Value
		end
			
		end
		end
		return player_stats
end

local function onPlayerExit(player)
	local player_stats = create_table(player)
	local success, err = pcall(function()
		local playerUserId = "Player_"..player.UserId
		playerData:SetAsync(playerUserId, player_stats)
	end)
	
	if not success then
		warn("Could not save data")
	end
end

game.Players.PlayerAdded:Connect(onPlayerJoin)
game.Players.PlayerRemoving:Connect(onPlayerExit)
