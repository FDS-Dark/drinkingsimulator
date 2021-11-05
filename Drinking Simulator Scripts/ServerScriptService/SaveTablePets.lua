local Players = game:GetService("Players")
local DSService = game:GetService("DataStoreService")
local data = DSService:GetDataStore("TablePets001")
Players.PlayerAdded:Connect(function(player)
	Instance.new("Folder",player).Name = "Pets"
	Instance.new("Folder",player).Name = "PetsEquiped"
	local key = player.UserId
	local Pets = player:WaitForChild("Pets")
	for i,v in pairs(game.ReplicatedStorage:WaitForChild("Pets"):GetChildren()) do
		Instance.new("IntValue",Pets).Name = tostring(v)
	end
	wait(1)
	local savedLevel = data:GetAsync(key)
	if savedLevel ~= nil then
		for i, data in pairs(savedLevel) do
			local pet = Pets:FindFirstChild(data[1])
			if pet then
				pet.Value = data[2]
			else
				local instance = Instance.new(data[3])
				if instance then
					instance.Name = data[1]
					instance.Value = data[2]
					instance.Parent = Pets
				end
			end
		end
	else
		data:SetAsync(key, {})
	end
end)
Players.PlayerRemoving:Connect(function(player)
	local key = player.UserId
	local savedLevel = data:GetAsync(key)
	local Pets = player:FindFirstChild("Pets")
	if not Pets then return end
	Pets = Pets:GetChildren()
	local objData = {}
	for i, obj in pairs(Pets) do
		table.insert(objData, {obj.Name, obj.Value, obj.ClassName})
	end
	if savedLevel == nil then
		data:SetAsync(key, objData)
	else
		data:UpdateAsync(key, function(oldValue)
			oldValue = objData
			return objData
		end)
	end
end)
game:BindToClose(function()
	for i, player in pairs(Players:GetPlayers()) do
		local key = player.UserId
		local savedLevel = data:GetAsync(key)
		local pets = player:FindFirstChild("Pets")
		if not pets then return end
		pets = pets:GetChildren()
		local objData = {}
		for i, obj in pairs(pets) do
			table.insert(objData, {obj.Name, obj.Value, obj.ClassName})
		end
		if savedLevel == nil then
			data:SetAsync(key, objData)
		else
			data:UpdateAsync(key, function(oldValue)
				oldValue = objData
				return objData
			end)
		end
	end
	wait(3)
end)