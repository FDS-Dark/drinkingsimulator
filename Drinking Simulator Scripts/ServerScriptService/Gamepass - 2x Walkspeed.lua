local gamepass = 21153507
local mps = game:GetService("MarketplaceService")

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		if mps:UserOwnsGamePassAsync(player.UserId, gamepass) then
			local h = character:WaitForChild("Humanoid")
			h.WalkSpeed = h.WalkSpeed + 40
		end
	end)
end)
