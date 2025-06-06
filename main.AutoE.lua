--// TheGamerPoint's Auto-E GUI with Toggle and Credits

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "AutoEGui"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 140)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -70)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 180, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleButton.Text = "Toggle E Spam: OFF"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 16
toggleButton.Parent = mainFrame

-- Create Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 180, 0, 30)
closeButton.Position = UDim2.new(0, 10, 0, 60)
closeButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
closeButton.Text = "Close GUI"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSans
closeButton.TextSize = 16
closeButton.Parent = mainFrame

-- Create Credits Label at the Bottom
local credits = Instance.new("TextLabel")
credits.Name = "Credits"
credits.Size = UDim2.new(1, 0, 0, 20)
credits.Position = UDim2.new(0, 0, 1, -20)
credits.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
credits.Text = "Made by TheGamerPoint"
credits.TextColor3 = Color3.fromRGB(255, 255, 255)
credits.Font = Enum.Font.SourceSansItalic
credits.TextSize = 14
credits.Parent = mainFrame

-- Spam Logic
local spamE = false

toggleButton.MouseButton1Click:Connect(function()
	spamE = not spamE
	toggleButton.Text = "Toggle E Spam: " .. (spamE and "ON" or "OFF")
end)

closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Spam loop
task.spawn(function()
	while true do
		if spamE then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
		end
		task.wait(0.10)
	end
end)
