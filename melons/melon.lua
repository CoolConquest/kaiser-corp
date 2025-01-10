local klipisweartogodifyouputhawktuahinthiscodeiwillcrashout = {}

function klipisweartogodifyouputhawktuahinthiscodeiwillcrashout.watermelon()
	local clone = game.ReplicatedStorage.melon:Clone()
	clone.Anchored = false
	clone.Parent = game.Workspace
	clone.AssemblyLinearVelocity = Vector3.new(math.random(-40,40), math.random(60,110), math.random(-40,40))
	clone.Size = clone.Size * (math.random(10,20) * 0.1)
end

return klipisweartogodifyouputhawktuahinthiscodeiwillcrashout
