local suffixes = {'','K','M','B','T','qd','Qn','sx','Sp','O','N','de','Ud','DD','tdD','qdD','QnD','sxD','SpD','OcD','NvD','Vgn','UVg','DVg','TVg','qtV','QnV','SeV','SPG','OVG','NVG','TGN','UTG','DTG','tsTG','qtTG','QnTG','ssTG','SpTG','OcTG','NoAG','UnAG','DuAG','TeAG','QdAG','QnAG','SxAG','SpAG','OcAG','NvAG','CT'}
local function format(val)
	for i=1, #suffixes do
		if tonumber(val) < 10^(i*3) then
			return math.floor(val/((10^((i-1)*3))/100))/(100)..suffixes[i]
		end
	end
end
local id = 6172708 --// GAMEPASS ID, + 30 SLOTS
local TS = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")
local Library = RS:WaitForChild("View")
local Eggs = require(RS:WaitForChild("Eggs"))
local Data = Eggs[script.Parent.Name]
local module = require(game.ReplicatedStorage:WaitForChild("PETS"))
local Cost = Data["Cost"]
local Pets = Data["Pets"]
local Buy = script.Parent:WaitForChild("Buy")
local CD = Buy:WaitForChild("ClickDetector")
local CostGUI = Buy:WaitForChild("Cost")
local CostText = CostGUI:WaitForChild("TextLabel")
local NamePlate = script.Parent:WaitForChild("NamePlate")
local NameGUI = NamePlate:WaitForChild("Name")
local NameText = NameGUI:WaitForChild("TextLabel")
local Egg = script.Parent:WaitForChild("Egg")
CostText.Text = format(Cost)
NameText.Text = script.Parent.Name.." Egg"


local TotalWeight = 0
for i,v in pairs(Pets) do
	TotalWeight = TotalWeight + v[1]
end

local function RotateTween(Obj,Rot)
	local TI = TweenInfo.new(.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
	local Propertiers = {
		Rotation = Rot
	}
	local Tween = TS:Create(Obj,TI,Propertiers)
	Tween:Play()
end

local function ChoosePet()
	local Chance = math.random(1,TotalWeight)
	local Counter = 0
	for i,v in pairs(Pets) do
		Counter = Counter+v[1]
		if Chance <= Counter then
			return i
		end
	end
end

local function UnBoxPet(Player)
	local PetChosen = ChoosePet()
	local GUI = Instance.new("ScreenGui")
	local ViewPort = Instance.new("ViewportFrame")
	local PetInv = Player:WaitForChild("Pets")
	PetInv:WaitForChild(PetChosen).Value = PetInv:WaitForChild(PetChosen).Value +1
	ViewPort.Size = UDim2.new(1,0,1,0)
	ViewPort.BackgroundTransparency = 1
	local EggClone = Egg:Clone()
	local Pos = EggClone.Position
	EggClone.Parent = ViewPort
	local Camera = Instance.new("Camera")
	Camera.Parent = ViewPort
	ViewPort.CurrentCamera = Camera
	Camera.CFrame = CFrame.new(Vector3.new(Pos.X,Pos.Y,Pos.Z+7),Pos)
	local pn = script:WaitForChild("Effect"):Clone()
	local module = require(game.ReplicatedStorage:WaitForChild("PETS"))
	local nm = script:WaitForChild("NOME"):Clone()
	nm.Text = module.Pets[tonumber(PetChosen)]	
	ViewPort.Parent = GUI
	GUI.Parent = Player:WaitForChild("PlayerGui")
	wait(.5)
	for i=1,5 do
		RotateTween(ViewPort,50)
		wait(0.05)
		RotateTween(ViewPort,-50)
		wait(0.05)
		RotateTween(ViewPort,50)
		wait(0.05)
	end
	RotateTween(ViewPort,0)
	wait(.25)
	EggClone:Destroy()
	nm.Parent = GUI
	pn.Visible = true
	pn.Parent = ViewPort
	local PetClone = Library:WaitForChild(PetChosen):Clone()
	local HeadPos = PetClone.Position
	Camera.CFrame = CFrame.new(Vector3.new(HeadPos.X,HeadPos.Y,HeadPos.Z+7),HeadPos)
	PetClone.Parent = ViewPort
	wait(2)
	GUI:Destroy()
end

CD.MouseClick:Connect(function(Player)
	local Stats = Player:WaitForChild("leaderstats")
	local Coins = Stats:WaitForChild("Coins")
	local PetInv = Player:WaitForChild("Pets")
	if Player:FindFirstChild("DebPet") then return end
	local Counter = 0
	for i,v in pairs(PetInv:GetChildren()) do
		Counter=Counter+v.Value
	end
	if Coins.Value >= Cost then
		if Counter >= 50 and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(Player.UserId, id) then
			local GUI = Instance.new("ScreenGui")
			local PN = script:WaitForChild("Full"):Clone()
			PN.Parent = GUI
			GUI.Parent = Player:WaitForChild("PlayerGui")
			wait(2)
			GUI:Destroy()
		elseif Counter >= 20 and not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(Player.UserId, id) then
			local GUI = Instance.new("ScreenGui")
		local PN = script:WaitForChild("Full"):Clone()
			PN.Parent = GUI
			GUI.Parent = Player:WaitForChild("PlayerGui")
			wait(2)
			GUI:Destroy()
		else
			local debounce = Instance.new("BoolValue")
			debounce.Name = "DebPet"
			debounce.Parent = Player
			Coins.Value = Coins.Value - Cost
			UnBoxPet(Player)
			debounce:Destroy()
		end
	else
		local GUI = Instance.new("ScreenGui")
		local PN = script:WaitForChild("NoCoins"):Clone()
		PN.Parent = GUI
		GUI.Parent = Player:WaitForChild("PlayerGui")
		wait(2)
		GUI:Destroy()
	end
end)
