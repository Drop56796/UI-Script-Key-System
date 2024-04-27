-- 设置密钥
local secretKey = "Key_395536787b65446c954a"

-- 创建一个函数，用于验证密钥
local function validateKey(inputKey)
    return inputKey == secretKey
end

-- 创建一个函数，用于运行脚本
local function runScript()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Trauma-Hub-Pro/Trauma-Hub-Pro/Trauma%20Hub%20Pro.lua"))()
    print("wow")
end

-- 创建UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 添加灰色背景
local Background = Instance.new("Frame")
Background.Parent = ScreenGui
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.5
Background.Visible = true  -- 默认隐藏

local TextBox = Instance.new("TextBox")
TextBox.Parent = ScreenGui
TextBox.Position = UDim2.new(0.5, -100, 0.4, -50)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.PlaceholderText = "请输入密钥"

local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.Position = UDim2.new(0.5, -50, 0.5, 0)
Button.Size = UDim2.new(0, 100, 0, 30)
Button.Text = "验证密钥"

local ResultLabel = Instance.new("TextLabel")
ResultLabel.Parent = ScreenGui
ResultLabel.Position = UDim2.new(0.5, -100, 0.6, 0)
ResultLabel.Size = UDim2.new(0, 200, 0, 30)
ResultLabel.Text = "验证"
ResultLabel.TextColor3 = Color3.new(1, 0, 0)
ResultLabel.FontSize = Enum.FontSize.Size24

-- 按钮点击事件
Button.MouseButton1Click:Connect(function()
    local inputKey = TextBox.Text
    if validateKey(inputKey) then
        runScript()
        ResultLabel.Text = "Key is compatible"
        wait(3) -- 等待3秒后销毁UI
        ScreenGui:Destroy()
    else
        ResultLabel.Text = "Key is not compatible"
    end
end)

-- 关闭按钮点击事件
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = ScreenGui
CloseButton.Position = UDim2.new(0.95, -30, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- 显示/隐藏背景的函数
local function toggleBackgroundVisibility()
    Background.Visible = not Background.Visible
end

-- 点击按钮时显示/隐藏背景
Button.MouseButton1Click:Connect(toggleBackgroundVisibility)
CloseButton.MouseButton1Click:Connect(toggleBackgroundVisibility)
