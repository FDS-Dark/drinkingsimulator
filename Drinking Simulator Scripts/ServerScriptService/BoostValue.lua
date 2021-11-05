game.Players.PlayerAdded:Connect(function(plr)
	Instance.new("NumberValue",plr).Name = "CoinBoost"
	Instance.new("NumberValue",plr).Name = "DrinksBoost"
end)