local groupid = 11701137 -- groupID --- your group id 

game.Players.PlayerAdded:Connect(function(player)
	if player:IsInGroup(groupid) then
		if (player:GetRankInGroup(groupid) == 255) then
			local ownertag = {
				{
					TagText = "Owner", -- Do not change
					TagColor = Color3.fromRGB(218, 7, 255) -- Group Role Tag Color
				}
			}
			local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService)
			local speaker = nil
			while speaker == nil do
				speaker = ChatService:GetSpeaker(player.Name)
				if speaker ~= nil then break end
				wait(0.01)
			end
			speaker:SetExtraData("Tags",ownertag)
			speaker:SetExtraData("ChatColor",Color3.fromRGB(255, 170, 0)) -- Group Chat Color

		elseif (player:GetRankInGroup(groupid) == 254) then
			local devtag = {
				{
					TagText = "Developer",
					TagColor = Color3.fromRGB(0, 100, 255)
				}
			}
			local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService)
			local speaker = nil
			while speaker == nil do
				speaker = ChatService:GetSpeaker(player.Name)
				if speaker ~= nil then break end
				wait(0.01)
			end
			speaker:SetExtraData("Tags",devtag)
			speaker:SetExtraData("ChatColor",Color3.fromRGB(255, 170, 0)) -- Group Chat Color
		elseif (player:GetRankInGroup(groupid) <=253) then
			print("Player Is Member.")
		end
	end
end)