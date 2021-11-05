while true do
	wait()
	local p1 = script.Parent:FindFirstChild("1")
	local p2 = script.Parent:FindFirstChild("2")
	if p1 and p2 then
		p1.Rotation = p1.Rotation + 3
		p2.Rotation = p2.Rotation - 3
	end
end