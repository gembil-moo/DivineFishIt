--=====================================================
--  DIVINE FISH IT - MODERN UI TEMPLATE (DELTA SAFE)
--=====================================================
if _G.DivineFishUI then return end
_G.DivineFishUI = true

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

--=====================================================
--  UI PARENT (DELTA SAFE)
--=====================================================
local UIParent
pcall(function() UIParent = gethui() end)
if not UIParent then UIParent = Player:WaitForChild("PlayerGui") end

--=====================================================
--  THEME
--=====================================================
local Theme = {
    Main = Color3.fromRGB(25,25,30),
    Sidebar = Color3.fromRGB(18,18,22),
    Content = Color3.fromRGB(32,32,38),
    Card = Color3.fromRGB(40,40,48),
    Accent = Color3.fromRGB(90,170,255),
    Text = Color3.fromRGB(235,235,235),
    SubText = Color3.fromRGB(170,170,170),
    Stroke = Color3.fromRGB(60,60,70)
}

--=====================================================
--  SCREEN GUI
--=====================================================
local Gui = Instance.new("ScreenGui")
Gui.Name = "DivineFishUI"
Gui.ResetOnSpawn = false
Gui.Parent = UIParent

--=====================================================
--  MAIN WINDOW
--=====================================================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,640,0,380)
Main.Position = UDim2.new(0.5,-320,0.5,-190)
Main.BackgroundColor3 = Theme.Main
Main.BackgroundTransparency = 0.05
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)
Instance.new("UIStroke", Main).Color = Theme.Stroke

--=====================================================
--  TOP BAR
--=====================================================
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,42)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-20,1,0)
Title.Position = UDim2.new(0,12,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Divine Fish It  |  Modern UI"
Title.TextColor3 = Theme.Text
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

--=====================================================
--  SIDEBAR
--=====================================================
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0,0,0,42)
Sidebar.Size = UDim2.new(0,140,1,-42)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.BackgroundTransparency = 0.1

Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,14)

local SLayout = Instance.new("UIListLayout", Sidebar)
SLayout.Padding = UDim.new(0,6)

local SPad = Instance.new("UIPadding", Sidebar)
SPad.PaddingTop = UDim.new(0,10)
SPad.PaddingLeft = UDim.new(0,8)
SPad.PaddingRight = UDim.new(0,8)

--=====================================================
--  CONTENT
--=====================================================
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,140,0,42)
Content.Size = UDim2.new(1,-140,1,-42)
Content.BackgroundColor3 = Theme.Content
Content.BackgroundTransparency = 0.05
Content.BorderSizePixel = 0

Instance.new("UICorner", Content).CornerRadius = UDim.new(0,14)

--=====================================================
--  PAGE SYSTEM
--=====================================================
local Pages, Buttons = {}, {}

local function CreatePage(name)
    local Page = Instance.new("ScrollingFrame", Content)
    Page.Size = UDim2.new(1,0,1,0)
    Page.CanvasSize = UDim2.new(0,0,0,400)
    Page.ScrollBarImageTransparency = 1
    Page.Visible = false
    Page.BackgroundTransparency = 1

    local Layout = Instance.new("UIListLayout", Page)
    Layout.Padding = UDim.new(0,10)

    local Pad = Instance.new("UIPadding", Page)
    Pad.PaddingTop = UDim.new(0,14)
    Pad.PaddingLeft = UDim.new(0,14)
    Pad.PaddingRight = UDim.new(0,14)

    Pages[name] = Page
end

--=====================================================
--  UI ELEMENTS
--=====================================================
local function Card(parent, height)
    local C = Instance.new("Frame", parent)
    C.Size = UDim2.new(1,0,0,height)
    C.BackgroundColor3 = Theme.Card
    C.BackgroundTransparency = 0.08
    C.BorderSizePixel = 0
    Instance.new("UICorner", C).CornerRadius = UDim.new(0,12)
    Instance.new("UIStroke", C).Color = Theme.Stroke
    return C
end

local function Button(parent, text)
    local B = Instance.new("TextButton", parent)
    B.Size = UDim2.new(1,-20,0,36)
    B.Position = UDim2.new(0,10,0,10)
    B.Text = text
    B.TextColor3 = Theme.Text
    B.TextSize = 14
    B.BackgroundColor3 = Theme.Accent
    B.BorderSizePixel = 0
    Instance.new("UICorner", B).CornerRadius = UDim.new(0,10)
end

local function Dropdown(parent, text)
    local D = Instance.new("TextButton", parent)
    D.Size = UDim2.new(1,-20,0,36)
    D.Position = UDim2.new(0,10,0,10)
    D.Text = text .. " ▼"
    D.TextColor3 = Theme.Text
    D.TextSize = 14
    D.BackgroundColor3 = Theme.Main
    D.BorderSizePixel = 0
    Instance.new("UICorner", D).CornerRadius = UDim.new(0,10)
end

local function Radio(parent, text)
    local R = Instance.new("TextButton", parent)
    R.Size = UDim2.new(1,-20,0,30)
    R.Position = UDim2.new(0,10,0,10)
    R.Text = "○  "..text
    R.TextColor3 = Theme.Text
    R.TextSize = 14
    R.BackgroundTransparency = 1
    R.TextXAlignment = Enum.TextXAlignment.Left
end

--=====================================================
--  NAV BUTTON
--=====================================================
local function Nav(name)
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1,0,0,34)
    B.Text = name
    B.TextSize = 14
    B.TextColor3 = Theme.Text
    B.BackgroundColor3 = Theme.Sidebar
    B.BorderSizePixel = 0

    Instance.new("UICorner", B).CornerRadius = UDim.new(0,8)

    B.MouseButton1Click:Connect(function()
        for _,p in pairs(Pages) do p.Visible = false end
        for _,b in pairs(Buttons) do b.BackgroundColor3 = Theme.Sidebar end
        Pages[name].Visible = true
        B.BackgroundColor3 = Theme.Card
    end)

    Buttons[name] = B
end

--=====================================================
--  BUILD MENU
--=====================================================
local Menu = {"Fishing","Shop","Trade","Teleport","Quest","Config","Misc"}

for _,v in ipairs(Menu) do
    CreatePage(v)
    Nav(v)

    local C1 = Card(Pages[v], 130)
    Button(C1, v.." Button")
    Dropdown(C1, v.." Dropdown")

    local C2 = Card(Pages[v], 110)
    Radio(C2, v.." Option A")
    Radio(C2, v.." Option B")
end

Pages["Fishing"].Visible = true
Buttons["Fishing"].BackgroundColor3 = Theme.Card
