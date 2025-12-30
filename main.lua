--=====================================================
--  DIVINE FISH IT - iOS GLASS UI (DELTA SAFE)
--=====================================================
if _G.DivineFishIOS then return end
_G.DivineFishIOS = true

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local LOGO_ID = "rbxassetid://120294742064292"

--================ TWEEN SERVICE ======================
local TweenService = game:GetService("TweenService")

local function Tween(obj, info, props)
    if not obj then return end
    local t = TweenService:Create(obj, info, props)
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
local FS = Instance.new("UIStroke", Float)
FS.Color = Theme.Stroke
FS.Transparency = 0.6

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
local MS = Instance.new("UIStroke", Main)
MS.Color = Theme.Stroke
MS.Transparency = 0.7

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

--================ SEARCHABLE DROPDOWN =================
local function SearchableDropdown(parent, title, options)
    local Open = false
    local Wrap = Instance.new("Frame", parent)
    Wrap.Size = UDim2.new(1,0,0,38)
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

    local BodyDD = Instance.new("Frame", Wrap)
    BodyDD.Size = UDim2.new(1,0,0,0)
    BodyDD.BackgroundTransparency = 1
    BodyDD.ClipsDescendants = true

    local SearchBox = Instance.new("TextBox", BodyDD)
    SearchBox.Size = UDim2.new(1,0,0,28)
    SearchBox.PlaceholderText = "Search..."
    SearchBox.Text = ""
    SearchBox.TextSize = 13
    SearchBox.BackgroundColor3 = Theme.Glass
    SearchBox.BackgroundTransparency = 0.3
    SearchBox.TextColor3 = Theme.Text
    Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0,10)

    local List = Instance.new("Frame", BodyDD)
    List.Position = UDim2.new(0,0,0,30)
    List.Size = UDim2.new(1,0,0,#options*30)
    List.BackgroundTransparency = 1
    List.ClipsDescendants = true

    local LL = Instance.new("UIListLayout", List)
    LL.Padding = UDim.new(0,2)

    local items = {}
    for _,opt in ipairs(options) do
        local O = Instance.new("TextButton", List)
        O.Size = UDim2.new(1,0,0,28)
        O.Text = opt
        O.TextSize = 13
        O.TextXAlignment = Enum.TextXAlignment.Left
        O.BackgroundTransparency = 1
        O.TextColor3 = Theme.SubText
        table.insert(items, O)
    end

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local filter = SearchBox.Text:lower()
        for _,item in pairs(items) do
            item.Visible = item.Text:lower():find(filter) ~= nil
        end
    end)

    Btn.MouseButton1Click:Connect(function()
        Open = not Open
        Tween(BodyDD, AnimSlow, {
            Size = Open and UDim2.new(1,0,0,28 + #options*30) or UDim2.new(1,0,0,0)
        })
        Btn.Text = title .. (Open and " ▴" or " ▾")
    end)

    return Wrap
end

--================ SUB MENU ===========================
local function SubMenu(parent, menuTitle, dropdownTitle, dropdownOptions)
    local Open = false

    local Group = Instance.new("Frame", parent)
    Group.Size = UDim2.new(1,0,0,48)
    Group.BackgroundColor3 = Theme.Glass
    Group.BackgroundTransparency = 0.35
    Group.BorderSizePixel = 0
    Group.ClipsDescendants = true
    Instance.new("UICorner", Group).CornerRadius = UDim.new(0,18)

    local Header = Instance.new("TextButton", Group)
    Header.Size = UDim2.new(1,-20,0,40)
    Header.Position = UDim2.new(0,10,0,6)
    Header.Text = "▸  "..menuTitle
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

    -- Judul menu di atas dropdown
    local TitleLabel = Instance.new("TextLabel", Body)
    TitleLabel.Size = UDim2.new(1,0,0,22)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = menuTitle
    TitleLabel.TextSize = 14
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Dropdown search
    SearchableDropdown(Body, dropdownTitle, dropdownOptions)

    -- Toggle & Button
    IOSToggle(Body, "Enable Feature")
    Button(Body, "Apply")

    Header.MouseButton1Click:Connect(function()
        Open = not Open
        local newHeight = Open and 220 or 48
        local bodyHeight = Open and 160 or 0
        Tween(Group, AnimSlow, {Size = UDim2.new(1,0,0,newHeight)})
        Tween(Body, AnimSlow, {Size = UDim2.new(1,-20,0,bodyHeight)})
        Header.Text = (Open and "▾  " or "▸  ")..menuTitle
    end)
end

--================ NAV BUTTON =========================
local function Nav(icon,name)
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1,0,0,36)
    B.Text = icon.."  "..name
    B.TextXAlignment = Enum.TextXAlignment.Left
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
    SubMenu(Pages[v[2]], "Aurora Control", "Select Mode", {"Safe","Fast","Extreme"})
    SubMenu(Pages[v[2]], "Nebula System", "Select Mode", {"Low","Medium","High"})
    SubMenu(Pages[v[2]], "Quantum Handler", "Select Mode", {"Alpha","Beta","Gamma"})
end

Pages["Fishing"].Visible = true
Buttons["Fishing"].BackgroundTransparency = 0.3
