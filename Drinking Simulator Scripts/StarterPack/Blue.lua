local cd = false
local player = game.Players.LocalPlayer

script.Parent.Activated:Connect(function()
	if cd == false then
		cd = true
		game.Workspace.Events.AddDrinks:FireServer()
		game.Workspace.Events.AddBackpackUsage:FireServer(4)
		script.Parent.Enabled = false
		wait(1)
		script.Parent.Enabled = true
		cd = false
	end
end)