local FolderLib = {}
function FolderLib:File()
	local FolderMaker = {}
	local FolderLib = Instance.new("ScreenGui")
	local FolderHolder = Instance.new("Frame")
	local FolderContainer = Instance.new("Frame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local TextLabel = Instance.new("TextLabel")
	
	FolderLib.Name = "FolderLib"
	FolderLib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	FolderLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	FolderLib.ResetOnSpawn = false

	FolderHolder.Name = "FolderHolder"
	FolderHolder.Parent = FolderLib
	FolderHolder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	FolderHolder.BorderSizePixel = 0
	FolderHolder.Position = UDim2.new(0.0696893334, 0, 0.0815286636, 0)
	FolderHolder.Size = UDim2.new(0, 228, 0, 46)

	FolderContainer.Name = "FolderContainer"
	FolderContainer.Parent = FolderHolder
	FolderContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FolderContainer.BorderSizePixel = 0
	FolderContainer.Position = UDim2.new(0, 0, 1, 0)
	FolderContainer.Size = UDim2.new(0, 228, 0, 0)

	UIListLayout_2.Parent = FolderContainer
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

	TextLabel.Parent = FolderHolder
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(0, 228, 0, 46)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = "Script Name"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 13.000
	
	local function WWNKWF_fake_script() -- FolderHolder.Drag 
		local script = Instance.new('LocalScript', FolderHolder)

		local function CreateDrag()
			local UIS = game:GetService('UserInputService')
			local frame = script.Parent
			local dragToggle = nil
			local dragSpeed = 0.09
			local dragStart = nil
			local startPos = nil

			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
			end

			frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
					dragToggle = true
					dragStart = input.Position
					startPos = frame.Position
					local TweenService = game:GetService('TweenService')
					local Speed = 0.2
					local TweenFunc = TweenInfo.new(Speed, Enum.EasingStyle.Linear , Enum.EasingDirection.Out, 0)
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)

			UIS.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if dragToggle then
						updateInput(input)
					end
				end
			end)
		end
		CreateDrag()
	end
	coroutine.wrap(WWNKWF_fake_script)()
	
	function FolderMaker:Folder(FolderTitle)
		local InnerFolder = {}
		local NewFolder = Instance.new("Frame")
		local FolderObject = Instance.new("Frame")
		local FolderName = Instance.new("TextLabel")
		local FolderButton = Instance.new("ImageButton")
		local Arrow = Instance.new("ImageLabel")
		local ItemsInFolder = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		
		NewFolder.Name = "NewFolder"
		NewFolder.Parent = FolderContainer
		NewFolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		NewFolder.BorderSizePixel = 0
		NewFolder.ClipsDescendants = true
		NewFolder.Position = UDim2.new(0, 228,0, 40)
		NewFolder.Size = UDim2.new(0, 228, 0, 40)
		NewFolder.Name = FolderTitle

		FolderObject.Name = "FolderObject"
		FolderObject.Parent = NewFolder
		FolderObject.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		FolderObject.BorderSizePixel = 0
		FolderObject.Size = UDim2.new(0, 228, 0, 39)

		FolderName.Name = "FolderName"
		FolderName.Parent = FolderObject
		FolderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		FolderName.BackgroundTransparency = 1.000
		FolderName.BorderSizePixel = 0
		FolderName.Position = UDim2.new(0.0350877196, 0, 0.179487184, 0)
		FolderName.Size = UDim2.new(0, 86, 0, 26)
		FolderName.Font = Enum.Font.GothamSemibold
		FolderName.Text = FolderTitle
		FolderName.TextColor3 = Color3.fromRGB(255, 255, 255)
		FolderName.TextSize = 12.000
		FolderName.TextXAlignment = Enum.TextXAlignment.Left

		FolderButton.Name = FolderTitle
		FolderButton.Parent = FolderObject
		FolderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		FolderButton.BackgroundTransparency = 1.000
		FolderButton.Position = UDim2.new(0.86403507, 0, 0.179487184, 0)
		FolderButton.Size = UDim2.new(0, 24, 0, 26)
		FolderButton.Image = "rbxassetid://8885587362"
		FolderButton.ImageTransparency = 1.000

		Arrow.Name = "Arrow"
		Arrow.Parent = FolderButton
		Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Arrow.BackgroundTransparency = 1.000
		Arrow.Position = UDim2.new(-0.0416666679, 0, 0, 0)
		Arrow.Size = UDim2.new(0, 26, 0, 26)
		Arrow.Image = "rbxassetid://8948773940"

		ItemsInFolder.Name = "ItemsInFolder"
		ItemsInFolder.Parent = NewFolder
		ItemsInFolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ItemsInFolder.ScrollBarImageColor3 = Color3.fromRGB(25,25,25)
		ItemsInFolder.Active = true
		ItemsInFolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		ItemsInFolder.BorderSizePixel = 0
		ItemsInFolder.Position = UDim2.new(0.0263157897, 0, 0.277777791, 0)
		ItemsInFolder.Size = UDim2.new(0, 216, 0, 111)
		ItemsInFolder.BottomImage = "rbxassetid://8885587362"
		ItemsInFolder.MidImage = "rbxassetid://8885587362"
		ItemsInFolder.ScrollBarThickness = 8
		ItemsInFolder.TopImage = "rbxassetid://8885587362"

		UIListLayout.Parent = NewFolder
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 6)
		
		local UIListLayout22 = Instance.new("UIListLayout")
		
		UIListLayout22.Parent = ItemsInFolder
		UIListLayout22.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout22.Padding = UDim.new(0, 2)
		
		function InnerFolder:CheckBox(CheckBoxTitle,callback)
			callback = callback or function() end

			local CheckBox = Instance.new("Frame")
			local CheckBoxName = Instance.new("TextLabel")
			local Toggle = Instance.new("ImageButton")

			--Properties:

			CheckBox.Name = "CheckBox"
			CheckBox.Parent = ItemsInFolder
			CheckBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			CheckBox.BorderSizePixel = 0
			CheckBox.Position = UDim2.new(0, 0, 0.369369358, 0)
			CheckBox.Size = UDim2.new(0, 201, 0, 38)

			CheckBoxName.Name = "CheckBoxName"
			CheckBoxName.Parent = CheckBox
			CheckBoxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CheckBoxName.BackgroundTransparency = 1.000
			CheckBoxName.BorderSizePixel = 0
			CheckBoxName.Position = UDim2.new(0.0350877196, 0, 0.179487184, 0)
			CheckBoxName.Size = UDim2.new(0, 86, 0, 26)
			CheckBoxName.Font = Enum.Font.GothamSemibold
			CheckBoxName.Text = CheckBoxTitle
			CheckBoxName.TextColor3 = Color3.fromRGB(255, 255, 255)
			CheckBoxName.TextSize = 12.000
			CheckBoxName.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = CheckBox
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 72, 72)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0.865671635, 0, 0.284750283, 0)
			Toggle.Size = UDim2.new(0, 16, 0, 17)
			Toggle.Image = "rbxassetid://8885587362"
			Toggle.ImageColor3 = Color3.fromRGB(255, 72, 72)

			-- Scripts:

			local function JUEWAU_fake_script() -- Toggle.ToggleManager 
				local script = Instance.new('LocalScript', Toggle)

				local Toggle = script.Parent
				local IsTogglable = false
				Toggle.MouseButton1Click:Connect(function()
					if IsTogglable == false then
						IsTogglable = true
						local SetTrue = Color3.fromRGB(125, 255, 96)
						game:GetService('TweenService'):Create(Toggle, TweenInfo.new(0.3), {ImageColor3 = SetTrue}):Play()
					else
						IsTogglable = false
						local SetFalse = Color3.fromRGB(255,72,72)
						game:GetService('TweenService'):Create(Toggle, TweenInfo.new(0.3), {ImageColor3 = SetFalse}):Play()
					end
					pcall(callback,IsTogglable)
				end)
			end
			coroutine.wrap(JUEWAU_fake_script)()
		end
		
		function InnerFolder:Slider(SliderTitle,maxvalue,minvalue,callback)
			local Slider = Instance.new("Frame")
			local SliderName = Instance.new("TextLabel")
			local SliderFrame = Instance.new("Frame")
			local SliderBtn = Instance.new("ImageButton")

			Slider.Name = "Slider"
			Slider.Parent = ItemsInFolder
			Slider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0, 0, 0.369369358, 0)
			Slider.Size = UDim2.new(0, 201, 0, 60)

			SliderName.Name = "SliderName"
			SliderName.Parent = Slider
			SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.BackgroundTransparency = 1.000
			SliderName.BorderSizePixel = 0
			SliderName.Position = UDim2.new(0.0350877754, 0, 0.146153763, 0)
			SliderName.Size = UDim2.new(0, 86, 0, 24)
			SliderName.Font = Enum.Font.GothamSemibold
			SliderName.Text = SliderTitle
			SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.TextSize = 12.000
			SliderName.TextXAlignment = Enum.TextXAlignment.Left
			
			local SliderValue = Instance.new("TextLabel")
			
			SliderValue.Name = "SliderValue"
			SliderValue.Parent = Slider
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.BorderSizePixel = 0
			SliderValue.Position = UDim2.new(0.806232035, 0, 0.146153763, 0)
			SliderValue.Size = UDim2.new(0, 27, 0, 24)
			SliderValue.Font = Enum.Font.GothamSemibold
			SliderValue.Text = "&*^"
			SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.TextSize = 12.000
			SliderValue.TextXAlignment = Enum.TextXAlignment.Right
			
			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Slider
			SliderFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			SliderFrame.BorderSizePixel = 0
			SliderFrame.Position = UDim2.new(0.0789966509, 0, 0.625285089, 0)
			SliderFrame.Size = UDim2.new(0, 48, 0, 15)

			SliderBtn.Name = "SliderBtn"
			SliderBtn.Parent = SliderFrame
			SliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderBtn.BackgroundTransparency = 1.000
			SliderBtn.BorderSizePixel = 0
			SliderBtn.Size = UDim2.new(0, 168, 0, 15)
			SliderBtn.Image = "rbxassetid://8885587362"
			SliderBtn.ImageColor3 = Color3.fromRGB(43, 43, 43)
			SliderBtn.ImageTransparency = 1.000

			-- Scripts:

			callback = callback or function() end

			minvalue = minvalue or 0
			maxvalue = maxvalue or 100

			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			local Value;


			SliderBtn.MouseButton1Down:Connect(function(moveconnection,releaseconnection)
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 168) * SliderFrame.AbsoluteSize.X) + tonumber(minvalue))
				pcall(function()
					callback(Value)
				end)
				game:GetService('TweenService'):Create(SliderFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 168), 0, 15)}):Play()
				moveconnection = mouse.Move:Connect(function()
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 168) * SliderFrame.AbsoluteSize.X) + tonumber(minvalue))

					SliderValue.Text = Value

					pcall(function()
						callback(Value)
					end)
					--script.Parent.Parent.Parent.SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - script.Parent.Parent.Parent.SliderFrame.AbsolutePosition.X, 0, 244), 0, 15)
					game:GetService('TweenService'):Create(SliderFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 168), 0, 15)}):Play()
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 168) * SliderFrame.AbsoluteSize.X) + tonumber(minvalue))
						pcall(function()
							callback(Value)
						end)
						game:GetService('TweenService'):Create(SliderFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 168), 0, 15)}):Play()
						SliderValue.Text = Value
						--script.Parent.Parent.Parent.SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - script.Parent.Parent.Parent.SliderFrame.AbsolutePosition.X, 0, 244), 0, 15)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
		end
		
		function InnerFolder:Button(ButtonTitle,callback)
			callback = callback or function() end
			local Button = Instance.new("ImageButton")
			local ButtonName = Instance.new("TextLabel")

			Button.Name = "Button"
			Button.Parent = ItemsInFolder
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.Position = UDim2.new(0, 0, -1.37466571e-07, 0)
			Button.Size = UDim2.new(0, 201, 0, 38)
			Button.Image = "rbxassetid://8885587362"
			Button.ImageColor3 = Color3.fromRGB(25, 25, 25)

			ButtonName.Name = "ButtonName"
			ButtonName.Parent = Button
			ButtonName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonName.BackgroundTransparency = 1.000
			ButtonName.BorderSizePixel = 0
			ButtonName.Position = UDim2.new(0.0350877196, 0, 0.179487184, 0)
			ButtonName.Size = UDim2.new(0, 86, 0, 26)
			ButtonName.Font = Enum.Font.GothamSemibold
			ButtonName.Text = ButtonTitle
			ButtonName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonName.TextSize = 12.000
			ButtonName.TextXAlignment = Enum.TextXAlignment.Left

			Button.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end
		
		local function IFAPO_fake_script() -- FolderButton.FolderManager 
			local script = Instance.new('LocalScript', FolderButton)

			local FolderButton = script.Parent
			local FolderImage = script.Parent.Arrow
			local Enable = false
			FolderButton.MouseButton1Click:Connect(function()
				if Enable == false then
					Enable = true
					game:GetService('TweenService'):Create(FolderImage, TweenInfo.new(0.2), {Rotation = 90}):Play()
					for i,v in next, FolderContainer:GetChildren() do
						if v.Name == FolderButton.Name then
							v:TweenSize(UDim2.new(0, 228,0, 162), "Out", "Quart", 0.2, true)
						end
					end
				else
					Enable = false
					game:GetService('TweenService'):Create(FolderImage, TweenInfo.new(0.2), {Rotation = 0}):Play()
					for i,v in next, FolderContainer:GetChildren() do
						if v.Name == FolderButton.Name then
							v:TweenSize(UDim2.new(0, 228,0, 40), "Out", "Quart", 0.2, true)
						end
					end
				end
			end)
		end
		coroutine.wrap(IFAPO_fake_script)()
		return InnerFolder
	end
	return FolderMaker
end

return FolderLib
