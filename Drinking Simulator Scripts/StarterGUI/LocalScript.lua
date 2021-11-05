local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local playerstats = player:WaitForChild("playerstats")
local backpackusage = playerstats.BackpackUsage
local capacity = playerstats.Capacity
local value = script.Parent

value.Text = backpackusage.Value.." / "..capacity.Value

backpackusage:GetPropertyChangedSignal("Value"):Connect(function()
	if backpackusage.Value == capacity.value then print("Backpack full!")
	elseif backpackusage.Value > capacity.value then
		backpackusage.Value = capacity.value
		print("Go sell!")
	end
	value.Text = backpackusage.Value.." / "..capacity.Value
end)