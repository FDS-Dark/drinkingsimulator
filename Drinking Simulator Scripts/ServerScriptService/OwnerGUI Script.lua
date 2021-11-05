local owner = game:GetService("ServerStorage"):WaitForChild("OwnerTag")
local dev = game:GetService("ServerStorage"):WaitForChild("DevTag")
local member = game:GetService("ServerStorage"):WaitForChild("MemberTag")

local ownerrole = 255
local devrole = 254
local memberrole = 1



game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect (function(char)
		local head = char.HumanoidRootPart
		if player:IsInGroup(11701137) then
			if (player:GetRankInGroup(11701137) == 255) then
				local clonedgui = owner:Clone()
				clonedgui.TextLabel.Text = "Owner"
				clonedgui.TextLabel.TextColor3 = Color3.fromRGB(218, 7, 255)
				clonedgui.Parent = game.Workspace:WaitForChild(player.Name).HumanoidRootPart
				clonedgui.Adornee = head
			else
				if (player:GetRankInGroup(11701137) == 254) then
					local clonedgui = dev:Clone()
					clonedgui.TextLabel.Text = "Developer"
					clonedgui.TextLabel.TextColor3 = Color3.fromRGB(0, 100, 255)
					clonedgui.Parent = game.Workspace:WaitForChild(player.Name).HumanoidRootPart
					clonedgui.Adornee = head
				else
					if (player:GetRankInGroup(11701137) == 1) then
						local clonedgui = member:Clone()
						clonedgui.TextLabel.Text = "Member"
						clonedgui.TextLabel.TextColor3 = Color3.fromRGB(85, 255, 255)
						clonedgui.Parent = game.Workspace:WaitForChild(player.Name).HumanoidRootPart
						clonedgui.Adornee = head
					else
					end
				end
			end
		end
	end)
end)




