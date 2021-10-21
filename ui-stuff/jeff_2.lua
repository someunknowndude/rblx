--[[
2.1.3.1a
Edited Color schemes:
    [+] Added Legacy, similar to the older Jeff color scheme 
    [+] Added Nightshift
    [+] Added Mint, a cyan theme
    [+] Added Jacko, an orange black theme
    [+] Added Cold which is like Legacy
    [*] Changed Bright to be more bright
    [-] Removed Neon
Edited menu arguments:
    [-] Removed desc parameter
Edited button arguments:
    [*] Made the toggle parameter work properly

]]--

local eventlistener = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/rblx/main/rbxevent.lua'))()

if _G.JUI2 then
    
    pcall(_G.JUI2) 
end

local plrs = game:GetService("Players")
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local ctx = game:GetService("ContextActionService")
local deb = game:GetService("Debris")
local rs = game:GetService("RunService")
local plr = plrs.LocalPlayer

local mouse = plr:GetMouse()

local screen = Instance.new("ScreenGui")

pcall(function() 
    syn.protect_gui(screen)
end)
if gethiddengui then
    screen.Parent = gethiddengui()
elseif gethui then 
    screen.Parent = gethui()
else
    screen.Parent = game.CoreGui
end


local ui = {}


local drag
local rdrag
local hdrag
local vdrag
local ctwn 
local twn
local getrand
local shadow
local round
local ceffect

function drag(detect, target) 
    target = target or detect
    local id = target:GetDebugId() .. getrand(5)
    
    ui.cons[id] = nil
    
    
    detect.InputBegan:Connect(function(old_input)
        if old_input.UserInputType == Enum.UserInputType.MouseButton1 then
            local starting_pos = target.Position
            
            local previnput = old_input.Position
        
            
            ui.cons[id] = uis.InputChanged:Connect(function(new_input)
                
                if new_input.UserInputType == Enum.UserInputType.MouseMovement then
                    
                    
                    local delta = new_input.Position - old_input.Position
                    
                    
                    twn(target, {Position = UDim2.new(
                        starting_pos.X.Scale, 
                        starting_pos.X.Offset + delta.X, 
                        starting_pos.Y.Scale, 
                        starting_pos.Y.Offset + delta.Y
                    )})
                    
                    
                    
                    previnput = new_input.Position
                end
            end)
        end
    end)
    
    detect.InputEnded:Connect(function(cur_input)
        if cur_input.UserInputType == Enum.UserInputType.MouseButton1 then
            pcall(function() ui.cons[id]:Disconnect() end)
        end
    end)
end


function rdrag(detect, target) 
    target = target or detect
    local id = target:GetDebugId() .. getrand(5)
    
    ui.cons[id] = nil
    
    detect.InputBegan:Connect(function(old_input)
        if old_input.UserInputType == Enum.UserInputType.MouseButton1 then
            local starting_pos = target.Position
            
            local previnput = old_input.Position
            
            
            ui.cons[id] = uis.InputChanged:Connect(function(new_input)
                
                if new_input.UserInputType == Enum.UserInputType.MouseMovement then
                    
                    
                    local delta = new_input.Position - old_input.Position
                    
                    
                    target.Rotation = target.Rotation - ((previnput.Magnitude - new_input.Position.Magnitude) * 0.1)
                    
                    twn(target, {Position = UDim2.new(
                        starting_pos.X.Scale, 
                        starting_pos.X.Offset + delta.X, 
                        starting_pos.Y.Scale, 
                        starting_pos.Y.Offset + delta.Y
                    ), Rotation = 0})
                    
                    
                    
                    previnput = new_input.Position
                end
            end)
        end
    end)
    
    detect.InputEnded:Connect(function(cur_input)
        if cur_input.UserInputType == Enum.UserInputType.MouseButton1 then
            pcall(function() ui.cons[id]:Disconnect() end)
        end
    end)
end

function ctwn(object, dest, delay, direction, style)
    delay = delay or 0.35
    direction = direction or "Out"
    style = style or "Circular"
    
    local tween = ts:Create(object, TweenInfo.new(delay, Enum.EasingStyle[style], Enum.EasingDirection[direction]), dest)
    tween:Play()
    return tween
end

function twn(object, dest)
    
    local tween = ts:Create(object, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), dest)
    tween:Play()
    return tween
end

function getrand(count) 
    local str = ""
    for i = 1, count or 10 do
        str = str..utf8.char(math.random(20000,27000))
    end
    
    return str
end



function shadow(inst) 
    local among = Instance.new("ImageLabel")
    among.BackgroundTransparency = 1
    among.Image = "rbxassetid://7603818383"
    among.ImageColor3 = Color3.new(0, 0, 0)
    among.ImageTransparency = 0.15
    among.Position = UDim2.new(0.5, 0, 0.5, 0)
    among.AnchorPoint = Vector2.new(0.5, 0.5)
    among.Size = UDim2.new(1, 20, 1, 20)
    among.SliceCenter = Rect.new(15, 15, 175, 175)
    among.SliceScale = 1.3
    among.ScaleType = Enum.ScaleType.Slice
    among.ZIndex = inst.ZIndex - 1 
    among.Parent = inst

    return among
end


function round(inst)
    local among = Instance.new("UICorner")
    among.CornerRadius = UDim.new(0, 5)
    among.Parent = inst
    
    return among
end

function ceffect(parent) 
    local a = Instance.new("ImageLabel")
    a.Image = "rbxassetid://7620264743"
    a.AnchorPoint = Vector2.new(0.5, 0.5)
    a.Size = UDim2.new(0, 0, 0, 0)
    a.ZIndex = parent.ZIndex + 1 
    a.ImageColor3 = ui.colors.text
    a.Position = UDim2.new(0.5, mouse.X - (parent.AbsolutePosition.X + (parent.Size.X.Offset / 2)), 0.5, mouse.Y - (parent.AbsolutePosition.Y + (parent.Size.Y.Offset / 2)))
    a.ImageTransparency = 0.5
    a.BackgroundTransparency = 1
    a.Parent = parent
    
    ctwn(a, {Size = UDim2.new(0, parent.AbsoluteSize.X+30, 0, parent.AbsoluteSize.X+30), ImageTransparency = 1}, 0.5, "Out", "Circular")
    
    deb:AddItem(a, 0.6)
end

screen.Name = "C​hi​n​a​ #​1​! |"..getrand(15)

ui = {} do
    ui.__index = ui
    ui.cons = {}
    
    ui.colors = {
        window = Color3.fromRGB(20, 20, 20),
        topbar = Color3.fromRGB(22, 22, 22),
        text = Color3.fromRGB(230, 230, 255),
        button = Color3.fromRGB(43, 43, 43),
        scroll = Color3.fromRGB(130, 130, 130),
        detail = Color3.fromRGB(53, 53, 123),
        enabledbright = Color3.fromRGB(106, 106, 255),
        enabled = Color3.fromRGB(53, 53, 123),
        textshade1 = Color3.fromRGB(100, 100, 255),
        textshade2 = Color3.fromRGB(255, 100, 100)
    }
    
    ui.binds = {
        
    }
    
    ui.BindHandler = uis.InputBegan:Connect(function(io, gpe) 
        if gpe then return end
        if io.UserInputType == Enum.UserInputType.Keyboard then
            for id, bf in pairs(ui.binds) do
                if io.KeyCode.Name == bf.b then
                    bf.f()
                    
                    --pcall(function() 
                    --    if not ui.Windows[1]:GetMinimized() then
                    --        ui:NewNotification("Bind", bf.w.." "..bf.n, 1)
                    --    end
                    --end)
                end
            end
        end
    end)
    
    ui.OnReady = eventlistener.new()
    ui.OnNotifDelete = eventlistener.new() 
    ui.NotifCount = -1
    
    ui.Version = "2.1.3.1-alpha"
    ui.Font = Enum.Font["SourceSans"]
    ui.FontSize = 20
    
    ui.WindowCount = 0
    ui.Windows = {}
    
    ui.Exiting = eventlistener.new()
    
    ui.Toggles = {}
    
    function ui:GetAllToggles() 
        return ui.Toggles
    end
    
    function ui:SetColors(colors) 
        colors = colors or ""
        
        if colors == "red" then
            ui.colors = {
                window = Color3.fromRGB(12, 12, 12),
                topbar = Color3.fromRGB(14, 14, 14),
                text = Color3.fromRGB(225, 225, 225),
                button = Color3.fromRGB(150, 10, 10),
                scroll = Color3.fromRGB(130, 130, 130),
                detail = Color3.fromRGB(255, 53, 53),
                enabledbright = Color3.fromRGB(255, 153, 153),
                enabled = Color3.fromRGB(255, 35, 35),
                textshade1 = Color3.fromRGB(255, 70, 70),
                textshade2 = Color3.fromRGB(255, 70, 255)
            }
            
        elseif colors == "green" then
            ui.colors = {
                window = Color3.fromRGB(16, 16, 16),
                topbar = Color3.fromRGB(18, 18, 18),
                text = Color3.fromRGB(225, 225, 225),
                button = Color3.fromRGB(30, 170, 30),
                scroll = Color3.fromRGB(130, 130, 130),
                detail = Color3.fromRGB(100, 255, 100),
                enabledbright = Color3.fromRGB(160, 255, 170),
                enabled = Color3.fromRGB(40, 255, 90),
                textshade1 = Color3.fromRGB(70, 255, 70),
                textshade2 = Color3.fromRGB(0, 255, 255)
            }
        elseif colors == "blue" then
            ui.colors = {
                window = Color3.fromRGB(22, 22, 22),
                topbar = Color3.fromRGB(24, 24, 24),
                text = Color3.fromRGB(230, 230, 225),
                button = Color3.fromRGB(22, 22, 170),
                scroll = Color3.fromRGB(130, 130, 130),
                detail = Color3.fromRGB(53, 53, 255),
                enabledbright = Color3.fromRGB(133, 153, 255),
                enabled = Color3.fromRGB(35, 35, 255),
                textshade1 = Color3.fromRGB(70, 70, 255),
                textshade2 = Color3.fromRGB(255, 0, 255)
            }
            
        elseif colors == "purple" then
            
            ui.colors = {
                window = Color3.fromRGB(20, 20, 20),
                topbar = Color3.fromRGB(22, 22, 22),
                text = Color3.fromRGB(250, 240, 255),
                button = Color3.fromRGB(145, 50, 150),
                scroll = Color3.fromRGB(100, 100, 100),
                detail = Color3.fromRGB(250, 53, 255),
                enabledbright = Color3.fromRGB(250, 189, 255),
                enabled = Color3.fromRGB(250, 100, 255),
                textshade1 = Color3.fromRGB(250, 70, 255),
                textshade2 = Color3.fromRGB(250, 0, 255)
            }
            
        elseif colors == "bright" then
            
            ui.colors = {
                window = Color3.fromRGB(45, 46, 46),
                topbar = Color3.fromRGB(50, 51, 51),
                text = Color3.fromRGB(255, 255, 255),
                button = Color3.fromRGB(100, 100, 100),
                scroll = Color3.fromRGB(35, 45, 45),
                detail = Color3.fromRGB(60, 70, 70),
                enabledbright = Color3.fromRGB(255, 255, 255),
                enabled = Color3.fromRGB(200, 200, 200),
                textshade1 = Color3.fromRGB(235, 255, 255),
                textshade2 = Color3.fromRGB(125, 255, 125)
            }
            
        elseif colors == "mono" then
            
            ui.colors = {
                window = Color3.fromRGB(22, 22, 22),
                topbar = Color3.fromRGB(24, 24, 24),
                text = Color3.fromRGB(225, 225, 225),
                button = Color3.fromRGB(71, 71, 71),
                scroll = Color3.fromRGB(52, 52, 52),
                detail = Color3.fromRGB(120, 120, 120),
                enabledbright = Color3.fromRGB(180, 180, 180),
                enabled = Color3.fromRGB(121, 121, 121),
                textshade1 = Color3.fromRGB(131, 131, 131),
                textshade2 = Color3.fromRGB(170, 170, 170)
            }
            
            
        elseif colors == "nightshift" then
            
            ui.colors = {
                window = Color3.fromRGB(5, 5, 5),
                topbar = Color3.fromRGB(7, 7, 7),
                text = Color3.fromRGB(250, 230, 250),
                button = Color3.fromRGB(60, 60, 65),
                scroll = Color3.fromRGB(50, 50, 50),
                detail = Color3.fromRGB(80, 80, 90),
                enabledbright = Color3.fromRGB(150, 150, 155),
                enabled = Color3.fromRGB(100, 100, 105),
                textshade1 = Color3.fromRGB(255, 0, 255),
                textshade2 = Color3.fromRGB(0, 255, 255)
            }
        
        elseif colors == "mint" then
            
            ui.colors = {
                window = Color3.fromRGB(20, 20, 20),
                topbar = Color3.fromRGB(24, 24, 24),
                text = Color3.fromRGB(200, 255, 255),
                button = Color3.fromRGB(50, 60, 60),
                scroll = Color3.fromRGB(35, 45, 45),
                detail = Color3.fromRGB(60, 70, 70),
                enabledbright = Color3.fromRGB(200, 255, 255),
                enabled = Color3.fromRGB(150, 160, 160),
                textshade1 = Color3.fromRGB(30, 255, 255),
                textshade2 = Color3.fromRGB(30, 255, 30)
            }
        
        elseif colors == "jacko" then
            
            ui.colors = {
                window = Color3.fromRGB(7, 6, 6),
                topbar = Color3.fromRGB(10, 9, 9),
                text = Color3.fromRGB(250, 120, 60),
                button = Color3.fromRGB(80, 70, 60),
                scroll = Color3.fromRGB(60, 50, 50),
                detail = Color3.fromRGB(100, 90, 80),
                enabledbright = Color3.fromRGB(230, 220, 210),
                enabled = Color3.fromRGB(180, 170, 160),
                textshade1 = Color3.fromRGB(255, 150, 50),
                textshade2 = Color3.fromRGB(255, 128, 0)
            }
        
        elseif colors == "legacy" then
            
            ui.colors = {
                window = Color3.fromRGB(12, 12, 17),
                topbar = Color3.fromRGB(14, 14, 19),
                text = Color3.fromRGB(225, 225, 230),
                button = Color3.fromRGB(60, 60, 120),
                scroll = Color3.fromRGB(60, 60, 120),
                detail = Color3.fromRGB(60, 60, 120),
                enabledbright = Color3.fromRGB(190, 220, 250),
                enabled = Color3.fromRGB(160, 190, 220),
                textshade1 = Color3.fromRGB(255, 0, 128),
                textshade2 = Color3.fromRGB(0, 0, 255)
            }
            
        elseif colors == "cold" then
            
            ui.colors = {
                window = Color3.fromRGB(12, 12, 16),
                topbar = Color3.fromRGB(14, 14, 18),
                text = Color3.fromRGB(225, 225, 229),
                button = Color3.fromRGB(60, 60, 90),
                scroll = Color3.fromRGB(60, 60, 80),
                detail = Color3.fromRGB(60, 60, 100),
                enabledbright = Color3.fromRGB(180, 180, 240),
                enabled = Color3.fromRGB(80, 80, 140),
                textshade1 = Color3.fromRGB(100, 100, 255),
                textshade2 = Color3.fromRGB(255, 100, 255)
            }
        
        else
        
            
            colors.window = colors.window or ui.colors.window
            colors.topbar = colors.topbar or ui.colors.topbar
            colors.text = colors.text or ui.colors.text
            colors.button = colors.button or ui.colors.button
            colors.scroll = colors.scroll or ui.colors.scroll
            colors.detail = colors.detail or ui.colors.detail
            colors.enabledbright = colors.enabledbright or ui.colors.enabledbright
            colors.enabled = colors.enabled or ui.colors.enabled
            ui.colors = colors
        
        
        end
    end
    
    function ui:NewWindow(title, sizex, sizey) 
        title = title or getrand(10)
        sizex = sizex or 400
        sizey = sizey or 200
        
        ui.WindowCount = ui.WindowCount + 1
        
        local wind_menus = {}
        local sidemenu_buttons = {}
        local menu_added = eventlistener.new()
        local OnMinimize = eventlistener.new()
        local Minimized = false
        local SidemenuOpen = false
        
        local window_window = Instance.new("Frame")
        window_window.BackgroundColor3 = ui.colors.window
        window_window.BorderSizePixel = 0
        window_window.Size = UDim2.new(0, sizex, 0, sizey)
        window_window.Position = UDim2.new(0, 20, 0, 20)
        window_window.ZIndex = 20
        
        
        local window_clip1 = window_window:Clone()
        
        shadow(window_window)
        window_clip1.Parent = screen
        window_clip1.BackgroundTransparency = 1
        window_clip1.ClipsDescendants = true
        window_clip1.Position = UDim2.new(1, -520, 1, -520)
        window_clip1.Size = UDim2.new(0, sizex+100, 0, 0)
        window_window.Parent = window_clip1
        
        
        
        local window_menureg = Instance.new("Frame")
        window_menureg.Size = UDim2.new(1, 0, 1, -30)
        window_menureg.Position = UDim2.new(0, 0, 0, 30)
        window_menureg.BackgroundTransparency = 1
        window_menureg.ZIndex = 21
        window_menureg.Parent = window_window
        
        
        local window_topbar = Instance.new("Frame")
        window_topbar.BackgroundColor3 = ui.colors.topbar
        window_topbar.BorderSizePixel = 0
        window_topbar.Size = UDim2.new(1, 0, 0, 30)
        window_topbar.Position = UDim2.new(0, 0, 0, 0)
        window_topbar.ZIndex = 30
        window_topbar.Active = true
        window_topbar.Parent = window_window
        
        local window_fade1 = Instance.new("ImageLabel")
        window_fade1.Size = UDim2.new(1, 0, 0, 30)
        window_fade1.Position = UDim2.new(0, 0, 1, -30)
        window_fade1.ZIndex = 29
        window_fade1.Active = false
        window_fade1.BackgroundTransparency = 1
        window_fade1.Image = "rbxassetid://7668647110"
        window_fade1.ImageColor3 = ui.colors.window
        window_fade1.Parent = window_menureg
        
        local window_fade2 = Instance.new("ImageLabel")
        window_fade2.Size = UDim2.new(1, 0, 0, 30)
        window_fade2.Position = UDim2.new(0, 0, 0, 0)
        window_fade2.ZIndex = 29
        window_fade2.Active = false
        window_fade2.Rotation = 180
        window_fade2.BackgroundTransparency = 1
        window_fade2.Image = "rbxassetid://7668647110"
        window_fade2.ImageColor3 = ui.colors.window
        window_fade2.Parent = window_menureg
        
        
        local window_title = Instance.new("TextLabel")
        window_title.Text = title
        window_title.BackgroundTransparency = 1
        window_title.TextTransparency = 1
        window_title.TextColor3 = ui.colors.text
        window_title.Font = ui.Font
        window_title.TextSize = ui.FontSize+4
        window_title.Size = UDim2.new(1, -60, 1, 0)
        window_title.Position = UDim2.new(0, 5, 0, 0)
        window_title.TextXAlignment = Enum.TextXAlignment.Left
        window_title.ZIndex = 31
        window_title.Parent = window_topbar
        
        local window_clip2 = Instance.new("Frame")
        window_clip2.Visible = true
        window_clip2.ClipsDescendants = true
        window_clip2.Position = UDim2.new(0, 0, 0, 0)
        window_clip2.Size = UDim2.new(1, 0, 0, 0)
        window_clip2.BackgroundTransparency = 1
        window_clip2.ZIndex = 0
        window_clip2.Parent = window_topbar
        
        local window_bclose = Instance.new("TextButton")
        window_bclose.Text = "X"
        window_bclose.ClipsDescendants = true
        window_bclose.AutoButtonColor = false
        window_bclose.BackgroundColor3 = ui.colors.button
        window_bclose.BackgroundTransparency = 1
        window_bclose.BorderSizePixel = 0
        window_bclose.TextColor3 = ui.colors.text
        window_bclose.Font = ui.Font
        window_bclose.TextSize = ui.FontSize+4
        window_bclose.Size = UDim2.new(0, 30-4, 0, 30-4)
        window_bclose.Position = UDim2.new(1, -30+2, 0, 2)
        window_bclose.ZIndex = 31
        window_bclose.Parent = window_clip2
        round(window_bclose)
        
        window_bclose.MouseEnter:Connect(function() 
            twn(window_bclose, {BackgroundTransparency = 0.4})
        end)
        
        window_bclose.MouseLeave:Connect(function() 
            twn(window_bclose, {BackgroundTransparency = 1})
        end)
        
        local window_bmin = Instance.new("TextButton")
        window_bmin.Text = "-"
        window_bmin.AutoButtonColor = false
        window_bmin.ClipsDescendants = true
        window_bmin.BackgroundColor3 = ui.colors.button
        window_bmin.BackgroundTransparency = 1
        window_bmin.BorderSizePixel = 0
        window_bmin.TextColor3 = ui.colors.text
        window_bmin.Font = ui.Font
        window_bmin.TextSize = ui.FontSize+4
        window_bmin.Size = UDim2.new(0, 30-4, 0, 30-4)
        window_bmin.Position = UDim2.new(1, -60+2, 0, 2)
        window_bmin.ZIndex = 31
        window_bmin.Parent = window_clip2
        round(window_bmin)
        
        window_bmin.MouseEnter:Connect(function() 
            twn(window_bmin, {BackgroundTransparency = 0.4})
        end)
        
        window_bmin.MouseLeave:Connect(function() 
            twn(window_bmin, {BackgroundTransparency = 1})
        end)
    
        
        local window_bmenu = Instance.new("TextButton")
        window_bmenu.Text = "="
        window_bmenu.AutoButtonColor = false
        window_bmenu.ClipsDescendants = true
        window_bmenu.BackgroundTransparency = 1
        window_bmenu.BackgroundColor3 = ui.colors.button
        window_bmenu.BorderSizePixel = 0
        window_bmenu.TextColor3 = ui.colors.text
        window_bmenu.Font = ui.Font
        window_bmenu.TextSize = ui.FontSize+4
        window_bmenu.Size = UDim2.new(0, 30-4, 0, 30-4)
        window_bmenu.Position = UDim2.new(0, 2, 0, 2)
        window_bmenu.ZIndex = 31
        window_bmenu.Parent = window_clip2
        round(window_bmenu)
        
        window_bmenu.MouseEnter:Connect(function() 
            twn(window_bmenu, {BackgroundTransparency = 0.4})
        end)
        
        window_bmenu.MouseLeave:Connect(function() 
            twn(window_bmenu, {BackgroundTransparency = 1})
        end)
        
        local window_overlay = Instance.new("ImageButton")
        window_overlay.BackgroundColor3 = ui.colors.button
        window_overlay.BorderSizePixel = 0
        window_overlay.BackgroundTransparency = 1
        window_overlay.Size = UDim2.new(1, 0, 1, 0)
        window_overlay.Position = UDim2.new(0, 0, 0, 0)
        window_overlay.ZIndex = 27
        window_overlay.AutoButtonColor = false
        --window_overlay.Text = ""
        window_overlay.ImageColor3 = ui.colors.enabled
        window_overlay.Image = "rbxassetid://7739915094"
        window_overlay.ImageTransparency = 1
        window_overlay.Active = false
        window_overlay.Visible = false 
        window_overlay.Parent = window_window
        
        local window_sidemenu = Instance.new("TextButton")
        window_sidemenu.BackgroundColor3 = ui.colors.topbar
        window_sidemenu.BorderSizePixel = 0
        window_sidemenu.ClipsDescendants = true
        window_sidemenu.Size = UDim2.new(0, 0, 1, 0)
        window_sidemenu.Position = UDim2.new(0, 0, 0, 0)
        window_sidemenu.ZIndex = 27
        window_sidemenu.AutoButtonColor = false
        window_sidemenu.Text = ""
        window_sidemenu.Active = false
        window_sidemenu.Visible = false
        window_sidemenu.Parent = window_window
        
        local function toggleMenu() 
            SidemenuOpen = not SidemenuOpen
            if SidemenuOpen then
                window_overlay.Visible = true
                window_sidemenu.Visible = true
                
                twn(window_overlay, {ImageTransparency = 0.5, BackgroundTransparency = 0.4})
                twn(window_sidemenu, {Size = UDim2.new(0.5, 0, 1, 0)})
            else
                twn(window_overlay, {ImageTransparency = 1, BackgroundTransparency = 1})
                local a = twn(window_sidemenu, {Size = UDim2.new(0, 0, 1, 0)})
                
                a.Completed:Connect(function() 
                    if window_sidemenu.Size.X.Scale == 0 then
                        window_overlay.Visible = false
                        window_sidemenu.Visible = false
                    end
                end)
            end
        end
        
        window_bmenu.MouseButton1Click:Connect(function() 
            ceffect(window_bmenu)
            toggleMenu()
        end)
        
        
        
        
        
        
        
        
        window_bmin.MouseButton1Click:Connect(function()
            ceffect(window_bmin)
            Minimized = not Minimized
            
            if Minimized then
                twn(window_window, {Size = UDim2.new(0, sizex, 0, 30)})
                twn(window_fade1, {Size = UDim2.new(1, 0, 0, 0)})
                twn(window_fade2, {Size = UDim2.new(1, 0, 0, 0)})
                window_bmin.Text = "+"
            else
                twn(window_window, {Size = UDim2.new(0, sizex, 0, sizey)})
                twn(window_fade1, {Size = UDim2.new(1, 0, 0, 30)})
                twn(window_fade2, {Size = UDim2.new(1, 0, 0, 30)})
                window_bmin.Text = "-"
            end
            OnMinimize:Fire(Minimized)
        end)
        
        window_bclose.MouseButton1Click:Connect(function() 
            ui.WindowCount = ui.WindowCount - 1 
            ceffect(window_bmin)
            task.spawn(function() 
                
                if ui.WindowCount == 0 then
                    local a = Instance.new("UIScale")
                    a.Scale = 1 
                    a.Parent = window_window
                    
                    ctwn(window_window, {Position = window_window.Position + UDim2.new(0, 0, 0, 50)}, 1.75, "Out", "Exponential")
                    ctwn(a, {Scale = 0.25}, 1, "Out", "Linear")
                    for i,v in pairs(screen:GetDescendants()) do
                        pcall(function() 
                            twn(v, {BackgroundTransparency = 1})
                            twn(v, {ScrollBarImageTransparency = 1})
                        end)
                        pcall(function() 
                            twn(v, {TextTransparency = 1})
                        end)
                        pcall(function() 
                            twn(v, {ImageTransparency = 1})
                        end)
                        
                        deb:AddItem(v, 0.25)
                    end
                else
                    local a = Instance.new("UIScale")
                    a.Scale = 1 
                    a.Parent = window_window
                    
                    ctwn(window_window, {Position = window_window.Position + UDim2.new(0, 0, 0, 50)}, 1.75, "Out", "Exponential")
                    twn(window_window, {BackgroundTransparency = 1})
                    ctwn(a, {Scale = 0.25}, 1, "Out", "Linear")
                    for i,v in pairs(window_window:GetDescendants()) do
                        pcall(function() 
                            twn(v, {BackgroundTransparency = 1})
                            twn(v, {ScrollBarImageTransparency = 1})
                        end)
                        pcall(function() 
                            twn(v, {TextTransparency = 1})
                        end)
                        pcall(function() 
                            twn(v, {ImageTransparency = 1})
                        end)
                        
                        deb:AddItem(v, 0.25)
                    end
                end
            end)
            
            wait(0.8)
            
            if ui.WindowCount == 0 then
                ui.Exiting:Fire()
                wait(0.2)
                
                screen:Destroy() 
                drag = nil
                rdrag = nil
                twn = nil
                ctwn = nil
                getrand = nil
                shadow = nil
                ceffect = nil
                
                
                ui.BindHandler:Disconnect()
                
            end
        end)
        
        
        menu_added:Connect(function(s)
            local idx = #wind_menus
            
            
            local window_tabbutton = Instance.new("TextButton")
            window_tabbutton.Text = s.n
            window_tabbutton.AutoButtonColor = false
            window_tabbutton.Active = true
            window_tabbutton.ClipsDescendants = true
            window_tabbutton.BackgroundTransparency = 0.7
            window_tabbutton.BackgroundColor3 = ui.colors.button
            window_tabbutton.TextColor3 = ui.colors.text
            window_tabbutton.Font = ui.Font
            window_tabbutton.TextXAlignment = Enum.TextXAlignment.Left
            window_tabbutton.TextSize = ui.FontSize
            window_tabbutton.Size = UDim2.new(0, (0.45*sizex)-10, 0, 24)
            window_tabbutton.Position = UDim2.new(0, 15, 0, ((#wind_menus)*28)+10)
            window_tabbutton.ZIndex = 28
            window_tabbutton.Parent = window_sidemenu
            round(window_tabbutton)
            
            
           local window_tabbuttonbd = Instance.new("TextLabel")
           window_tabbuttonbd.Text = ""
           window_tabbuttonbd.AnchorPoint = Vector2.new(1, 0)
           window_tabbuttonbd.BackgroundTransparency = 1
           window_tabbuttonbd.BackgroundColor3 = ui.colors.button
           window_tabbuttonbd.TextColor3 = ui.colors.text
           window_tabbuttonbd.Font = ui.Font
           window_tabbuttonbd.TextXAlignment = Enum.TextXAlignment.Right
           window_tabbuttonbd.TextSize = ui.FontSize - 4
           window_tabbuttonbd.Size = UDim2.new(0, 24, 0, 24)
           window_tabbuttonbd.Position = UDim2.new(1, -10, 0, 0)
           window_tabbuttonbd.ZIndex = 28
           window_tabbuttonbd.Parent = window_tabbutton
            
            local button_pad = Instance.new("UIPadding")
            button_pad.PaddingLeft = UDim.new(0, 10)
            button_pad.Parent = window_tabbutton
            
            window_tabbutton.MouseEnter:Connect(function() 
                twn(window_tabbutton, {BackgroundTransparency = 0.4})
            end)
            
            window_tabbutton.MouseLeave:Connect(function() 
                twn(window_tabbutton, {BackgroundTransparency = 0.7})
            end)
            
            local function switch() 
                
                for i,v in pairs(sidemenu_buttons) do
                    twn(v, {BackgroundColor3 = ui.colors.button}) 
                end
                twn(window_tabbutton, {BackgroundColor3 = ui.colors.enabled})
                
                for i,v in pairs(wind_menus) do
                    v.i.Visible = false
                    v.s.Visible = false
                end
                local m = wind_menus[idx]
                
                m.i.Visible = true
                m.s.Visible = true
                
            end
            
            window_tabbutton.MouseButton1Click:Connect(function() 
                ceffect(window_tabbutton)
                
                switch()
                
            end)
            
            window_tabbutton.MouseButton2Click:Connect(function() 
                ceffect(window_tabbutton)
                
                ui:NewBindDialog(s.n, switch, window_tabbutton:GetDebugId(), "Swapped menu to", window_tabbuttonbd)
            end)
            
            if idx == 1 then
                window_tabbutton.BackgroundColor3 = ui.colors.enabled 
            end
            
            table.insert(sidemenu_buttons, window_tabbutton)
            
        end)
        
        ui.OnReady:Connect(function() 
            window_window.Size = UDim2.new(0, sizex, 0, 0)
            window_window.Position = UDim2.new(0, 20, 0, 20)
            
            
            local a = Instance.new("UIScale")
            a.Scale = 0.25
            a.Parent = window_window

            twn(a, {Scale = 1})
            
            ctwn(window_clip1, {Size = UDim2.new(0, sizex+100, 0, sizey+100)}, 0.75, "InOut", "Exponential")
            ctwn(window_window, {Size = UDim2.new(0, sizex, 0, sizey)}, 0.75, "InOut", "Exponential")
            wait(0.25)
            
            ctwn(window_clip2, {Size = UDim2.new(1, 0, 1, 0)}, 2, "Out", "Exponential")
            ctwn(window_title, {TextTransparency = 0, Size = UDim2.new(1, -100, 1, 0), Position = UDim2.new(0, 35, 0, 0)}, 0.75, "Out")
            wait(0.75)
            
            window_bmenu.Parent = window_topbar
            window_bclose.Parent = window_topbar
            window_bmin.Parent = window_topbar
            window_window.Parent = screen
            
            window_window.Position = UDim2.new(1, -500, 1, -500)
            window_clip2:Destroy()
            window_clip1:Destroy()
            drag(window_topbar, window_window)
        end)
        
        
        local w = {} do
            
            function w:NewMenu(text, showtitle)
                showtitle = showtitle or true
                local menu_objects = {}
                
                local OnChildAdded = eventlistener.new()
                
                local menu_menu = Instance.new("ScrollingFrame")
                menu_menu.BackgroundTransparency = 1
                menu_menu.BorderSizePixel = 0
                menu_menu.Size = UDim2.new(1, 0, 1, 0)
                menu_menu.Position = UDim2.new(0, 0, 0, 0)
                menu_menu.ZIndex = 22
                menu_menu.CanvasSize = UDim2.new(0, 0, 0, 55)
                menu_menu.TopImage = menu_menu.MidImage
                menu_menu.BottomImage = menu_menu.MidImage
                menu_menu.ScrollingEnabled = true --may finish custom scrolling later but roblox default is used for now
                menu_menu.ScrollBarThickness = 0
                menu_menu.Visible = false
                menu_menu.Parent = window_menureg
                
                
                --local div = menu_menu.CanvasSize.Y.Scale + (menu_menu.CanvasSize.Y.Offset / menu_menu.Parent.AbsoluteSize.Y)

                local div = 0--menu_menu.CanvasSize.Y.Offset / menu_menu.Parent.AbsoluteSize.Y
                
                
                local menu_scroll = Instance.new("TextButton")
                menu_scroll.BackgroundColor3 = ui.colors.scroll
                menu_scroll.BackgroundTransparency = 0.7
                menu_scroll.BorderSizePixel = 0
                menu_scroll.Size = UDim2.new(0, 5, 1/div, -4)
                menu_scroll.Position = UDim2.new(1, -7, 0, 2)
                menu_scroll.ZIndex = 24
                menu_scroll.Text = "|"
                menu_scroll.TextScaled = true
                menu_scroll.TextColor3 = ui.colors.scroll
                menu_scroll.Font = ui.Font
                menu_scroll.AutoButtonColor = false
                menu_scroll.Visible = false
                menu_scroll.Parent = window_menureg
                
                round(menu_scroll)
                
                
                menu_scroll.MouseEnter:Connect(function() 
                    twn(menu_scroll, {BackgroundTransparency = 0.4})
                end)
                
                menu_scroll.MouseLeave:Connect(function() 
                    twn(menu_scroll, {BackgroundTransparency = 0.7})
                end)
                
                
                
                local function handleScrollPos() 
                    local y = menu_menu.CanvasPosition.Y
                    
                    menu_scroll.Position = UDim2.new(1, -7, 0, (y/div)+2)
                end
                
                local scrollConnection;
                scrollConnection = menu_menu:GetPropertyChangedSignal("CanvasPosition"):Connect(handleScrollPos)
                
                menu_scroll.InputBegan:Connect(function(old_input)
                    if old_input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local starting_pos = menu_scroll.Position
                        
                        scrollConnection:Disconnect()
                        
                        ui.cons["ScrollDrag"] = uis.InputChanged:Connect(function(new_input)
                            
                            if new_input.UserInputType == Enum.UserInputType.MouseMovement then
                                local delta = new_input.Position - old_input.Position
                                
                                twn(menu_scroll, {Position = UDim2.new(
                                    starting_pos.X.Scale, 
                                    starting_pos.X.Offset, 
                                    starting_pos.Y.Scale, 
                                    math.clamp(starting_pos.Y.Offset + delta.Y, 2, menu_menu.AbsoluteSize.Y - menu_scroll.AbsoluteSize.Y - 2)
                                )})
                            
                                twn(menu_menu, {CanvasPosition = Vector2.new(
                                    0,
                                    (starting_pos.Y.Offset + delta.Y)*div
                                )})
                            end
                        end)
                    end
                end)
                
                menu_scroll.InputEnded:Connect(function(cur_input)
                    if cur_input.UserInputType == Enum.UserInputType.MouseButton1 then
                        pcall(function() 
                            ui.cons["ScrollDrag"]:Disconnect() 
                        end)
                        scrollConnection = menu_menu:GetPropertyChangedSignal("CanvasPosition"):Connect(handleScrollPos)
                    end
                end)
                
                OnMinimize:Connect(function(toggle)
                    if toggle then 
                        twn(menu_scroll, {Size = UDim2.new(0, 5, 0, 0)})
                    else
                        twn(menu_scroll, {Size = UDim2.new(0, 5, 1/div, -4)})
                    end
                end)
                
                
                OnChildAdded:Connect(function() 
                    menu_menu.CanvasSize = menu_menu.CanvasSize + UDim2.new(0, 0, 0, 27)
                    
                    div = menu_menu.CanvasSize.Y.Offset / menu_menu.Parent.AbsoluteSize.Y
                    if div < 1 then
                        menu_scroll.Visible = false
                        
                    else
                        menu_scroll.Visible = true 
                        menu_scroll.Size = UDim2.new(0, 5, 1/div, -4)
                        handleScrollPos()
                    end
                end)

                
                if showtitle then
                    local menu_label = Instance.new("TextLabel")
                    menu_label.Text = text
                    menu_label.BackgroundTransparency = 1
                    menu_label.TextTransparency = 0
                    menu_label.TextColor3 = ui.colors.text
                    menu_label.Font = ui.Font
                    menu_label.TextSize = ui.FontSize+4
                    menu_label.Size = UDim2.new(1, -10, 0, 25)
                    menu_label.Position = UDim2.new(0, 10, 0, 0)
                    menu_label.TextXAlignment = Enum.TextXAlignment.Left
                    menu_label.ZIndex = 23
                    menu_label.Parent = menu_menu
                    
                    local among = Instance.new("UIGradient")
                    among.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, ui.colors.textshade1),
                        ColorSequenceKeypoint.new(1, ui.colors.textshade2)
                    }
                    among.Parent = menu_label 
                    
                    table.insert(menu_objects, menu_label)
                    
                    local trim = Instance.new("Frame")
                    trim.BackgroundTransparency = 0
                    trim.BackgroundColor3 = ui.colors.detail
                    trim.BorderSizePixel = 0
                    trim.Size = UDim2.new(1, -20, 0, 1)
                    trim.Position = UDim2.new(0, 10, 0, 25)
                    trim.ZIndex = 23
                    trim.Parent = menu_menu
                    
                end
                
                table.insert(wind_menus, {
                    n = text,
                    i = menu_menu,
                    s = menu_scroll
                })
            
                menu_added:Fire({n = text, i = menu_menu, s = menu_scroll})
                
                local m = {} do
                    
                    m.OnChildAdded = OnChildAdded
                    
                    function m:GetChildren()
                        return menu_objects
                    end
                    
                    function m:GetChildCount()
                        return #menu_objects
                    end
                    
                    function m:NewSection(text) 
                        local section_label = Instance.new("TextLabel")
                        section_label.Text = text
                        section_label.BackgroundTransparency = 1
                        section_label.TextTransparency = 0
                        section_label.TextColor3 = ui.colors.text
                        section_label.Font = ui.Font
                        section_label.TextSize = ui.FontSize+4
                        section_label.Size = UDim2.new(1, -10, 0, 24)
                        section_label.Position = UDim2.new(0, 10, 0, (m:GetChildCount()*28)+3)
                        section_label.TextXAlignment = Enum.TextXAlignment.Left
                        section_label.ZIndex = 23
                        section_label.Parent = menu_menu
                        
                        table.insert(menu_objects, 2)
                        
                        local l = {} do
                            
                            function l:GetText() 
                                return section_label.Text
                            end 
                            
                            function l:SetText(txt) 
                                if not txt then error("SetText failed; value provided cannot be nil") end
                                section_label.Text = tostring(txt)
                            end
                        end
                        
                        OnChildAdded:Fire("section", l)
                        
                        return l
                    end
                    
                    function m:NewLabel(text) 
                        local label_label = Instance.new("TextLabel")
                        label_label.Text = text
                        label_label.BackgroundTransparency = 1
                        label_label.TextTransparency = 0
                        label_label.TextColor3 = ui.colors.text
                        label_label.Font = ui.Font
                        label_label.TextSize = ui.FontSize
                        label_label.Size = UDim2.new(1, -15, 0, 24)
                        label_label.Position = UDim2.new(0, 15, 0, (m:GetChildCount()*28)+3)
                        label_label.TextXAlignment = Enum.TextXAlignment.Left
                        label_label.ZIndex = 23
                        label_label.Parent = menu_menu
                        
                        if label_label.TextFits == false then
                            label_label.Size = UDim2.new(1, -15, 0, 48)
                            label_label.TextWrapped = true
                            table.insert(menu_objects, 2)
                        end
                        
                        table.insert(menu_objects, 2)
                        
                        local l = {} do
                            
                            function l:GetText() 
                                return label_label.Text
                            end 
                            
                            function l:SetText(txt) 
                                if not txt then error("SetText failed; value provided cannot be nil") end
                                label_label.Text = tostring(txt)
                            end
                        end
                        
                        OnChildAdded:Fire("label", l)
                        
                        return l
                    end
                    
                    function m:NewToggle(text, state)
                        state = state or false
                        text = text or getrand(7)
                        
                        
                        local toggle_state = state
                        local hidden = false
                        
                        local OnEnable = eventlistener.new()
                        local OnToggle = eventlistener.new()
                        local OnDisable = eventlistener.new()
                        
                        local toggle_button = Instance.new("TextButton")
                        toggle_button.Text = text
                        toggle_button.AutoButtonColor = false
                        toggle_button.ClipsDescendants = true
                        toggle_button.BackgroundTransparency = 0.7
                        toggle_button.BackgroundColor3 = ui.colors.button
                        toggle_button.TextColor3 = ui.colors.text
                        toggle_button.Font = ui.Font
                        toggle_button.TextXAlignment = Enum.TextXAlignment.Left
                        toggle_button.TextSize = ui.FontSize
                        toggle_button.Size = UDim2.new(0, menu_menu.AbsoluteSize.X-30, 0, 24)
                        toggle_button.Position = UDim2.new(0, 15, 0, ((m:GetChildCount())*28)+3)
                        toggle_button.ZIndex = 23
                        toggle_button.Parent = menu_menu
                        round(toggle_button)
                        
                        local toggle_pad = Instance.new("UIPadding")
                        toggle_pad.PaddingLeft = UDim.new(0, 10)
                        toggle_pad.Parent = toggle_button
                        
                        
                        local toggle_tbox = Instance.new("ImageLabel")
                        toggle_tbox.Active = false
                        toggle_tbox.BackgroundTransparency = 1
                        toggle_tbox.Image = "rbxassetid://7197977900"
                        toggle_tbox.ImageColor3 = ui.colors.text
                        toggle_tbox.Position = UDim2.new(1, -30, 0, -5)
                        toggle_tbox.Size = UDim2.new(0, 34, 0, 34)
                        toggle_tbox.Rotation = 0
                        toggle_tbox.ZIndex = 23
                        toggle_tbox.Parent = toggle_button
                        
                        local toggle_tcheck = Instance.new("ImageLabel")
                        toggle_tcheck.Active = false
                        toggle_tcheck.BackgroundTransparency = 1
                        toggle_tcheck.ImageTransparency = 1
                        toggle_tcheck.Image = "rbxassetid://7202619688"
                        toggle_tcheck.ImageColor3 = ui.colors.enabledbright
                        toggle_tcheck.Position = UDim2.new(1, -30, 0, -5)
                        toggle_tcheck.Size = UDim2.new(0, 34, 0, 34)
                        toggle_tcheck.Rotation = 0
                        toggle_tcheck.ZIndex = 23
                        toggle_tcheck.Parent = toggle_button
                        
                        local toggle_binddisplay = Instance.new("TextLabel")
                        toggle_binddisplay.Text = ""
                        toggle_binddisplay.AnchorPoint = Vector2.new(1, 0)
                        toggle_binddisplay.BackgroundTransparency = 1
                        toggle_binddisplay.BackgroundColor3 = ui.colors.button
                        toggle_binddisplay.TextColor3 = ui.colors.text
                        toggle_binddisplay.Font = ui.Font
                        toggle_binddisplay.TextXAlignment = Enum.TextXAlignment.Right
                        toggle_binddisplay.TextSize = ui.FontSize - 4
                        toggle_binddisplay.Size = UDim2.new(0, 24, 0, 24)
                        toggle_binddisplay.Position = UDim2.new(1, -24, 0, 0)
                        toggle_binddisplay.ZIndex = 23
                        toggle_binddisplay.Parent = toggle_button
                        
                        local toggle_hider = Instance.new("TextButton")
                        toggle_hider.Text = ""
                        toggle_hider.AutoButtonColor = false
                        toggle_hider.BackgroundTransparency = 1
                        toggle_hider.BackgroundColor3 = ui.colors.button
                        toggle_hider.TextColor3 = ui.colors.text
                        toggle_hider.Font = ui.Font
                        toggle_hider.TextXAlignment = Enum.TextXAlignment.Center
                        toggle_hider.TextSize = ui.FontSize
                        toggle_hider.TextTransparency = 1
                        toggle_hider.Size = UDim2.new(1, 10, 1, 0)
                        toggle_hider.Position = UDim2.new(0, -10, 0, 0)
                        toggle_hider.ZIndex = 24
                        toggle_hider.Visible = false
                        toggle_hider.Parent = toggle_button
                        round(toggle_hider)
                        
                        
                        toggle_hider.MouseEnter:Connect(function() 
                            if toggle_hider.BackgroundTransparency ~= 1 then
                                twn(toggle_hider, {BackgroundTransparency = 0.5, TextTransparency = 0.9})
                            end
                        end)
                        
                        toggle_hider.MouseLeave:Connect(function() 
                            if toggle_hider.BackgroundTransparency ~= 1 then
                                twn(toggle_hider, {BackgroundTransparency = 0.2, TextTransparency = 0})
                            end
                        end)
                        
                        toggle_button.MouseEnter:Connect(function() 
                            twn(toggle_button, {BackgroundTransparency = 0.4})
                        end)
                        
                        toggle_button.MouseLeave:Connect(function() 
                            twn(toggle_button, {BackgroundTransparency = 0.7})
                        end)
                        
                        local function disable() 
                            toggle_state = false
                            
                            twn(toggle_button, {BackgroundColor3 = ui.colors.button})  
                            twn(toggle_tcheck, {ImageTransparency = 1})

                            OnToggle:Fire(false)
                            OnDisable:Fire()
                        end
                        
                        local function enable() 
                            toggle_state = true
                            
                            twn(toggle_button, {BackgroundColor3 = ui.colors.enabled})
                            twn(toggle_tcheck, {ImageTransparency = 0})
                            
                            OnToggle:Fire(true)
                            OnEnable:Fire()
                        end
                        
                        if state == true then enable() end
                        
                        local function toggle() 
                            
                            
                            toggle_state = not toggle_state
                            
                            
                            if (toggle_state) then
                                enable() 
                                
                            else
                                disable()
                            end
                        end
                        
                        toggle_button.MouseButton1Click:Connect(function() 
                            ceffect(toggle_button)
                            toggle()
                        end)
                        
                        
                        table.insert(menu_objects, 1)
                        
                        local t = {} do
                            
                            function t:GetState() 
                                return toggle_state
                            end 
                            
                            function t:SetState(bool, callafter) 
                                callafter = callafter or true
                                
                                
                                xpcall(function() 
                                    toggle_state = bool    
                                end, function() 
                                    error("Did not pass SetState with boolean; sent with "..tostring(bool))
                                end)
                                
                                if callafter == true then
                                    toggle()
                                end
                            end
                            
                            function t:Toggle() 
                                toggle()
                            end
                            
                            function t:Enable() 
                                enable()
                            end
                            
                            function t:Disable() 
                                disable()
                            end
                            
                            function t:SetBind(kc)
                                local bd_id = toggle_button:GetDebugId()
                                if kc == nil then
                                    for i,v in pairs(ui.binds) do
                                        if i == bd_id then
                                            ui.binds[i] = nil
                                            bd_display.Text = ""
                                        end
                                    end
                                else
                                    ui.binds[bd_id] = {
                                        b = kc,
                                        f = t.Toggle,
                                        n = text,
                                        w = "Toggled"
                                    }
                                    
                                    toggle_binddisplay.Text = kc
                                end
                                
                            end
                            
                            function t:GetBind() 
                                return ui.binds[toggle_button:GetDebugId()].b
                            end
                            
                            
                            function t:SetText(tx) 
                                if tx == nil then error("SetText failed; provided value was nil") end
                                toggle_button.Text = tostring(tx)
                                ui.binds[toggle_button:GetDebugId()].n = tostring(tx)
                            end
                            
                            function t:GetText() 
                                return toggle_button.Text
                            end
                            
                            function t:Assert(func) 
                                if type(func) ~= "string" then error("Assert failed; provided value was not a string") end
                                
                                
                                if not getgenv()[func] then
                                    t:Hide("Your exploit doesn't support "..tostring(func)) 
                                end
                            end
                            
                            function t:Hide(msg)
                                if not msg then return end
                                hidden = true
                                t.Hidden = hidden
                                
                                toggle_hider.Visible = true
                                toggle_hider.Text = tostring(msg)
                                twn(toggle_hider, {BackgroundTransparency = 0.2, TextTransparency = 0})
                            end
                            
                            function t:Unhide() 
                                hidden = false
                                t.Hidden = hidden
                                
                                local a = twn(toggle_hider, {BackgroundTransparency = 1, TextTransparency = 1})
                                
                                a.Completed:Connect(function() 
                                    if toggle_hider.BackgroundTransparency == 1 then
                                        toggle_hider.Visible = false
                                    end
                                end)
                                
                            end
                            
                            t.Hidden = hidden
                            
                            t.OnDisable = OnDisable
                            t.OnEnable = OnEnable
                            t.OnToggle = OnToggle
                        end
                        
                        toggle_button.MouseButton2Click:Connect(function() 
                            ceffect(toggle_button)
                            ui:NewBindDialog(text, t.Toggle, toggle_button:GetDebugId(), "Toggled", toggle_binddisplay)
                        end)
                        
                        OnChildAdded:Fire("toggle", t)
                        
                        table.insert(ui.Toggles, t)
                        
                        return t
                    end
                    
                    function m:NewButton(text)
                        text = text or getrand(7)
                        
                        local OnClick = eventlistener.new()
                        local hidden = false
                        
                        local button_button = Instance.new("TextButton")
                        button_button.Text = text
                        button_button.AutoButtonColor = false
                        button_button.ClipsDescendants = true
                        button_button.BackgroundTransparency = 0.7
                        button_button.BackgroundColor3 = ui.colors.button
                        button_button.TextColor3 = ui.colors.text
                        button_button.Font = ui.Font
                        button_button.TextXAlignment = Enum.TextXAlignment.Left
                        button_button.TextSize = ui.FontSize
                        button_button.Size = UDim2.new(0, menu_menu.AbsoluteSize.X-30, 0, 24)
                        button_button.Position = UDim2.new(0, 15, 0, ((m:GetChildCount())*28)+3)
                        button_button.ZIndex = 23
                        button_button.Parent = menu_menu
                        round(button_button)
                        
                        local button_pad = Instance.new("UIPadding")
                        button_pad.PaddingLeft = UDim.new(0, 10)
                        button_pad.Parent = button_button
                        
                        local button_binddisplay = Instance.new("TextLabel")
                        button_binddisplay.Text = ""
                        button_binddisplay.AnchorPoint = Vector2.new(1, 0)
                        button_binddisplay.BackgroundTransparency = 1
                        button_binddisplay.BackgroundColor3 = ui.colors.button
                        button_binddisplay.TextColor3 = ui.colors.text
                        button_binddisplay.Font = ui.Font
                        button_binddisplay.TextXAlignment = Enum.TextXAlignment.Right
                        button_binddisplay.TextSize = ui.FontSize - 4
                        button_binddisplay.Size = UDim2.new(0, 24, 0, 24)
                        button_binddisplay.Position = UDim2.new(1, -10, 0, 0)
                        button_binddisplay.ZIndex = 23
                        button_binddisplay.Parent = button_button
                        
                        local button_hider = Instance.new("TextButton")
                        button_hider.Text = ""
                        button_hider.AutoButtonColor = false
                        button_hider.BackgroundTransparency = 1
                        button_hider.BackgroundColor3 = ui.colors.button
                        button_hider.TextColor3 = ui.colors.text
                        button_hider.Font = ui.Font
                        button_hider.TextXAlignment = Enum.TextXAlignment.Center
                        button_hider.TextSize = ui.FontSize
                        button_hider.TextTransparency = 1
                        button_hider.Size = UDim2.new(1, 10, 1, 0)
                        button_hider.Position = UDim2.new(0, -10, 0, 0)
                        button_hider.ZIndex = 24
                        button_hider.Visible = false
                        button_hider.Parent = button_button
                        round(button_hider)
                        
                        round(slider_text)
                        

                        
                        button_button.MouseEnter:Connect(function() 
                            twn(button_button, {BackgroundTransparency = 0.4})
                        end)
                        
                        button_button.MouseLeave:Connect(function() 
                            twn(button_button, {BackgroundTransparency = 0.7})
                        end)
                        
                        button_hider.MouseEnter:Connect(function() 
                            if button_hider.BackgroundTransparency ~= 1 then
                                twn(button_hider, {BackgroundTransparency = 0.5, TextTransparency = 0.9})
                            end
                        end)
                        
                        button_hider.MouseLeave:Connect(function() 
                            if button_hider.BackgroundTransparency ~= 1 then
                                twn(button_hider, {BackgroundTransparency = 0.2, TextTransparency = 0})
                            end
                        end)
                        
                        
                        button_button.MouseButton1Click:Connect(function() 
                            ceffect(button_button)
                            OnClick:Fire()
                        end)
                        
                        
                        
                        
                        
                        table.insert(menu_objects, 1)
                        
                        local t = {} do
                            
                            function t:Fire() 
                                OnClick:Fire()
                            end
                            
                            function t:SetCallback(cb) 
                                if type(cb) ~= "function" then
                                    error("SetCallback failed; provided value was not a function")
                                end
                                callback = cb
                            end
                            
                            function t:SetBind(kc)
                                local bd_id = button_button:GetDebugId()
                                if kc == nil then
                                    for i,v in pairs(ui.binds) do
                                        if i == bd_id then
                                            ui.binds[i] = nil
                                            bd_display.Text = ""
                                        end
                                    end
                                else
                                    ui.binds[bd_id] = {
                                        b = kc,
                                        f = t.Toggle,
                                        n = text,
                                        w = "Toggled"
                                    }
                                    
                                    button_binddisplay.Text = kc
                                end
                                
                            end
                            
                            function t:GetBind() 
                                return ui.binds[toggle_button:GetDebugId()].b
                            end
                            
                            function t:SetText(tx) 
                                if tx == nil then error("SetText failed; provided value was nil") end
                                button_button.Text = tostring(tx)
                                ui.binds[button_button:GetDebugId()].n = tostring(tx)
                            end
                            
                            function t:GetText() 
                                return button_button.Text
                            end
                            
                            function t:Hide(msg)
                                if not msg then return end
                                hidden = true
                                
                                button_hider.Visible = true
                                button_hider.Text = tostring(msg)
                                twn(button_hider, {BackgroundTransparency = 0.2, TextTransparency = 0})
                            end
                            
                            function t:Unhide() 
                                hidden = false
                                
                                
                                local a = twn(button_hider, {BackgroundTransparency = 1, TextTransparency = 1})
                                
                                a.Completed:Connect(function() 
                                    if button_hider.BackgroundTransparency == 1 then
                                        button_hider.Visible = false
                                    end
                                end)
                                
                            end
                            
                            function t:Assert(func) 
                                if type(func) ~= "string" then error("Assert failed; provided value was not a string") end
                                
                                
                                if not getgenv()[func] then
                                    t:Hide("Your exploit doesn't support "..tostring(func)) 
                                end
                            end
                            
                            t.Hidden = hidden
                            t.OnClick = OnClick
                        end
                        
                        button_button.MouseButton2Click:Connect(function() 
                            ceffect(button_button)
                            ui:NewBindDialog(text, t.Fire, button_button:GetDebugId(), "Fired", button_binddisplay)
                        end)
                        
                        OnChildAdded:Fire("button", t)
                        
                        return t
                    end
                    
                    
                    function m:NewTextbox(text)
                        text = text or getrand(7)
                        
                        local OnFocusLost = eventlistener.new()
                        local OnFocusGained = eventlistener.new()
                        
                        local text_textbox = Instance.new("TextBox")
                        text_textbox.Active = true
                        text_textbox.Text = text
                        text_textbox.ClipsDescendants = true
                        text_textbox.TextColor3 = ui.colors.text
                        text_textbox.PlaceholderText = "..."
                        text_textbox.BackgroundTransparency = 0.7
                        text_textbox.BackgroundColor3 = ui.colors.button
                        text_textbox.Size = UDim2.new(0, menu_menu.AbsoluteSize.X-30, 0, 24)
                        text_textbox.Position = UDim2.new(0, 15, 0, ((m:GetChildCount())*28)+3)
                        text_textbox.ZIndex = 23
                        text_textbox.Parent = menu_menu
                        text_textbox.Font = ui.Font
                        text_textbox.TextXAlignment = Enum.TextXAlignment.Left
                        text_textbox.TextSize = ui.FontSize
                        round(text_textbox)
                        
                        local text_icon = Instance.new("ImageLabel")
                        text_icon.Active = false
                        text_icon.BackgroundTransparency = 1
                        text_icon.Image = "rbxassetid://7467053157"
                        text_icon.ImageColor3 = ui.colors.text
                        text_icon.Position = UDim2.new(1, -30, 0, -5)
                        text_icon.Size = UDim2.new(0, 34, 0, 34)
                        text_icon.Rotation = 0
                        text_icon.ZIndex = 23
                        text_icon.Parent = text_textbox
                        
                        
                        local button_pad = Instance.new("UIPadding")
                        button_pad.PaddingLeft = UDim.new(0, 10)
                        button_pad.Parent = text_textbox
                        
                        
                        text_textbox.MouseEnter:Connect(function() 
                            twn(text_textbox, {BackgroundTransparency = 0.4})
                        end)
                        
                        text_textbox.MouseLeave:Connect(function() 
                            twn(text_textbox, {BackgroundTransparency = 0.7})
                        end)
                        
                        text_textbox.FocusLost:Connect(function(enter, io) 
                            twn(text_textbox, {BackgroundColor3 = ui.colors.button})  
                            twn(text_icon,    {BackgroundColor3 = ui.colors.text})
                            
                            OnFocusLost:Fire(text_textbox.Text, enter, io)
                        end)
                        
                        text_textbox.Focused:Connect(function() 
                            twn(text_textbox, {BackgroundColor3 = ui.colors.enabled})
                            twn(text_icon,    {BackgroundColor3 = ui.colors.enabledbright})
                            
                            ceffect(text_textbox)
                            
                            OnFocusGained:Fire(text_textbox.Text)
                        end)


                        
                        table.insert(menu_objects, 5)
                        
                        local t = {} do

                            
                            function t:SetText(txt)
                                if txt == nil then error("SetText failed; provided text was nil") end
                                text_textbox.Text = tostring(txt)
                            end
                            
                            function t:ForceFocus() 
                                text_textbox:CaptureFocus()
                            end
                            
                            function t:ForceRelease() 
                                text_textbox:ReleaseFocus()
                            end
                            
                            function t:SetClearOnFocus(state) 
                                if type(state) ~= "boolean" then error("SetClearOnFocus failed; provided state was not a bool") end
                            
                                text_textbox.ClearTextOnFocus = state
                            end
                            
                            function t:IsFocused() 
                                return text_textbox:IsFocused()
                            end
                            
                            function t:GetText() 
                                return text_textbox.Text
                            end
                            
                            function t:GetTextFormattedAsInt() 
                                local among = nil
                                
                                pcall(function() 
                                    among = text_textbox.Text:gsub("[%a%s]", "")
                                end)
                                
                                return among and tonumber(among) or nil
                            end
                            
                            t.OnFocusLost = OnFocusLost
                            t.OnFocusGained = OnFocusGained
                        end
                        
                        OnChildAdded:Fire("textbox", t)
                        
                        return t
                    end
                    
                    function m:NewSlider(text, min, max, start) 
                        text = text or getrand(7)
                        min = min or 0
                        max = max or 100
                        start = start or min
                        
                        
                        if max > 999 then max = 999
                        elseif max < 1 then max = 1
                        end
                        if min >= max then min = max-1
                        elseif min < 0 then min = 0
                        end

                        start = math.clamp(start, min, max)
                        
                        
                        local OnValueChanged = eventlistener.new()
                        local OnFocusLost = eventlistener.new()
                        local OnFocusGained = eventlistener.new()
                        local Focused = false
                        local SlowDragging = false
                        local FastDragging = false
                        
                        local slider_bg = Instance.new("Frame")
                        slider_bg.BackgroundTransparency = 0.7
                        slider_bg.BackgroundColor3 = ui.colors.button
                        slider_bg.Size = UDim2.new(0, menu_menu.AbsoluteSize.X-30, 0, 24)
                        slider_bg.Position = UDim2.new(0, 15, 0, ((m:GetChildCount())*28)+3)
                        slider_bg.ZIndex = 23
                        slider_bg.Parent = menu_menu
                        round(slider_bg)
                        
                        local slider_text = Instance.new("TextButton")
                        slider_text.Active = false
                        slider_text.Selectable = false
                        slider_text.Text = text
                        slider_text.AutoButtonColor = false
                        slider_text.BackgroundTransparency = 0.2
                        slider_text.BackgroundColor3 = ui.colors.button
                        slider_text.TextColor3 = ui.colors.text
                        slider_text.Font = ui.Font
                        slider_text.TextXAlignment = Enum.TextXAlignment.Center
                        slider_text.TextSize = ui.FontSize
                        slider_text.Size = UDim2.new(1, 0, 1, 0)
                        slider_text.Position = UDim2.new(0, 0, 0, 0)
                        slider_text.ZIndex = 24
                        slider_text.Visible = true
                        slider_text.Parent = slider_bg
                        
                        round(slider_text)
                        
                        local slider_amount = Instance.new("TextBox")
                        slider_amount.Active = true
                        slider_amount.Text = ""
                        slider_amount.PlaceholderText = "..."
                        slider_amount.BackgroundTransparency = 1
                        slider_amount.BackgroundColor3 = ui.colors.button
                        slider_amount.TextColor3 = ui.colors.text
                        slider_amount.Font = ui.Font
                        slider_amount.TextXAlignment = Enum.TextXAlignment.Center
                        slider_amount.TextSize = ui.FontSize
                        slider_amount.Size = UDim2.new(0, 35, 1, 0)
                        slider_amount.Position = UDim2.new(0, 5, 0, 0)
                        slider_amount.ZIndex = 24
                        slider_amount.Parent = slider_bg
                        
                        local slider_back = Instance.new("Frame")
                        slider_back.AnchorPoint = Vector2.new(1, 0)
                        slider_back.BorderSizePixel = 0
                        slider_back.BackgroundTransparency = 0
                        slider_back.ClipsDescendants = true
                        slider_back.BackgroundColor3 = ui.colors.scroll
                        slider_back.Size = UDim2.new(0, slider_bg.AbsoluteSize.X - 55, 0, 6)
                        slider_back.Position = UDim2.new(1, -10, 0.5, -3)
                        slider_back.ZIndex = 23
                        slider_back.Parent = slider_bg
                        
                        local slider_slider = Instance.new("Frame")
                        slider_slider.AnchorPoint = Vector2.new(1, 0)
                        slider_slider.BorderSizePixel = 0
                        slider_slider.BackgroundTransparency = 0
                        slider_slider.ClipsDescendants = true
                        slider_slider.BackgroundColor3 = ui.colors.enabled
                        slider_slider.Size = UDim2.new(1, 0, 1, 0)
                        slider_slider.Position = UDim2.new(0, 0, 0, 0)
                        slider_slider.ZIndex = 23
                        slider_slider.Parent = slider_back
                        
                        
                        slider_text.MouseEnter:Connect(function() 
                            local a = twn(slider_text, {BackgroundTransparency = 1, TextTransparency = 1})
                            a.Completed:Connect(function()
                                if slider_text.BackgroundTransparency == 1 then 
                                    slider_text.ZIndex = 0
                                end
                            end)
                        end)
                        
                        slider_text.MouseLeave:Connect(function() 
                            if Focused then
                                OnFocusLost:Wait()
                            end
                            slider_text.ZIndex = 24
                            twn(slider_text, {BackgroundTransparency = 0.2, TextTransparency = 0})
                        end)
                        
                        local slider_id = "Slider"..getrand(10)
                        local ratio = (slider_back.AbsoluteSize.X / (max-min))

                        
                        local value = math.floor((start-min) * ratio)
                        local oldv = value
                        
                        slider_amount.Text = tostring(start)
                        slider_slider.Position = UDim2.new(0, value, 0, 0)
                        
                        slider_back.InputBegan:Connect(function(input1)
                            if input1.UserInputType == Enum.UserInputType.MouseButton1 then
                                if not SlowDragging then
                                    OnFocusGained:Fire(1)
                                    Focused = true
                                    FastDragging = true
                                    
                                    local x = math.floor(math.clamp(((input1.Position.X - slider_back.AbsolutePosition.X)), 0, slider_slider.AbsoluteSize.X))
                                    twn(slider_slider, {Position = UDim2.new(0, x, 0, 0)})
                                    
                                    value = min+math.floor(x / ratio)
                                    slider_amount.Text = tostring(value)
                                    
                                    
                                    
                                    if value ~= oldv then
                                        OnValueChanged:Fire(value, 1)
                                    end
                                    oldv = value
                                    
                                    ui.cons[slider_id] = uis.InputChanged:Connect(function(input2)
                                        if input2.UserInputType == Enum.UserInputType.MouseMovement then
                                            local delta = (input2.Position - input1.Position)
                                            local x = math.floor(math.clamp(x + delta.X, 0, slider_back.AbsoluteSize.X))
                                            twn(slider_slider, {Position = UDim2.new(0, x, 0, 0)})
                                                    
                                            value = min+math.floor(x / ratio)
                                            slider_amount.Text = tostring(value)
                                            
                                            
                                            if value ~= oldv then
                                                OnValueChanged:Fire(value, 1)
                                            end
                                            
                                            oldv = value
                                        end
                                    end)
                                end
                            elseif input1.UserInputType == Enum.UserInputType.MouseButton2 then
                                if not FastDragging then
                                    OnFocusGained:Fire(2)
                                    Focused = true
                                    SlowDragging = true
                                    
                                    local x = slider_back.AbsolutePosition.X
                                    local x_2 = slider_slider.Position.X.Offset
                                    
                                    ui.cons[slider_id.."2"] = uis.InputChanged:Connect(function(input2)
                                        if input2.UserInputType == Enum.UserInputType.MouseMovement then
                                            local delta = ((input1.Position - input2.Position).x)/5
                                            
                                            
                                            local x = math.floor(math.clamp(x_2 - delta, 0, slider_back.AbsoluteSize.X))
                                            twn(slider_slider, {Position = UDim2.new(0, x, 0, 0)})
                                            
                                            value = min+math.floor(x / ratio)
                                            slider_amount.Text = tostring(value)
                                            
                                            
                                            if value ~= oldv then
                                                OnValueChanged:Fire(value, 2)
                                            end
                                            
                                            oldv = value
                                        end
                                    end)
                                end
                            end
                        end)
                        
                        slider_back.InputEnded:Connect(function(input1)
                            if input1.UserInputType == Enum.UserInputType.MouseButton1 then
                                if not SlowDragging then
                                    pcall(function() ui.cons[slider_id]:Disconnect() end)
                                    
                                    OnFocusLost:Fire(1)
                                    Focused = false
                                    FastDragging = false
                                end
                            elseif input1.UserInputType == Enum.UserInputType.MouseButton2 then
                                if not FastDragging then
                                    pcall(function() ui.cons[slider_id.."2"]:Disconnect() end)
                                    
                                    OnFocusLost:Fire(2)
                                    Focused = false
                                    SlowDragging = false
                                end
                            end
                            
                        end) 
                        
                        
                        
                        table.insert(menu_objects, 3)
                        
                        
                        local s = {} do
                            
                            function s:GetValue() 
                                return value
                            end
                            
                            function s:SetValue(v) 
                                if type(v) ~= "number" then
                                    error("SetValue failed; provided value was not a number")
                                end
                                
                                v = math.clamp(v, min, max)
                                value = v
                                slider_amount.Text = tostring(value)
                                twn(slider_slider, {Position = UDim2.new(0, math.floor((value-min) * ratio), 0, 0)})
                            end
                            
                            
                            function s:SetMax(m)
                                if type(m) ~= "number" then
                                    error("SetMax failed; provided max was not a number")
                                end
                                
                                max = m
                                if max > 999 then max = 999
                                elseif max < 1 then max = 1
                                end
                                
                                ratio = (slider_back.AbsoluteSize.X / (max-min))
                                
                                value = math.clamp(value, min, max)
                                slider_amount.Text = tostring(value)
                                twn(slider_slider, {Position = UDim2.new(0, min+math.floor(value * ratio), 0, 0)})
                                
                                
                            end
                            
                            
                            function s:GetMax() 
                                return max
                            end
                            
                            function s:SetMin(m) 
                                if type(m) ~= "number" then
                                    error("SetMax failed; provided max was not a number")
                                end
                                
                                min = m
                                if min >= max then min = max-1
                                elseif min < 0 then min = 0
                                end
                                
                                ratio = (slider_back.AbsoluteSize.X / (max-min))
                                
                                value = math.clamp(value, min, max)
                                slider_amount.Text = tostring(value)
                                twn(slider_slider, {Position = UDim2.new(0, math.floor(value * ratio), 0, 0)})
                            end
                            
                            function s:GetMin() 
                                return min
                            end
                            
                            s.OnValueChanged = OnValueChanged
                            s.OnFocusLost    = OnFocusLost
                            s.OnFocusGained  = OnFocusGained
                            
                            
                        end
                        
                        slider_amount.FocusLost:Connect(function() 
                            local tx = slider_amount.Text:gsub("[^%d]", "")
                            local success,ntx = pcall(function() 
                                return tonumber(tx)
                            end)
                            
                            
                            if success then
                            
                                s:SetValue(ntx)
                            end
                            slider_amount.Text = s:GetValue()
                        end)
                        
                        OnChildAdded:Fire("slider", s)
                        
                        return s

                    end
                    
                    function m:NewDropdown(text, options)
                        text = text or getrand(7)
                        options = options or {
                            getrand(5),
                            getrand(5),
                            getrand(5)
                            
                        }
                        
                        local options_buttons = {}
                        local open_state = false
                        local selection = {options[1], 1}
                        
                        local OnSelection = eventlistener.new()
                        local OnOpen = eventlistener.new()
                        local OnClose = eventlistener.new()
                        local OnToggle = eventlistener.new()
                        
                        
                        local dropdown_button = Instance.new("TextButton")
                        dropdown_button.Text = text .. " ("..tostring(selection[1])..")"
                        dropdown_button.AutoButtonColor = false
                        dropdown_button.ClipsDescendants = true
                        dropdown_button.BackgroundTransparency = 0.7
                        dropdown_button.BackgroundColor3 = ui.colors.button
                        dropdown_button.TextColor3 = ui.colors.text
                        dropdown_button.Font = ui.Font
                        dropdown_button.TextXAlignment = Enum.TextXAlignment.Left
                        dropdown_button.TextSize = ui.FontSize
                        dropdown_button.Size = UDim2.new(0, menu_menu.AbsoluteSize.X-30, 0, 24)
                        dropdown_button.Position = UDim2.new(0, 15, 0, ((m:GetChildCount())*28)+3)
                        dropdown_button.ZIndex = 23
                        dropdown_button.Parent = menu_menu
                        round(dropdown_button)
                        
                        local dropdown_pad = Instance.new("UIPadding")
                        dropdown_pad.PaddingLeft = UDim.new(0, 10)
                        dropdown_pad.Parent = dropdown_button
                        
                        local dropdown_arrow = Instance.new("ImageLabel")
                        dropdown_arrow.Active = false
                        dropdown_arrow.BackgroundTransparency = 1
                        dropdown_arrow.Image = "rbxassetid://7184113125"
                        dropdown_arrow.ImageColor3 = ui.colors.text
                        dropdown_arrow.Position = UDim2.new(1, -30, 0, -5)
                        dropdown_arrow.Size = UDim2.new(0, 34, 0, 34)
                        dropdown_arrow.Rotation = 180
                        dropdown_arrow.ZIndex = 23
                        dropdown_arrow.Parent = dropdown_button
                        
                        local dropdown_container = Instance.new("Frame")
                        dropdown_container.Size = UDim2.new(dropdown_button.Size.X, UDim.new(0, 0))
                        dropdown_container.BorderSizePixel = 0
                        dropdown_container.BackgroundColor3 = ui.colors.window
                        dropdown_container.ZIndex = 25
                        dropdown_container.ClipsDescendants = true
                        dropdown_container.BackgroundTransparency = 0
                        dropdown_container.Position = dropdown_button.Position + UDim2.new(0, 0, 0, 24)
                        dropdown_container.Parent = menu_menu

                        round(dropdown_container)
                        
                        
                        dropdown_button.MouseEnter:Connect(function() 
                            twn(dropdown_button, {BackgroundTransparency = 0.4})
                        end)
                        
                        dropdown_button.MouseLeave:Connect(function() 
                            twn(dropdown_button, {BackgroundTransparency = 0.7})
                        end)
                        
                        
                        
                        local function open() 
                            twn(dropdown_arrow, {Rotation = 360})
                            twn(dropdown_container, {Size = UDim2.new(dropdown_button.Size.X, UDim.new(0, (#options*28)+15))})
                            twn(dropdown_button, {BackgroundColor3 = ui.colors.enabled})
                            
                            
                            OnOpen:Fire()
                            OnToggle:Fire(true)
                        end
                        
                        local function close() 
                            twn(dropdown_arrow, {Rotation = 180})
                            twn(dropdown_container, {Size = UDim2.new(dropdown_button.Size.X, UDim.new(0, 0))})
                            twn(dropdown_button, {BackgroundColor3 = ui.colors.button})
                            
                            
                            OnClose:Fire()
                            OnToggle:Fire(false)
                        end
                        
                        local function toggle() 
                            open_state = not open_state
                            if open_state then
                                open()
                            else
                                close()
                            end
                        end
                        
                        dropdown_button.MouseButton1Click:Connect(function() 
                            
                            
                            ceffect(dropdown_button)
                            
                            toggle()
                            
                        end)
                        
                        dropdown_button.MouseButton2Click:Connect(function() 
                            
                            
                            ceffect(dropdown_button)
                            
                            toggle()
                            
                        end)
                        
                        
                        for i,v in pairs(options) do
                            local dropdown_option = Instance.new("TextButton")
                            dropdown_option.Text = v
                            dropdown_option.AutoButtonColor = false
                            dropdown_option.ClipsDescendants = true
                            dropdown_option.BackgroundTransparency = 0.7
                            dropdown_option.BackgroundColor3 = ui.colors.button
                            dropdown_option.TextColor3 = ui.colors.text
                            dropdown_option.Font = ui.Font
                            dropdown_option.TextXAlignment = Enum.TextXAlignment.Left
                            dropdown_option.TextSize = ui.FontSize
                            dropdown_option.Size = UDim2.new(0, dropdown_container.AbsoluteSize.X-30, 0, 24)
                            dropdown_option.Position = UDim2.new(0, 15, 0, ((i-1)*28)+8)
                            dropdown_option.ZIndex = 25
                            dropdown_option.Parent = dropdown_container
                            round(dropdown_option)
                            
                            local dropdown_pad = Instance.new("UIPadding")
                            dropdown_pad.PaddingLeft = UDim.new(0, 10)
                            dropdown_pad.Parent = dropdown_option
                            
                            
                            dropdown_option.MouseEnter:Connect(function() 
                                twn(dropdown_option, {BackgroundTransparency = 0.4})
                            end)
                            
                            dropdown_option.MouseLeave:Connect(function() 
                                twn(dropdown_option, {BackgroundTransparency = 0.7})
                            end)
                            
                            dropdown_option.MouseButton1Click:Connect(function() 
                                ceffect(dropdown_option)
                                
                                for i,v in pairs(options_buttons) do
                                    twn(v, {BackgroundColor3 = ui.colors.button, BackgroundTransparency = 0.7})
                                end
                                
                                twn(dropdown_option, {BackgroundColor3 = ui.colors.enabled, BackgroundTransparency = 0.4})
                                
                                selection = {v, i}
                                dropdown_button.Text = text .. " ("..tostring(selection[1])..")"
                                
                                OnSelection:Fire(unpack(selection))
                            end)
                            
                            if i == 1 then
                                dropdown_option.BackgroundColor3 = ui.colors.enabled
                                dropdown_option.BackgroundTransparency = 0.4
                                
                                selection = {v, i}
                            end
                            
                            table.insert(options_buttons, dropdown_option)
                        end
                        
                        
                        
                        table.insert(menu_objects, 7)
                        
                        local t = {} do
                            
                            function t:SetText(tx) 
                                if tx == nil then error("SetText failed; provided value was nil") end
                                dropdown_button.Text = tostring(tx)
                            end
                            
                            function t:GetText() 
                                return dropdown_button.Text
                            end
                            
                            function t:GetSelectedOption() 
                                return selection[1], selection[2]
                            end
                            
                            function t:GetSelection() 
                                return selection[1], selection[2]
                            end
                            
                            
                            
                            function t:SetSelectedOption(name) 
                                if (type(name) == "string") then 
                                    
                                    local occ = 0
                                    local oldsel = selection
                                    
                                    for i,v in pairs(options_buttons) do
                                        if v.Text == name then
                                            occ = occ + 1 
                                            
                                            selection = {v.Text, i}
                                        end
                                    end
                                    
                                    if occ ~= 1 then
                                        selection = oldsel
                                        if occ == 0 then 
                                            error("SetSelectedOption failed; could not find dropdown option with that name")
                                            return
                                        elseif occ > 1 then
                                            
                                            error("SetSelectedOption failed; more than one valid dropdown option")
                                            return
                                        end
                                    end
                                    
                                    oldsel = nil
                                    
                                    
                                    for i,v in pairs(options_buttons) do
                                        twn(v, {BackgroundColor3 = ui.colors.button, BackgroundTransparency = 0.7})
                                    end
                                    
                                    twn(button, {BackgroundColor3 = ui.colors.enabled, BackgroundTransparency = 0.4})
                                    
                                    dropdown_button.Text = text .. " ("..tostring(selection[1])..")"
                                    OnSelection:Fire(unpack(selection))
                                    
                                elseif (type(name) == "number") then
                                    
                                    if options_buttons[name] then 
                                        selection = {options_buttons[name].Text, name}
                                        
                                        for i,v in pairs(options_buttons) do
                                            twn(v, {BackgroundColor3 = ui.colors.button, BackgroundTransparency = 0.7})
                                        end
                                        twn(options_buttons[name], {BackgroundColor3 = ui.colors.enabled, BackgroundTransparency = 0.4})
                                        
                                        dropdown_button.Text = text .. " ("..tostring(selection[1])..")"
                                        OnSelection:Fire(unpack(selection))
                                        
                                    else
                                        
                                        error("SetSelectedOption failed; could not find dropdown option with index "..tostring(name)) 
                                    end
                                    
                                else
                                    
                                    error("SetSelectedOption failed; provided value wasn't a valid name or index of option")
                                    
                                end 
                                
                            end
                        
                            function t:Select(...) 
                                
                                return t:SetSelectedOption(...)
                                
                            end
                            
                            function t:GetOptions() 
                                return options
                                
                                
                            end
                            
                            function t:SetOptions() 
                                warn("Coming soon")
                            end
                            
                            t.OnOpen = OnOpen
                            t.OnClose = OnClose
                            t.OnSelection = OnSelection
                            t.OnToggle = OnToggle
                        end
                        
                        OnChildAdded:Fire("dropdown", t)
                        
                        return t
                    end
                    
                    function m:NewGrid() 
                        
                        
                        local g = {} do
                            
                            function g:NewToggle() 
                                
                                
                                
                            end
                        end
                        return g
                        
                    end
                end
                
                return m 
            end
            
            function w:GetMinimized() 
                return Minimized
            end
            
            function w:GetMenus() 
                return wind_menus
            end
            
            
            w.OnMinimize = OnMinimize
            
            
            
        end
        
        table.insert(ui.Windows, w)
        
        return w
        
    end
    
    function ui:Ready() 
        
        for i,v in pairs(ui.Windows) do
            local m = v:GetMenus()[1]
            m.s.Visible = true
            m.i.Visible = true
            
        end
        
        ui.OnReady:Fire()
    end
    
    function ui:NewNotification(notif_text, notif_desc, notif_timer)
        notif_text = notif_text or "Notification"
        notif_desc = notif_desc or ""
        notif_timer = notif_timer or 5
        
        ui.NotifCount = ui.NotifCount + 1
        
        local place = ui.NotifCount
        
        local sizex, sizey = 150 + (utf8.len(notif_text)*2), 100
        
        local notif_window = Instance.new("Frame")
        notif_window.BackgroundColor3 = ui.colors.window
        notif_window.BorderSizePixel = 0
        notif_window.Size = UDim2.new(0, sizex, 0, sizey)
        notif_window.Position = UDim2.new(1, (sizex+20), 1, -(sizey+20))
        notif_window.ZIndex = 53
        notif_window.Parent = screen
        
        local notif_topbar = Instance.new("Frame")
        notif_topbar.BackgroundColor3 = ui.colors.topbar
        notif_topbar.BorderSizePixel = 0
        notif_topbar.Size = UDim2.new(1, 0, 0, 30)
        notif_topbar.Position = UDim2.new(0, 0, 0, 0)
        notif_topbar.ZIndex = 54
        notif_topbar.Active = true
        notif_topbar.Parent = notif_window
        
        local notif_title = Instance.new("TextLabel")
        notif_title.Text = notif_text
        notif_title.BackgroundTransparency = 1
        notif_title.TextTransparency = 1
        notif_title.TextColor3 = ui.colors.text
        notif_title.Font = ui.Font
        notif_title.TextSize = ui.FontSize+4
        notif_title.Size = UDim2.new(1, -5, 1, 0)
        notif_title.Position = UDim2.new(0, 5, 0, 0)
        notif_title.TextXAlignment = Enum.TextXAlignment.Center
        notif_title.ZIndex = 54
        notif_title.Parent = notif_topbar
        
        local notif_desctext = Instance.new("TextLabel")
        notif_desctext.Text = notif_desc
        notif_desctext.BackgroundTransparency = 1
        notif_desctext.TextTransparency = 1
        notif_desctext.TextColor3 = ui.colors.text
        notif_desctext.Font = ui.Font
        notif_desctext.TextSize = ui.FontSize
        notif_desctext.Size = UDim2.new(1, -10, 1, -35)
        notif_desctext.Position = UDim2.new(0, 5, 0, 30)
        notif_desctext.TextXAlignment = Enum.TextXAlignment.Left
        notif_desctext.TextYAlignment = Enum.TextYAlignment.Top
        notif_desctext.ZIndex = 53
        notif_desctext.TextWrapped = true
        notif_desctext.Parent = notif_window
        
        local notif_progress = Instance.new("Frame")
        notif_progress.BackgroundColor3 = ui.colors.enabledbright
        notif_progress.BorderSizePixel = 0
        notif_progress.Size = UDim2.new(1, 0, 0, 1)
        notif_progress.Position = UDim2.new(0, 0, 1, 0)
        notif_progress.ZIndex = 54
        notif_progress.Active = false
        notif_progress.Parent = notif_topbar

        
        shadow(notif_window)
        
        local function closeNotif() 
            ui.NotifCount = ui.NotifCount - 1
            ui.OnNotifDelete:Fire()
            task.spawn(function() 
                
                
                local a = Instance.new("UIScale")
                a.Scale = 1 
                a.Parent = notif_window
                
                pcall(function() 
                    ctwn(notif_window, {Position = notif_window.Position + UDim2.new(0, 0, 0, 50)}, 1.75, "Out", "Exponential")
                    ctwn(a, {Scale = 0.25}, 1, "Out", "Linear")
                    
                    twn(notif_window, {BackgroundTransparency = 1})
                    for i,v in pairs(notif_window:GetDescendants()) do
                        pcall(function() 
                            twn(v, {BackgroundTransparency = 1})
                            twn(v, {ScrollBarImageTransparency = 1})
                        end)
                        pcall(function() 
                            twn(v, {TextTransparency = 1})
                        end)
                        pcall(function() 
                            twn(v, {ImageTransparency = 1})
                        end)
                        
                        deb:AddItem(v, 0.25)
                    end
                end)
            end)
            
            wait(0.8)
            
            notif_window:Destroy()
        end
        
        local notif = {} do
            
            function notif:Close() 
                closeNotif()
            end
            
            function notif:GetDesc() 
                return notif_desc
            end
            
            function notif:SetDesc(text) 
                if text == nil then error("SetDesc failed; provided value was nil") end
                notif_desc = tostring(text)
                notif_desctext.Text = notif_desc
            end

        end
        
        

        coroutine.resume(coroutine.create(function() 
            local con
            
            con = ui.OnNotifDelete:Connect(function() 
                place = place - 1
                twn(notif_window, {Position = UDim2.new(1, -(sizex+20), 1, -(sizey+20)-(place*130))})
            end)
            
            
            notif_window.Position = UDim2.new(1, (sizex+20), 1, -(sizey+20)-(place*130))
            twn(notif_window, {Position = UDim2.new(1, -(sizex+20), 1, -(sizey+20)-(place*130))})
            twn(notif_title, {TextTransparency = 0})
            twn(notif_desctext, {TextTransparency = 0})
            
            
            wait(0.2)
            
            local t = ctwn(notif_progress, {Size = UDim2.new(0, 0, 0, 1)}, notif_timer, "Out", "Linear")
            
            t.Completed:Connect(function() 
                closeNotif()
                con:Disconnect()
            end)
        
        end))
        
        return notif
    end
    
    function ui:NewMessagebox(msg_text, msg_desc, msg_buttons)
        msg_text = msg_text or getrand(5)
        msg_desc = msg_desc or getrand(10)
        msg_buttons = msg_buttons or {
            {
                Text = "Ok",
                Callback = function(self)
                    self:Close()
                end
            }
            
        }
        
        
        local sizex, sizey = 150 + (#msg_buttons*10), 100 + ((utf8.len(msg_desc)))
        
        local msg_window = Instance.new("Frame")
        msg_window.BackgroundColor3 = ui.colors.window
        msg_window.BorderSizePixel = 0
        msg_window.Size = UDim2.new(0, sizex, 0, sizey)
        msg_window.Position = UDim2.new(0, 20, 0, 20)
        msg_window.ZIndex = 100
        
        local msg_clip1 = msg_window:Clone()
        shadow(msg_window)
        msg_clip1.Parent = screen
        msg_clip1.BackgroundTransparency = 1
        msg_clip1.ClipsDescendants = true
        msg_clip1.Position = UDim2.new(0.5, -(sizex/2)-20, 0.5, -(sizey/2)-20)
        msg_clip1.Size = UDim2.new(0, sizex+100, 0, 0)
        msg_window.Parent = msg_clip1
        
        local msg_topbar = Instance.new("Frame")
        msg_topbar.BackgroundColor3 = ui.colors.topbar
        msg_topbar.BorderSizePixel = 0
        msg_topbar.Size = UDim2.new(1, 0, 0, 30)
        msg_topbar.Position = UDim2.new(0, 0, 0, 0)
        msg_topbar.ZIndex = 101
        msg_topbar.Active = true
        msg_topbar.Parent = msg_window
        
        local msg_title = Instance.new("TextLabel")
        msg_title.Text = msg_text
        msg_title.BackgroundTransparency = 1
        msg_title.TextTransparency = 1
        msg_title.TextColor3 = ui.colors.text
        msg_title.Font = ui.Font
        msg_title.TextSize = ui.FontSize+4
        msg_title.Size = UDim2.new(1, -60, 1, 0)
        msg_title.Position = UDim2.new(0, 5, 0, 0)
        msg_title.TextXAlignment = Enum.TextXAlignment.Left
        msg_title.ZIndex = 102
        msg_title.Parent = msg_topbar
        
        local msg_desc2 = Instance.new("TextLabel")
        msg_desc2.Text = msg_desc
        msg_desc2.BackgroundTransparency = 1
        msg_desc2.TextTransparency = 1
        msg_desc2.TextColor3 = ui.colors.text
        msg_desc2.Font = ui.Font
        msg_desc2.TextSize = ui.FontSize
        msg_desc2.Size = UDim2.new(1, -10, 1, -65)
        msg_desc2.Position = UDim2.new(0, 5, 0, 30)
        msg_desc2.TextXAlignment = Enum.TextXAlignment.Left
        msg_desc2.TextYAlignment = Enum.TextYAlignment.Top
        msg_desc2.ZIndex = 101
        msg_desc2.TextWrapped = true
        msg_desc2.Parent = msg_window
        
        local msg_clip2 = Instance.new("Frame")
        msg_clip2.Visible = true
        msg_clip2.ClipsDescendants = true
        msg_clip2.Position = UDim2.new(0, 0, 0, 0)
        msg_clip2.Size = UDim2.new(1, 0, 0, 0)
        msg_clip2.BackgroundTransparency = 1
        msg_clip2.ZIndex = 102
        msg_clip2.Parent = msg_topbar
        
        local msg_bclose = Instance.new("TextButton")
        msg_bclose.Text = "X"
        msg_bclose.ClipsDescendants = true
        msg_bclose.AutoButtonColor = false
        msg_bclose.BackgroundColor3 = ui.colors.button
        msg_bclose.BackgroundTransparency = 1
        msg_bclose.BorderSizePixel = 0
        msg_bclose.TextColor3 = ui.colors.text
        msg_bclose.Font = ui.Font
        msg_bclose.TextSize = ui.FontSize+4
        msg_bclose.Size = UDim2.new(0, 30-4, 0, 30-4)
        msg_bclose.Position = UDim2.new(1, -30+2, 0, 2)
        msg_bclose.ZIndex = 102
        msg_bclose.Parent = msg_clip2
        
        round(msg_bclose)
        
        
        
        local function closeMsg() 
            task.spawn(function() 
                
                
                local a = Instance.new("UIScale")
                a.Scale = 1 
                a.Parent = msg_window
                
                ctwn(msg_window, {Position = msg_window.Position + UDim2.new(0, 0, 0, 50)}, 1.75, "Out", "Exponential")
                ctwn(a, {Scale = 0.25}, 1, "Out", "Linear")
                
                
                twn(msg_window, {BackgroundTransparency = 1})
                for i,v in pairs(msg_window:GetDescendants()) do
                    pcall(function() 
                        twn(v, {BackgroundTransparency = 1})
                        twn(v, {ScrollBarImageTransparency = 1})
                    end)
                    pcall(function() 
                        twn(v, {TextTransparency = 1})
                    end)
                    pcall(function() 
                        twn(v, {ImageTransparency = 1})
                    end)
                    
                    deb:AddItem(v, 0.25)
                end
            end)
            
            wait(0.8)
            
            msg_window:Destroy()
        end
        
        local msg = {} do
            
            function msg:Close() 
                closeMsg()
            end
            
            function msg:GetTitle() 
                return msg_text
            end
            
            function msg:GetDesc() 
                return msg_desc 
            end
            
            function msg:SetTitle(text)
                msg_text = text
                msg_title.Text = msg_text
            end
            
            function msg:SetDesc(desc)
                msg_desc = desc
                msg_desc2.Text = msg_desc
            end
        
        end
        
        
        
        msg_bclose.MouseEnter:Connect(function() 
            twn(msg_bclose, {BackgroundTransparency = 0.4})
        end)
        msg_bclose.MouseLeave:Connect(function() 
            twn(msg_bclose, {BackgroundTransparency = 1})
        end)
        
        
        
        
        msg_bclose.MouseButton1Click:Connect(function() 
            ceffect(msg_bclose)
            closeMsg()
        end)
        
        for i,v in pairs(msg_buttons) do
            local cb = v["Callback"] or (function() end)
            
            
            local msg_bv = Instance.new("TextButton")
            msg_bv.Text = v["Text"] or getrand(3)
            msg_bv.ClipsDescendants = true
            msg_bv.AutoButtonColor = false
            msg_bv.BackgroundColor3 = ui.colors.button
            msg_bv.BackgroundTransparency = 1
            msg_bv.BorderSizePixel = 0
            msg_bv.TextColor3 = ui.colors.text
            msg_bv.Font = ui.Font
            msg_bv.TextSize = ui.FontSize
            msg_bv.Size = UDim2.new(0, (msg_window.AbsoluteSize.X/#msg_buttons-4)-5, 0, 30-4)
            msg_bv.Position = UDim2.new(0, ((msg_window.AbsoluteSize.X/#msg_buttons)*(i-1))+5, 1, -32)
            msg_bv.TextTransparency = 1
            msg_bv.ZIndex = 102
            msg_bv.Parent = msg_window
            
            round(msg_bv)
            
            
            msg_bv.MouseEnter:Connect(function() 
                twn(msg_bv, {BackgroundTransparency = 0.4})
            end)
            msg_bv.MouseLeave:Connect(function() 
                twn(msg_bv, {BackgroundTransparency = 1})
            end)
            
            
            msg_bv.MouseButton1Click:Connect(function() 
                ceffect(msg_bv)
                
                cb(msg, v["Text"], v)
            end)
            
            task.delay(0.25, function() 
                ctwn(msg_bv, {TextTransparency = 0}, 1)
            end)
        end
        
        
        task.spawn(function()
            msg_window.Size = UDim2.new(0, sizex, 0, 0)
            msg_window.Position = UDim2.new(0, 20, 0, 20)
            
            
            ctwn(msg_clip1, {Size = UDim2.new(0, sizex+100, 0, sizey+100)}, 0.75, "InOut", "Exponential")
            ctwn(msg_window, {Size = UDim2.new(0, sizex, 0, sizey)}, 0.75, "InOut", "Exponential")
            wait(0.25)
            
            ctwn(msg_clip2, {Size = UDim2.new(1, 0, 1, 0)}, 2, "Out", "Exponential")
            ctwn(msg_title, {TextTransparency = 0, Size = UDim2.new(1, -50, 1, 0), Position = UDim2.new(0, 5, 0, 0)}, 0.75, "Out")
            ctwn(msg_desc2, {TextTransparency = 0}, 0.75, "InOut")
            wait(0.75)
            
            msg_bclose.Parent = msg_topbar
            msg_window.Parent = screen
            
            msg_window.Position = UDim2.new(0.5, -(sizex/2), 0.5, -(sizey/2))
            msg_clip2:Destroy()
            msg_clip1:Destroy()
            rdrag(msg_topbar, msg_window)
        
        end)
        
        
        return msg
        
    end
    
    function ui:NewBindDialog(bd_name, bd_func, bd_id, bd_word, bd_display)
        
        bd_name = bd_name or "Test"
        bd_func = bd_func or function() end
        bd_buttons = {
            {
                Text = "Ok",
                Callback = function(self)
                    self:SetBind(self:GetBind())
                    self:Close()
                end
                
            },
            {
                Text = "Cancel",
                Callback = function(self) 
                    self:Close()
                end
            }
        }
        
        local hotkey_connection
        local new_bind
        
        
        local sizex, sizey = 350, 150
        
        local bd_window = Instance.new("Frame")
        bd_window.BackgroundColor3 = ui.colors.window
        bd_window.BorderSizePixel = 0
        bd_window.Size = UDim2.new(0, sizex, 0, sizey)
        bd_window.Position = UDim2.new(0, 20, 0, 20)
        bd_window.ZIndex = 60
        
        local bd_clip1 = bd_window:Clone()
        shadow(bd_window)
        bd_clip1.Parent = screen
        bd_clip1.BackgroundTransparency = 1
        bd_clip1.ClipsDescendants = true
        bd_clip1.Position = UDim2.new(0.5, -(sizex/2)-20, 0.5, -(sizey/2)-20)
        bd_clip1.Size = UDim2.new(0, sizex+100, 0, 0)
        bd_window.Parent = bd_clip1
        
        local bd_topbar = Instance.new("Frame")
        bd_topbar.BackgroundColor3 = ui.colors.topbar
        bd_topbar.BorderSizePixel = 0
        bd_topbar.Size = UDim2.new(1, 0, 0, 30)
        bd_topbar.Position = UDim2.new(0, 0, 0, 0)
        bd_topbar.ZIndex = 61
        bd_topbar.Active = true
        bd_topbar.Parent = bd_window
        
        local bd_title = Instance.new("TextLabel")
        bd_title.Text = "Bind menu: "..bd_name
        bd_title.BackgroundTransparency = 1
        bd_title.TextTransparency = 1
        bd_title.TextColor3 = ui.colors.text
        bd_title.Font = ui.Font
        bd_title.TextSize = ui.FontSize+4
        bd_title.Size = UDim2.new(1, -60, 1, 0)
        bd_title.Position = UDim2.new(0, 5, 0, 0)
        bd_title.TextXAlignment = Enum.TextXAlignment.Left
        bd_title.ZIndex = 61
        bd_title.Parent = bd_topbar
        
        local bd_desc = Instance.new("TextLabel")
        bd_desc.Text = "Binding action for "..bd_name..";\npress any key..."
        bd_desc.BackgroundTransparency = 1
        bd_desc.TextTransparency = 1
        bd_desc.TextColor3 = ui.colors.text
        bd_desc.Font = ui.Font
        bd_desc.TextSize = ui.FontSize
        bd_desc.Size = UDim2.new(1, -10, 1, -80)
        bd_desc.Position = UDim2.new(0, 5, 0, 32)
        bd_desc.TextXAlignment = Enum.TextXAlignment.Center
        bd_desc.TextYAlignment = Enum.TextYAlignment.Top
        bd_desc.ZIndex = 60
        bd_desc.TextWrapped = true
        bd_desc.Parent = bd_window
        
        local bd_bindentry = Instance.new("TextButton")
        bd_bindentry.Active = true
        bd_bindentry.Text = "..."
        bd_bindentry.ClipsDescendants = true
        bd_bindentry.AutoButtonColor = false
        bd_bindentry.TextColor3 = ui.colors.text
        bd_bindentry.BackgroundTransparency = 0.7
        bd_bindentry.BackgroundColor3 = ui.colors.button
        bd_bindentry.Size = UDim2.new(0, bd_window.AbsoluteSize.X-30, 0, 24)
        bd_bindentry.Position = UDim2.new(0, 15, 0.6, 0)
        bd_bindentry.ZIndex = 60
        bd_bindentry.Font = ui.Font
        bd_bindentry.TextXAlignment = Enum.TextXAlignment.Left
        bd_bindentry.TextSize = ui.FontSize
        bd_bindentry.Parent = bd_window
        round(bd_bindentry)
        
        local bd_bindentry_icon = Instance.new("ImageLabel")
        bd_bindentry_icon.Active = false
        bd_bindentry_icon.BackgroundTransparency = 1
        bd_bindentry_icon.Image = "rbxassetid://7467053157"
        bd_bindentry_icon.ImageColor3 = ui.colors.text
        bd_bindentry_icon.Position = UDim2.new(1, -30, 0, -5)
        bd_bindentry_icon.Size = UDim2.new(0, 34, 0, 34)
        bd_bindentry_icon.Rotation = 0
        bd_bindentry_icon.ZIndex = 60
        bd_bindentry_icon.Parent = bd_bindentry
        
        
        local bd_bindentry_pad = Instance.new("UIPadding")
        bd_bindentry_pad.PaddingLeft = UDim.new(0, 10)
        bd_bindentry_pad.Parent = bd_bindentry
        
        
        bd_bindentry.MouseEnter:Connect(function() 
            twn(bd_bindentry, {BackgroundTransparency = 0.4})
        end)
        
        bd_bindentry.MouseLeave:Connect(function() 
            twn(bd_bindentry, {BackgroundTransparency = 0.7})
        end)
        
        local bd_clip2 = Instance.new("Frame")
        bd_clip2.Visible = true
        bd_clip2.ClipsDescendants = true
        bd_clip2.Position = UDim2.new(0, 0, 0, 0)
        bd_clip2.Size = UDim2.new(1, 0, 0, 0)
        bd_clip2.BackgroundTransparency = 1
        bd_clip2.ZIndex = 102
        bd_clip2.Parent = bd_topbar
        
        local bd_bclose = Instance.new("TextButton")
        bd_bclose.Text = "X"
        bd_bclose.ClipsDescendants = true
        bd_bclose.AutoButtonColor = false
        bd_bclose.BackgroundColor3 = ui.colors.button
        bd_bclose.BackgroundTransparency = 1
        bd_bclose.BorderSizePixel = 0
        bd_bclose.TextColor3 = ui.colors.text
        bd_bclose.Font = ui.Font
        bd_bclose.TextSize = ui.FontSize+4
        bd_bclose.Size = UDim2.new(0, 30-4, 0, 30-4)
        bd_bclose.Position = UDim2.new(1, -30+2, 0, 2)
        bd_bclose.ZIndex = 61
        bd_bclose.Parent = bd_clip2
        
        round(bd_bclose)
        
        
        
        local function closeBindDialog() 
            pcall(function() 
                hotkey_connection:Disconnect()
            end)
            task.spawn(function() 
                
                
                local a = Instance.new("UIScale")
                a.Scale = 1 
                a.Parent = bd_window
                
                ctwn(bd_window, {Position = bd_window.Position + UDim2.new(0, 0, 0, 50)}, 1.75, "Out", "Exponential")
                ctwn(a, {Scale = 0.25}, 1, "Out", "Linear")
                
                
                twn(bd_window, {BackgroundTransparency = 1})
                for i,v in pairs(bd_window:GetDescendants()) do
                    pcall(function() 
                        twn(v, {BackgroundTransparency = 1})
                        twn(v, {ScrollBarImageTransparency = 1})
                    end)
                    pcall(function() 
                        twn(v, {TextTransparency = 1})
                    end)
                    pcall(function() 
                        twn(v, {ImageTransparency = 1})
                    end)
                    
                    deb:AddItem(v, 0.25)
                end
            end)
            
            wait(0.8)
            
            bd_window:Destroy()
        end
        
        local function capture() 
            twn(bd_bindentry, {BackgroundColor3 = ui.colors.enabled})
            bd_desc.Text = "Binding action for "..bd_name..";\npress any key..."
            bd_bindentry.Text = "..."
            
            task.wait(0.02)
            hotkey_connection = uis.InputBegan:Connect(function(io) 
                if io.KeyCode == Enum.KeyCode.Unknown then
                    twn(bd_bindentry, {BackgroundColor3 = ui.colors.button})
                    hotkey_connection:Disconnect()
                    
                    
                    new_bind = nil
                    bd_bindentry.Text = "None"
                    
                    
                    bd_desc.Text = "Unbound "..bd_name
                else
                    twn(bd_bindentry, {BackgroundColor3 = ui.colors.button})
                    hotkey_connection:Disconnect()
                    
                    
                    new_bind = io.KeyCode
                    bd_bindentry.Text = new_bind.Name
                    
                    
                    bd_desc.Text = "Bound "..new_bind.Name.." to "..bd_name..""
                end
                
            end)
        end
        
        capture()
        
        
        bd_bindentry.MouseButton1Click:Connect(function() 
            ceffect(bd_bindentry)
            
            capture()
        end)
        
        local bd = {} do
            
            function bd:Close() 
                closeBindDialog()
            end
            
            function bd:Capture() 
                capture()
            end
            
            function bd:SetBind(bind) 
                if bind == nil then
                    for i,v in pairs(ui.binds) do
                        if i == bd_id then
                            ui.binds[i] = nil
                            bd_display.Text = ""
                        end
                    end
                else
                    ui.binds[bd_id] = {
                        b = bind.Name,
                        f = bd_func,
                        n = bd_name,
                        w = bd_word
                    }
                    
                    bd_display.Text = bind.Name
                end
            end
            
            function bd:GetBind() 
                return new_bind
            end
        
        end
        
        
        
        bd_bclose.MouseEnter:Connect(function() 
            twn(bd_bclose, {BackgroundTransparency = 0.4})
        end)
        bd_bclose.MouseLeave:Connect(function() 
            twn(bd_bclose, {BackgroundTransparency = 1})
        end)
        
        
        
        
        bd_bclose.MouseButton1Click:Connect(function() 
            ceffect(bd_bclose)
            closeBindDialog()
        end)
        
        for i,v in pairs(bd_buttons) do
            local cb = v["Callback"] or (function() end)
            
            
            local bd_bv = Instance.new("TextButton")
            bd_bv.Text = v["Text"] or getrand(3)
            bd_bv.ClipsDescendants = true
            bd_bv.AutoButtonColor = false
            bd_bv.BackgroundColor3 = ui.colors.button
            bd_bv.BackgroundTransparency = 1
            bd_bv.BorderSizePixel = 0
            bd_bv.TextColor3 = ui.colors.text
            bd_bv.Font = ui.Font
            bd_bv.TextSize = ui.FontSize
            bd_bv.Size = UDim2.new(0, (bd_window.AbsoluteSize.X/#bd_buttons-4)-5, 0, 30-4)
            bd_bv.Position = UDim2.new(0, ((bd_window.AbsoluteSize.X/#bd_buttons)*(i-1))+5, 1, -32)
            bd_bv.TextTransparency = 1
            bd_bv.ZIndex = 102
            bd_bv.Parent = bd_window
            
            round(bd_bv)
            
            
            bd_bv.MouseEnter:Connect(function() 
                twn(bd_bv, {BackgroundTransparency = 0.4})
            end)
            bd_bv.MouseLeave:Connect(function() 
                twn(bd_bv, {BackgroundTransparency = 1})
            end)
            
            
            bd_bv.MouseButton1Click:Connect(function() 
                ceffect(bd_bv)
                
                cb(bd, v["Text"], v)
            end)
            
            task.delay(0.25, function() 
                ctwn(bd_bv, {TextTransparency = 0}, 1)
            end)
        end
        
        
        task.spawn(function()
            bd_window.Size = UDim2.new(0, sizex, 0, 0)
            bd_window.Position = UDim2.new(0, 20, 0, 20)
            
            
            ctwn(bd_clip1, {Size = UDim2.new(0, sizex+100, 0, sizey+100)}, 0.5, "InOut", "Exponential")
            ctwn(bd_window, {Size = UDim2.new(0, sizex, 0, sizey)}, 0.5, "InOut", "Exponential")
            wait(0.1)
            
            ctwn(bd_clip2, {Size = UDim2.new(1, 0, 1, 0)}, 1, "Out", "Exponential")
            ctwn(bd_title, {TextTransparency = 0, Size = UDim2.new(1, -50, 1, 0), Position = UDim2.new(0, 5, 0, 0)}, 0.5, "Out")
            ctwn(bd_desc, {TextTransparency = 0}, 0.5, "InOut")
            wait(0.25)
            
            bd_bclose.Parent = bd_topbar
            bd_window.Parent = screen
            
            bd_window.Position = UDim2.new(0.5, -(sizex/2), 0.5, -(sizey/2))
            bd_clip2:Destroy()
            bd_clip1:Destroy()
            rdrag(bd_topbar, bd_window)
        
        end)
        
        
        return bd
        
    end
    
end


return ui
