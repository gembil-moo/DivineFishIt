--=====================================================
--  DIVINE FISH IT - iOS GLASS UI (DELTA SAFE)
--=====================================================
if _G.DivineFishIOS then return end
_G.DivineFishIOS = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local LOGO_ID = "rbxassetid://120294742064292"

--================ TWEEN ===============================
local function Tween(o, info, prop)
    if not o then return end
    local t = TweenService:Create(o, info, prop)
    t:Play()
    return t
end

local AnimFast = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local AnimSlow = TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

--================ UI PARENT ==========================
local UIParent
pcall(function() UIParent = gethui() end)
if not UIParent then UIParent = Player:WaitForChild("PlayerGui") end

--================ THEME ==============================
local Theme = {
    Glass = Color3.fromRGB(28,30,38),
    Sidebar = Color3.fromRGB(22,24,30),
    Accent = Color3.fromRGB(140,200,255),
    Text = Color3.fromRGB(245,245,248),
    SubText = Color3.fromRGB(170,175,190),
    Stroke = Color3.fromRGB(255,255,255),
    Shadow = Color3.fromRGB(0,0,0)
}

--================ SCREEN GUI =========================
local Gui = Instance.new("ScreenGui", UIParent)
Gui.Name = "DivineFishIOS"
Gui.ResetOnSpawn = false

--================ FLOAT LOGO PANEL ===================
local Float = Instance.new("Frame", Gui)
Float.Size = UDim2.new(0,52,0,52)
Float.Position = UDim2.new(0,12,0.5,-26)
Float.BackgroundColor3 = Theme.Glass
Float.BackgroundTransparency = 0.25
Float.BorderSizePixel = 0
Instance.new("UICorner", Float).CornerRadius = UDim.new(1,0)

local FloatStroke = Instance.new("UIStroke", Float)
FloatStroke.Color = Theme.Stroke
FloatStroke.Transparency = 0.6

local Logo = Instance.new("ImageLabel", Float)
Logo.Size = UDim2.new(0.7,0,0.7,0)
Logo.Position = UDim2.new(0.15,0,0.15,0)
Logo.BackgroundTransparency = 1
Logo.Image = LOGO_ID

--================ MAIN WINDOW ========================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,660,0,400)
Main.Position = UDim2.new(0.5,-330,0.5,-200)
Main.BackgroundColor3 = Theme.Glass
Main.BackgroundTransparency = 0.18
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,20)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Theme.Stroke
MainStroke.Transparency = 0.7

Float.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        Main.Visible = not Main.Visible
    end
end)

--================ TOP BAR ============================
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,46)
Top.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,-20,1,0)
Title.Position = UDim2.new(0,14,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Divine Fish It"
Title.TextSize = 18
Title.TextColor3 = Theme.Text
Title.TextXAlignment = Enum.TextXAlignment.Left

--================ SIDEBAR ============================
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0,0,0,46)
Sidebar.Size = UDim2.new(0,150,1,-46)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BackgroundTransparency = 0.3
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,20)

local SL = Instance.new("UIListLayout", Sidebar)
SL.Padding = UDim.new(0,6)

local SP = Instance.new("UIPadding", Sidebar)
SP.PaddingTop = UDim.new(0,10)
SP.PaddingLeft = UDim.new(0,10)
SP.PaddingRight = UDim.new(0,10)

--================ CONTENT ============================
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,150,0,46)
Content.Size = UDim2.new(1,-150,1,-46)
Content.BackgroundTransparency = 1

--================ PAGE SYSTEM ========================
local Pages, Buttons = {}, {}

local function Page(name)
    local P = Instance.new("ScrollingFrame", Content)
    P.Size = UDim2.new(1,0,1,0)
    P.CanvasSize = UDim2.new(0,0,0,420)
    P.ScrollBarImageTransparency = 1
    P.Visible = false
    P.BackgroundTransparency = 1

    local L = Instance.new("UIListLayout", P)
    L.Padding = UDim.new(0,12)

    local Pad = Instance.new("UIPadding", P)
    Pad.PaddingTop = UDim.new(0,14)
    Pad.PaddingLeft = UDim.new(0,14)
    Pad.PaddingRight = UDim.new(0,14)

    Pages[name] = P
end

--================ NAV BUTTON =========================
local function Nav(icon,name)
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1,0,0,36)
    B.Text = icon.."  "..name
    B.TextSize = 14
    B.TextColor3 = Theme.Text
    B.TextXAlignment = Enum.TextXAlignment.Left
    B.BackgroundTransparency = 1
    B.BorderSizePixel = 0
    Instance.new("UICorner", B).CornerRadius = UDim.new(0,12)

    local Pad = Instance.new("UIPadding", B)
    Pad.PaddingLeft = UDim.new(0,12)

    B.MouseButton1Click:Connect(function()
        for _,p in pairs(Pages) do p.Visible=false end
        for _,b in pairs(Buttons) do b.BackgroundTransparency=1 end
        Pages[name].Visible=true
        B.BackgroundTransparency=0.3
    end)

    Buttons[name]=B
end

--================ BUILD MENU =========================
local Menu = {
    {"🎣","Fishing"},
    {"🛒","Shop"},
    {"🔁","Trade"},
    {"🗺️","Teleport"},
    {"📜","Quest"},
    {"⚙️","Config"},
    {"✨","Misc"}
}

for _,v in ipairs(Menu) do
    Page(v[2])
    Nav(v[1],v[2])
end

Pages["Fishing"].Visible = true
Buttons["Fishing"].BackgroundTransparency = 0.3
