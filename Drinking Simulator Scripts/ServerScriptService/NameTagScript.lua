local rep = game:GetService("ReplicatedStorage")
local nametag = rep.NameTag
local uppertext = nametag.UpperText

game.Players.PlayerAdded:Connect (function(player)
	player.CharacterAdded:Connect (function(char)
		local head = char.HumanoidRootPart
		local newtext = nametag:Clone ()
		local uppertext = newtext.UpperText
		local humanoid = char.Humanoid
		humanoid.DisplayDistanceType = "None"
		
		
		newtext.Parent = head
		newtext.Adornee = head
		uppertext.Text = player.Name

	end)
end)