local player = script.Parent.Parent.Parent.Parent.Parent
local enabled = false
local id = 6172711 --// YOUR GAMEPASS HERE!

repeat
wait(1)
script.Parent:WaitForChild("Scroll"):ClearAllChildren()
for k,g in pairs(player:WaitForChild("Pets"):GetChildren()) do
	for i,n in pairs(player:WaitForChild("Pets"):GetChildren()) do
		local SP = game.ReplicatedStorage:WaitForChild("Pets")
			for i=1,n.Value do
				local new = script:WaitForChild("Template"):Clone()
				new.Name = tostring(n)
				if SP:FindFirstChild(tostring(n)) and SP[tostring(n)]:FindFirstChild("Icon") and SP[tostring(n)]:FindFirstChild("CoinBoost") then
					new:WaitForChild("PNG").Image = SP[tostring(n)].Icon.Value
					new:WaitForChild("Boost").BoostInfo.Text = "+" .. SP[tostring(n)].CoinBoost.Value
				end
				new.Parent = script.Parent:WaitForChild("Scroll")
			end
		end
	script:WaitForChild("UIGridLayout"):Clone().Parent = script.Parent:WaitForChild("Scroll")
g.Changed:Connect(function()
	script.Parent:WaitForChild("Scroll"):ClearAllChildren()
	for i,n in pairs(player:WaitForChild("Pets"):GetChildren()) do
		local SP = game.ReplicatedStorage:WaitForChild("Pets")
		for i=1,n.Value do
			local new = script:WaitForChild("Template"):Clone()
			new.Name = tostring(n)
			if SP:FindFirstChild(tostring(n)) and SP[tostring(n)]:FindFirstChild("Icon") and SP[tostring(n)]:FindFirstChild("CoinBoost") then
				new:WaitForChild("PNG").Image = SP[tostring(n)].Icon.Value
				new:WaitForChild("Boost").BoostInfo.Text = "+" .. SP[tostring(n)].CoinBoost.Value
			end
		new.Parent = script.Parent:WaitForChild("Scroll")
	end
script:WaitForChild("UIGridLayout"):Clone().Parent = script.Parent:WaitForChild("Scroll")
	for i,v in pairs(script.Parent:WaitForChild("Scroll"):GetChildren()) do
		if v:IsA("ImageLabel") then
			v:WaitForChild("Equip").MouseButton1Down:Connect(function()
				if enabled == false then
					enabled = true
						local char = player.Character
							local pets = game:GetService("ReplicatedStorage"):WaitForChild("Pets")
								if char and pets then	
									local pp = player:WaitForChild("Pets")
									local getp = 0
									for g,h in pairs(player:WaitForChild("PetsEquiped"):GetChildren())do
										if tostring(h) == tostring(v) then
											getp = getp + 1
										end
									end
									if pp:FindFirstChild(tostring(v)) and pp[tostring(v)].Value > getp then 						
										if not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet1") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet1"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped") 
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet2") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet2"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet3") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet3"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet4") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet4"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet5") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet5"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet6") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, id) then 
												local vv = Instance.new("StringValue")
												vv.Value = "pet6"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet7") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, id) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet7"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet8") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, id) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet8"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
											end
										elseif not char:WaitForChild("HumanoidRootPart"):FindFirstChild("pet9") then
											if player:WaitForChild("Pets"):FindFirstChild(tostring(v)) and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, id) then
												local vv = Instance.new("StringValue")
												vv.Value = "pet9"
												vv.Name = tostring(v)
												vv.Parent = player:WaitForChild("PetsEquiped")
												end
											end
										end
										wait(1)
									enabled = false
								end	
							end
						end)
					end
				end
			end
		end)
	end
until not #player:WaitForChild("Pets"):GetChildren() ~=  #game.ReplicatedStorage:WaitForChild("Pets"):GetChildren()
	
	
	
	