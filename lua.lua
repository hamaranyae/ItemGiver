local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Modernize Frame
Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Darker background
Frame.BorderSizePixel = 0 -- Remove border
Frame.Position = UDim2.new(0.0610425249, 0, 0.0939490423, 0)
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.BackgroundTransparency = 0.1
Frame.ClipsDescendants = true -- Smooth scrolling with clipping
Frame.ZIndex = 2

-- Modernize ScrollingFrame
ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45) -- Slight contrast
ScrollingFrame.BorderSizePixel = 0 -- No border
ScrollingFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
ScrollingFrame.Size = UDim2.new(0, 225, 0, 190)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 35, 0)
ScrollingFrame.ScrollBarThickness = 4 -- Thinner scrollbar
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)

-- Modernize UIListLayout
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5) -- Add some padding

-- Modernize TextButton template
TextButton.Parent = ScrollingFrame
TextButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255) -- Modern blue color
TextButton.BorderSizePixel = 0 -- No border
TextButton.Size = UDim2.new(0, 200, 0, 40)
TextButton.Visible = false
TextButton.Font = Enum.Font.GothamBold -- Modern font
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 18
TextButton.TextStrokeTransparency = 1 -- No stroke for a clean look
TextButton.TextWrapped = true
TextButton.AutoButtonColor = false -- Prevent Roblox auto-color change
TextButton.BackgroundTransparency = 0.1 -- Slight transparency for depth

-- Adding hover effect to modernize buttons
TextButton.MouseEnter:Connect(function()
    TextButton.BackgroundColor3 = Color3.fromRGB(75, 75, 255) -- Lighter on hover
end)
TextButton.MouseLeave:Connect(function()
    TextButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255) -- Reset on leave
end)

-- Modernize Title Label
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 250, 0, 40)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Tool Giver"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20
TextLabel.TextStrokeTransparency = 1
TextLabel.TextWrapped = true
TextLabel.BackgroundTransparency = 0.2 -- Slight background transparency for depth

-- Modernize Update Button
TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- Modern teal color
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.05, 0, 0.85, 0)
TextButton_2.Size = UDim2.new(0, 225, 0, 40)
TextButton_2.Font = Enum.Font.GothamBold
TextButton_2.Text = "Update List"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 18
TextButton_2.TextStrokeTransparency = 1
TextButton_2.BackgroundTransparency = 0.1 -- Slight transparency for depth

-- Adding hover effect to the update button
TextButton_2.MouseEnter:Connect(function()
    TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 200, 255) -- Brighter on hover
end)
TextButton_2.MouseLeave:Connect(function()
    TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- Reset on leave
end)

-- Functionality Script (kept as is for functionality)
local function FNDR_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local button = script.Parent.ScrollingFrame.TextButton
	button.Parent = nil
	button.Name = "slaves"
	local function updatelist()
		for i, v in script.Parent.ScrollingFrame:GetDescendants() do
			if v:IsA("TextButton") then
				v:Destroy()
			end
		end
	
		local function cloneToBackpack(toolName)
			local clonedTool = toolName:Clone()
			clonedTool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
		end
		for i, v in pairs(game:GetDescendants()) do
			if v:IsA("Tool") and v.Parent.Parent ~= game:GetService("Players").LocalPlayer then
				local clonebutton = button:Clone()
				clonebutton.Parent = script.Parent.ScrollingFrame
				clonebutton.Visible = true
				clonebutton.Text = v.Name
				clonebutton.MouseButton1Click:Connect(function()
					cloneToBackpack(v)
				end)
			end
		end
	end
	script.Parent.TextButton.MouseButton1Click:Connect(updatelist)
end
coroutine.wrap(FNDR_fake_script)()

-- Drag Script (kept as is)
local function SGRWUDK_fake_script() -- Frame.DragScript 
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {
			Position = position
		}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
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
coroutine.wrap(SGRWUDK_fake_script)()
