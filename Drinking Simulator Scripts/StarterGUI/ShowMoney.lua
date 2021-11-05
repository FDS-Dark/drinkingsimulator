click = 0
local plr = game.Players.LocalPlayer
while wait() do
	if click ~= plr.leaderstats.Coins.Value then
		local random = math.random(1,1000)
		local xnew = random/1000
		local new = game.ReplicatedStorage.ShowDrinks:Clone()
		new.Parent = script.Parent.Popup
		new.Position = UDim2.new(xnew,0,1,0)
		new.Text = ""..plr.leaderstats.Coins.Value - click.."??"
		click = plr.leaderstats.Coins.Value
		wait(1)
		new:Destroy()
	end
end