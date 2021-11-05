local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")

local abbreviations = {
	"K", -- 4 digits
	"M", -- 7 digits
	"B", -- 10 digits
	"T", -- 13 digits
	"QD", -- 16 digits
	"QT", -- 19 digits
	"SXT", -- 22 digits
	"SEPT", -- 25 digits
	"OCT", -- 28 digits
	"NON", -- 31 digits
	"DEC", -- 34 digits
	"UDEC", -- 37 digits
	"DDEC", -- 40 digits
}

local function Abbreviate(x)
	if x < 1000 then 
		return tostring(x)
	end

	local digits = math.floor(math.log10(x)) + 1
	local index = math.min(#abbreviations, math.floor((digits - 1) / 3))
	local front = x / math.pow(10, index * 3)

	return string.format("%i%s+", front, abbreviations[index])
end

local number = leaderstats.Coins.Value
local text = Abbreviate(number)

script.Parent.Text = text

leaderstats.Coins.Changed:Connect(function()

	local number = leaderstats.Coins.Value

	local text = Abbreviate(number)
	script.Parent.Text = text
end)