

while true do
	for i = 1,4 do
		script.Parent.CFrame = script.Parent.CFrame + Vector3.new(0, 0.1, 0)
		for _,Part in pairs (workspace.Part.Model:GetChildren()) do
			Part.CFrame = Part.CFrame + Vector3.new(0, 0.1, 0)
		end
		wait(0.1)
	end
	for i = 1,4 do
		script.Parent.CFrame = script.Parent.CFrame + Vector3.new(0, -0.1, 0)
		for _,Part in pairs (workspace.Part.Model:GetChildren()) do
			Part.CFrame = Part.CFrame + Vector3.new(0, -0.1, 0)
		end
		wait(0.1)
	end
	wait(0.1)
end