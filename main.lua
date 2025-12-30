--=====================================================
--  DIVINE FISH IT - iOS GLASS UI (DELTA SAFE)
--=====================================================
if _G.DivineFishIOS then return end
_G.DivineFishIOS = true

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local LOGO_ID = "rbxassetid://120294742064292" -- GANTI DENGAN DECAL LOGO KAMU


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
Instance.new("UIStroke", Float).Color = Theme.Stroke
Float.UIStroke.Transparency = 0.6

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
Main.Visible = true
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,20)
Instance.new("UIStroke", Main).Color = Theme.Stroke
Main.UIStroke.Transparency = 0.7

-- Toggle from floating logo
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

--================ COMPONENTS =========================
local function GlassCard(parent,h)
    local C = Instance.new("Frame", parent)
    C.Size = UDim2.new(1,0,0,h)
    C.BackgroundColor3 = Theme.Glass
    C.BackgroundTransparency = 0.25
    C.BorderSizePixel = 0
    Instance.new("UICorner", C).CornerRadius = UDim.new(0,16)
    local S = Instance.new("UIStroke", C)
    S.Color = Theme.Stroke
    S.Transparency = 0.75
    return C
end

local function Button(parent,text)
    local B = Instance.new("TextButton", parent)
    B.Size = UDim2.new(1,-20,0,38)
    B.Position = UDim2.new(0,10,0,10)
    B.Text = text
    B.TextColor3 = Theme.Text
    B.TextSize = 14
    B.BackgroundColor3 = Theme.Accent
    B.BorderSizePixel = 0
    Instance.new("UICorner", B).CornerRadius = UDim.new(0,14)
end

local function Dropdown(parent, title, options)
    local Open = false

    local Wrap = Instance.new("Frame", parent)
    Wrap.Size = UDim2.new(1,-20,0,38)
    Wrap.BackgroundTransparency = 1
    Wrap.AutomaticSize = Enum.AutomaticSize.Y

    local Btn = Instance.new("TextButton", Wrap)
    Btn.Size = UDim2.new(1,0,0,38)
    Btn.Text = title.." ▾"
    Btn.TextSize = 14
    Btn.TextColor3 = Theme.Text
    Btn.BackgroundColor3 = Theme.Glass
    Btn.BackgroundTransparency = 0.3
    Btn.BorderSizePixel = 0
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,14)

    local Body = Instance.new("Frame", Wrap)
    Body.Size = UDim2.new(1,0,0,0)
    Body.BackgroundTransparency = 1
    Body.ClipsDescendants = true

    local BL = Instance.new("UIListLayout", Body)
    BL.Padding = UDim.new(0,6)

    for _,opt in ipairs(options) do
        local O = Instance.new("TextButton", Body)
        O.Size = UDim2.new(1,0,0,30)
        O.Text = "   "..opt
        O.TextSize = 13
        O.TextXAlignment = Enum.TextXAlignment.Left
        O.BackgroundTransparency = 1
        O.TextColor3 = Theme.SubText
    end

    Btn.MouseButton1Click:Connect(function()
        Open = not Open
        Tween(Body, AnimSlow, {
            Size = Open and UDim2.new(1,0,0,#options*36) or UDim2.new(1,0,0,0)
        })
        Btn.Text = title .. (Open and " ▴" or " ▾")
    end)
end


local function Radio(parent,text)
    local R = Instance.new("TextButton", parent)
    R.Size = UDim2.new(1,-20,0,30)
    R.Position = UDim2.new(0,10,0,10)
    R.Text = "◉  "..text
    R.TextColor3 = Theme.Text
    R.TextSize = 14
    R.BackgroundTransparency = 1
    R.TextXAlignment = Enum.TextXAlignment.Left
end

local function IOSToggle(parent, text)
    local H = Instance.new("Frame", parent)
    H.Size = UDim2.new(1,-20,0,34)
    H.BackgroundTransparency = 1

    local L = Instance.new("TextLabel", H)
    L.Size = UDim2.new(1,-60,1,0)
    L.BackgroundTransparency = 1
    L.Text = text
    L.TextColor3 = Theme.Text
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.TextSize = 14

    local Track = Instance.new("Frame", H)
    Track.Size = UDim2.new(0,42,0,22)
    Track.Position = UDim2.new(1,-42,0.5,-11)
    Track.BackgroundColor3 = Color3.fromRGB(90,90,95)
    Track.BorderSizePixel = 0
    Instance.new("UICorner", Track).CornerRadius = UDim.new(1,0)

    local Knob = Instance.new("Frame", Track)
    Knob.Size = UDim2.new(0,18,0,18)
    Knob.Position = UDim2.new(0,2,0.5,-9)
    Knob.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Knob.BorderSizePixel = 0
    Instance.new("UICorner", Knob).CornerRadius = UDim.new(1,0)

    local On = false
    Track.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            On = not On
            Tween(Track, AnimFast, {
                BackgroundColor3 = On and Theme.Accent or Color3.fromRGB(90,90,95)
            })
            Tween(Knob, AnimFast, {
                Position = On and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9)
            })
        end
    end)
end

--================ EXTENDABLE SUB MENU =================
local function SubMenu(parent, title)
    local Open = false

    local Group = Instance.new("Frame", parent)
    Group.Size = UDim2.new(1,0,0,48)
    Group.BackgroundColor3 = Theme.Glass
    Group.BackgroundTransparency = 0.35
    Group.BorderSizePixel = 0
    Group.ClipsDescendants = true
    Instance.new("UICorner", Group).CornerRadius = UDim.new(0,18)

    local Shadow = Instance.new("UIStroke", Group)
    Shadow.Color = Theme.Shadow
    Shadow.Transparency = 0.85

    local Header = Instance.new("TextButton", Group)
    Header.Size = UDim2.new(1,-20,0,40)
    Header.Position = UDim2.new(0,10,0,6)
    Header.Text = "▸  "..title
    Header.TextSize = 15
    Header.TextXAlignment = Enum.TextXAlignment.Left
    Header.TextColor3 = Theme.Text
    Header.BackgroundTransparency = 1
    Header.BorderSizePixel = 0

    local Body = Instance.new("Frame", Group)
    Body.Position = UDim2.new(0,10,0,50)
    Body.Size = UDim2.new(1,-20,0,0)
    Body.BackgroundTransparency = 1
    Body.ClipsDescendants = true

    local BL = Instance.new("UIListLayout", Body)
    BL.Padding = UDim.new(0,10)

    Dropdown(Body, "Select Mode", {"Safe","Fast","Extreme"})
    IOSToggle(Body, "Enable Feature")
    Button(Body, "Apply")

    Header.MouseButton1Click:Connect(function()
        Open = not Open
        Tween(Group, AnimSlow, {
            Size = Open and UDim2.new(1,0,0,200) or UDim2.new(1,0,0,48)
        })
        Tween(Body, AnimSlow, {
            Size = Open and UDim2.new(1,-20,0,140) or UDim2.new(1,-20,0,0)
        })
        Header.Text = (Open and "▾  " or "▸  ") .. title
    end)
end

--================ NAV BUTTON =========================
local function Nav(icon,name)
    local B = Instance.new("TextButton", Sidebar)
    B.TextXAlignment = Enum.TextXAlignment.Left
    B.PaddingLeft = UDim.new(0,12)
    B.Size = UDim2.new(1,0,0,36)
    B.Text = icon.."  "..name
    B.TextSize = 14
    B.TextColor3 = Theme.Text
    B.BackgroundTransparency = 1
    B.BorderSizePixel = 0
    Instance.new("UICorner", B).CornerRadius = UDim.new(0,12)

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

    SubMenu(Pages[v[2]], "1 Aurora Control")
    SubMenu(Pages[v[2]], "2 Nebula System")
    SubMenu(Pages[v[2]], "3 Quantum Handler")
end

Pages["Fishing"].Visible = true
Buttons["Fishing"].BackgroundTransparency = 0.3
