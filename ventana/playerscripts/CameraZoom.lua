-- services
local UIS = game:GetService("UserInputService")
-- variables
local Cam = game.Workspace.CurrentCamera
--main script
local Info = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)
UIS.InputBegan:Connect(function(Input, gameProcessed)
if gameProcessed then return end
--exits function if player is typing 
	if  Input.KeyCode == Enum.KeyCode.E then
		Cam.FieldOfView -= 15
	end
	if Cam.FieldOfView<=1 then
		Cam.FieldOfView = 70
	end
end)



