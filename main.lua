--=====================================
--  DELTA SAFE FULL FEATURE UI
--=====================================
if _G.FishItUI then return end
_G.FishItUI = true

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

--=====================================
--  UI PARENT (PROVEN)
--=====================================
local UIParent
pcall(function() UIParent = gethui() end)
if not UIParent then UIParent = Player.PlayerGui end

--=====================================
--  SCREEN GUI
--=====================================
local Gui = Instance.new("ScreenGui")
Gui.Name = "FishItUI"
Gui.ResetOnSpawn = false
Gui.Parent = UIParent

--=====================================
--  STARTUP SPLASH
--=====================================
local Splash = Instance.new("Frame", Gui)
Splash.Size = UDim2.fromScale(1,1)
Splash.BackgroundColor3 = Color3.fromRGB(18,18,18)

local SplashText = Instance.new("TextLabel", Splash)
SplashText.Size = UDim2.new(1,0,0,80)
SplashText.Position = UDim2.new(0,0,0.45,0)
SplashText.BackgroundTransparency = 1
SplashText.Text = "Fish It Script\nLoading UI..."
SplashText.TextColor3 = Color3.new(1,1,1)
SplashText.TextSize = 26
SplashText.TextXAlignment = Enum.TextXAlignment.Center
SplashText.TextYAlignment = Enum.TextYAlignment.Center

task.wait(1)
Splash:Destroy()

--=====================================
--  NOTIFICATION
--=====================================
local NotifHolder = Instance.new("Frame", Gui)
NotifHolder.Size = UDim2.new(0,260,1,0)
NotifHolder.Position = UDim2.new(1,-270,0,10)
NotifHolder.BackgroundTransparency = 1

local NL = Instance.new("UIListLayout", NotifHolder)
NL.Padding = UDim.new(0,6)

local function Notify(title, msg)
    local Box = Instance.new("Frame", NotifHolder)
    Box.Size = UDim2.new(1,0,0,52)
    Box.BackgroundColor3 = Color3.fromRGB(40,40,40)
    Box.BorderSizePixel = 0

    local T = Instance.new("TextLabel", Box)
    T.Size = UDim2.new(1,-10,1,-10)
    T.Position = UDim2.new(0,5,0,5)
    T.BackgroundTransparency = 1
    T.TextWrapped = true
    T.TextXAlignment = Enum.TextXAlignment.Left
    T.TextYAlignment = Enum.TextYAlignment.Top
    T.Text = title.."\n"..msg
    T.TextColor3 = Color3.new(1,1,1)
    T.TextSize = 13

    task.delay(3, function()
        Box:Destroy()
    end)
end

--=====================================
--  MAIN WINDOW
--=====================================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,560,0,340)
Main.Position = UDim2.new(0.5,-280,0.5,-170)
Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
Main.BorderSizePixel = 0

--=====================================
--  HIDE / SHOW BUTTON
--=====================================
local ToggleUI = Instance.new("TextButton", Gui)
ToggleUI.Size = UDim2.new(0,70,0,28)
ToggleUI.Position = UDim2.new(0,10,0.5,-14)
ToggleUI.Text = "FishIt"
ToggleUI.TextSize = 14
ToggleUI.BackgroundColor3 = Color3.fromRGB(40,40,40)
ToggleUI.TextColor3 = Color3.new(1,1,1)
ToggleUI.BorderSizePixel = 0

ToggleUI.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

--=====================================
--  SIDEBAR
--=====================================
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0,140,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(22,22,22)
Sidebar.BorderSizePixel = 0

local SPad = Instance.new("UIPadding", Sidebar)
SPad.PaddingTop = UDim.new(0,10)
SPad.PaddingLeft = UDim.new(0,8)
SPad.PaddingRight = UDim.new(0,8)

local SLayout = Instance.new("UIListLayout", Sidebar)
SLayout.Padding = UDim.new(0,6)

--=====================================
--  CONTENT
--=====================================
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,140,0,0)
Content.Size = UDim2.new(1,-140,1,0)
Content.BackgroundColor3 = Color3.fromRGB(36,36,36)
Content.BorderSizePixel = 0

--=====================================
--  PAGE SYSTEM
--=====================================
local Pages, Buttons = {}, {}

local function CreatePage(name)
    local Page = Instance.new("Frame", Content)
    Page.Size = UDim2.new(1,0,1,0)
    Page.Visible = false
    Page.BackgroundTransparency = 1

    local Title = Instance.new("TextLabel", Page)
    Title.Size = UDim2.new(1,-20,0,36)
    Title.Position = UDim2.new(0,10,0,8)
    Title.Text = name
    Title.TextSize = 20
    Title.TextColor3 = Color3.new(1,1,1)
    Title.BackgroundTransparency = 1
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Panel = Instance.new("Frame", Page)
    Panel.Size = UDim2.new(1,-30,1,-60)
    Panel.Position = UDim2.new(0,15,0,48)
    Panel.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Panel.BorderSizePixel = 0

    Pages[name] = Panel
end

--=====================================
--  TOGGLE ELEMENT
--=====================================
local function CreateToggle(parent, text)
    local Holder = Instance.new("Frame", parent)
    Holder.Size = UDim2.new(1,-20,0,34)
    Holder.Position = UDim2.new(0,10,0,10)
    Holder.BackgroundTransparency = 1

    local Label = Instance.new("TextLabel", Holder)
    Label.Size = UDim2.new(0.7,0,1,0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Btn = Instance.new("TextButton", Holder)
    Btn.Size = UDim2.new(0.25,0,0.7,0)
    Btn.Position = UDim2.new(0.75,0,0.15,0)
    Btn.Text = "OFF"
    Btn.TextSize = 12
    Btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.BorderSizePixel = 0

    local state = false
    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.Text = state and "ON" or "OFF"
        Btn.BackgroundColor3 = state and Color3.fromRGB(90,160,90) or Color3.fromRGB(70,70,70)
        Notify("Toggle", text.." : "..(state and "ON" or "OFF"))
    end)
end

--=====================================
--  NAV BUTTON
--=====================================
local function Nav(name)
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1,0,0,34)
    B.Text = name
    B.TextSize = 14
    B.TextColor3 = Color3.new(1,1,1)
    B.BackgroundColor3 = Color3.fromRGB(32,32,32)
    B.BorderSizePixel = 0

    B.MouseButton1Click:Connect(function()
        for _,p in pairs(Pages) do p.Parent.Visible = false end
        for _,b in pairs(Buttons) do b.BackgroundColor3 = Color3.fromRGB(32,32,32) end
        Pages[name].Parent.Visible = true
        B.BackgroundColor3 = Color3.fromRGB(60,60,60)
        Notify("Menu", name.." opened")
    end)

    Buttons[name] = B
end

--=====================================
--  BUILD MENU
--=====================================
local Menu = {"Fishing","Shop","Trade","Teleport","Quest","Config","Misc"}
for _,v in ipairs(Menu) do
    CreatePage(v)
    Nav(v)
end

-- SAMPLE TOGGLES
CreateToggle(Pages["Fishing"], "Auto Fish")
CreateToggle(Pages["Fishing"], "Auto Reel")
CreateToggle(Pages["Misc"], "Anti AFK")

Pages["Fishing"].Parent.Visible = true
Buttons["Fishing"].BackgroundColor3 = Color3.fromRGB(60,60,60)

Notify("Fish It", "UI Loaded Successfully")
