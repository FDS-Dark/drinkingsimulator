local part = script.Parent
local gm = 1 --GLOBAL MULTIPLIER
local mps = game:GetService("MarketplaceService")
local gamepass = 21252264

part.Touched:Connect(function(hit)
	local h = hit.parent:FindFirstChild("Humanoid")
	if h then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if player then
			local leaderstats = player:WaitForChild("leaderstats")
			local playerstats = player:WaitForChild("playerstats")
			local Coins = leaderstats.Coins
			local BackpackUsage = playerstats.BackpackUsage
			
			local s = BackpackUsage.Value
			local c = Coins.Value
			local rm = playerstats.RebirthMultiplier.Value
			
			if s > 0 and mps:UserOwnsGamePassAsync(player.UserId, gamepass) then
				c += s * (gm * rm * 2)
				s = 0
				script.Parent.Sound:Play()
				game.Workspace.Events.Disabled = false
			elseif s > 0 then
				c += s * (gm * rm)
				s = 0
				script.Parent.Sound:Play()
				game.Workspace.Events.Disabled = false
			end
		end
	end
end)