--==================================================
--  DIVINE FISH IT - MODERN UI TEMPLATE (DELTA SAFE)
--==================================================
if _G.DivineFishIt then return end
_G.DivineFishIt = true

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

--================ THEME ===========================
local Theme = {
    Accent = Color3.fromRGB(90,160,255),
    BG = Color3.fromRGB(18,18,22),
    Sidebar = Color3.fromRGB(16,16,20),
    Card = Color3.fromRGB(35,35,45),
    Text = Color3.fromRGB(235,235,235),
    SubText = Color3.fromRGB(170,170,170),
    Trans = 0.08
}

--================ GUI PARENT ======================
local UIParent
pcall(function() UIParent = gethui() end)
UIParent = UIParent or Player:WaitForChild("PlayerGui")

local Gui = Instance.new("ScreenGui", UIParent)
Gui.Name = "DivineFishIt"
Gui.ResetOnSpawn = false

--================ SPLASH ==========================
local Splash = Instance.new("TextLabel", Gui)
Splash.Size = UDim2.fromScale(1,1)
Splash.BackgroundColor3 = Theme.BG
Splash.Text = "Divine Fish It\nLoading..."
Splash.TextColor3 = Theme.Text
Splash.Font = Enum.Font.GothamMedium
Splash.TextSize = 24
task.wait(1)
Splash:Destroy()

--================ MAIN ============================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,580,0,360)
Main.Position = UDim2.new(0.5,-290,0.5,-180)
Main.BackgroundColor3 = Theme.BG
Main.BackgroundTransparency = Theme.Trans
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

--================ TOP BAR (DRAG ONLY) ==============
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,44)
Top.BackgroundColor3 = Theme.BG
Top.BackgroundTransparency = 0.05
Top.BorderSizePixel = 0
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,-20,1,0)
Title.Position = UDim2.new(0,12,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Divine Fish It"
Title.Font = Enum.Font.GothamMedium
Title.TextSize = 16
Title.TextColor3 = Theme.Text
Title.TextXAlignment = Left

-- DRAG
do
    local dragging, dragStart, startPos
    Top.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = i.Position
            startPos = Main.Position
        end
    end)
    Top.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = i.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    Top.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

--================ SIDEBAR =========================
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0,0,0,44)
Sidebar.Size = UDim2.new(0,140,1,-44)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BackgroundTransparency = 0.1
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,12)

local SideLayout = Instance.new("UIListLayout", Sidebar)
SideLayout.Padding = UDim.new(0,6)
SideLayout.HorizontalAlignment = Center

--================ CONTENT =========================
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,140,0,44)
Content.Size = UDim2.new(1,-140,1,-44)
Content.BackgroundTransparency = 1

local Pages = {}
local Buttons = {}

--================ PAGE ============================
local function CreatePage(name)
    local Page = Instance.new("Frame", Content)
    Page.Size = UDim2.new(1,0,1,0)
    Page.Visible = false
    Page.BackgroundTransparency = 1

    local Grid = Instance.new("UIGridLayout", Page)
    Grid.CellSize = UDim2.new(0,200,0,44)
    Grid.CellPadding = UDim2.new(0,12,0,12)
    Grid.StartCorner = Enum.StartCorner.TopLeft
    Grid.HorizontalAlignment = Left
    Grid.VerticalAlignment = Top

    Pages[name] = Page
end

--================ NAV =============================
local function Nav(name)
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1,-16,0,36)
    B.Text = name
    B.Font = Enum.Font.Gotham
    B.TextSize = 14
    B.TextColor3 = Theme.SubText
    B.BackgroundTransparency = 1
    B.BorderSizePixel = 0

    B.MouseButton1Click:Connect(function()
        for _,p in pairs(Pages) do p.Visible = false end
        for _,b in pairs(Buttons) do b.TextColor3 = Theme.SubText end
        Pages[name].Visible = true
        B.TextColor3 = Theme.Accent
    end)

    Buttons[name] = B
end

--================ TOGGLE ==========================
local function Toggle(parent, text)
    local Box = Instance.new("Frame", parent)
    Box.BackgroundColor3 = Theme.Card
    Box.BackgroundTransparency = 0.15
    Box.BorderSizePixel = 0
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0,10)

    local Label = Instance.new("TextLabel", Box)
    Label.Size = UDim2.new(1,-60,1,0)
    Label.Position = UDim2.new(0,12,0,0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextColor3 = Theme.Text
    Label.TextXAlignment = Left

    local Switch = Instance.new("TextButton", Box)
    Switch.Size = UDim2.new(0,40,0,20)
    Switch.Position = UDim2.new(1,-52,0.5,-10)
    Switch.Text = ""
    Switch.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Switch.BorderSizePixel = 0
    Instance.new("UICorner", Switch).CornerRadius = UDim.new(1,0)

    local Dot = Instance.new("Frame", Switch)
    Dot.Size = UDim2.new(0,16,0,16)
    Dot.Position = UDim2.new(0,2,0.5,-8)
    Dot.BackgroundColor3 = Color3.new(1,1,1)
    Dot.BorderSizePixel = 0
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(1,0)

    local on = false
    Switch.MouseButton1Click:Connect(function()
        on = not on
        Switch.BackgroundColor3 = on and Theme.Accent or Color3.fromRGB(70,70,70)
        Dot.Position = on and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
    end)
end

--================ BUILD ===========================
local Menu = {"Fishing","Shop","Trade","Teleport","Quest","Config","Misc"}
for _,v in ipairs(Menu) do
    CreatePage(v)
    Nav(v)
end

Toggle(Pages.Fishing,"Auto Fish")
Toggle(Pages.Fishing,"Auto Reel")
Toggle(Pages.Misc,"Anti AFK")

Pages.Fishing.Visible = true
Buttons.Fishing.TextColor3 = Theme.Accent
