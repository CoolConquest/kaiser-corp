--Copy and paste into starter player scripts
local UIS = game:GetService("UserInputService")

--Camera module services
local cameraModule = script.Parent:WaitForChild("PlayerModule"):WaitForChild("CameraModule")

local CameraUtils = require(cameraModule:WaitForChild("CameraUtils"))
local BaseCamera = require(cameraModule:WaitForChild("BaseCamera"))
local CameraUI = require(cameraModule:WaitForChild("CameraUI"))
local CameraInput = require(cameraModule:WaitForChild("CameraInput"))
local CameraToggleStateController = require(cameraModule:WaitForChild("CameraToggleStateController"))

local UserGameSettings = UserSettings():GetService("UserGameSettings")

local MouseLocked = false

local mouseBehavior = Enum.MouseBehavior.LockCenter
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end --exit function if they are typing

	if input.KeyCode == Enum.KeyCode.R then
		MouseLocked = not MouseLocked --turn mouselocked to true if false, false if true

		if MouseLocked then --if true then lock mouse
			mouseBehavior = Enum.MouseBehavior.LockCenter
			UIS.MouseBehavior = Enum.MouseBehavior.LockCenter

		else
			mouseBehavior = Enum.MouseBehavior.Default
			UIS.MouseBehavior = Enum.MouseBehavior.Default
		end
	end
end)

local debounce = false

function BaseCamera:UpdateMouseBehavior()
	local blockToggleDueToClickToMove = UserGameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove

	if self.isCameraToggle and blockToggleDueToClickToMove == false then
		CameraUI.setCameraModeToastEnabled(true)
		CameraInput.enableCameraToggleInput()
		CameraToggleStateController(self.inFirstPerson)
	else
		CameraUI.setCameraModeToastEnabled(false)
		CameraInput.disableCameraToggleInput()

		-- first time transition to first person mode or mouse-locked third person
		if self.inFirstPerson or self.inMouseLockedMode then
			CameraUtils.setRotationTypeOverride(Enum.RotationType.CameraRelative)
			if not debounce then
				debounce = true
				CameraUtils.setMouseBehaviorOverride(mouseBehavior)
			end
		else
			debounce = false
			CameraUtils.restoreRotationType()
			CameraUtils.restoreMouseBehavior()
		end
	end
end
-- credits to dthecoolest for the script
