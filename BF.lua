_G.Setting = {
    Kaiton = false  ,    
    Farm = false  ,     
    FarmSelectMon = false  ,
    FastAttackToggle = false  ,
    SelectToolWeapon = nil  ,
    SelectToolWeaponMisc = nil  ,
    FastFarm = false    ,

    Abilities = false   ,
    DoughBoss = false  ,  
    Bone = false  ,  
    NewWorld = false  ,
    ThirdWorld = false  ,
    LegendarySword  = false  ,
    Bartilo = false  ,    
    Swan = false  ,  

    Melee = false  , 
    Defense = false  , 
    Sword = false  ,  
    Gun = false  , 
    DevilFruit = false  ,
    StatKaiton = false  , 

    BypassTeleport = false  ,  

    KillAura = false  ,  
    KillAuraAll = false  ,   
    NextIsland = false  ,  
    BuyRaid = false  ,   
    AwakeFruit = false  ,  

    BringFruit = false  ,    
    FpsBoost = false  ,   
    Magnet_200 = false  , 
    Noclip = false  ,  
    DamageCounter = true  ,  
    WhiteScreen = false  ,  
    Surprise = false  ,

    Quest = true     ,
    SetHome = true     ,
    FastAttack = true     ,
    Magnet = true     ,
    Rejoin = true     ,
    AFK = true     ,
    Haki = true     ,
    DamageCounter = true
}
if _G.Setting == nil then
    error("Setting Error")
end

repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players
repeat wait() until game
repeat wait()
	if game.Players.LocalPlayer.Team == nil and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Visible == true then
		if _G.SelectTeam == "Pirate" then
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.BackgroundTransparency = 1
			wait(.5)
			game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, true, game, 1)
			game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, false, game, 1)
		elseif _G.SelectTeam == "Marine" then
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.BackgroundTransparency = 1
			wait(.5)
			game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, true, game, 1)
			game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, false, game, 1)
		else
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
			game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.BackgroundTransparency = 1
			wait(.5)
			game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, true, game, 1)
			game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, false, game, 1)
		end
	end
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()

OldWorld = false
NewWorld = false
ThreeWorld = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
	ThreeWorld = true
end

do local gui = game:GetService("CoreGui"):FindFirstChild("HovxrzGui") 
    if gui then 
        gui:Destroy()
        game.Players.LocalPlayer:kick("Bro????????????")
    end 
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local library = {toggledui = false;}
game:GetService("UserInputService").InputBegan:Connect(function(input)
    pcall(function()
        if input.KeyCode == Enum.KeyCode.RightControl then
            if library.toggledui == false then
                library.toggledui = true
                wait(.1)
                HovxrzGui.Enabled = false
            else
                library.toggledui = false
                wait(.1)
                HovxrzGui.Enabled = true
            end
        end
    end)
end)

function library:CreateWindow(text,maincolor,text2,logo)
    logo = logo or 0
    maincolor = maincolor or Color3.fromRGB(63,233,233)
    local isselected = false

    HovxrzGui = Instance.new("ScreenGui")
    HovxrzGui.Name = "HovxrzGui"
    HovxrzGui.Parent = game:GetService("CoreGui")
    HovxrzGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    HovxrzGui.Enabled = Enum.KeyCode.RightControl

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = HovxrzGui
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.BorderColor3 = Color3.fromRGB(25, 25, 25)
    Main.Position = UDim2.new(0.5, 0,0.499, 0)
    -- Main.Size = UDim2.new(0, 375, 0, 460)
    Main.AnchorPoint = Vector2.new(0.5,0.5)

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Top.BorderSizePixel = 0
    -- Top.Size = UDim2.new(0, 375, 0, 20)
    Top.ClipsDescendants = true
    
    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0, 25, 0, 0)
    NameHub.Size = UDim2.new(0, 50, 0, 20)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = string.upper(text)
    NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
    NameHub.TextSize = 15.000
    
    local Hub = Instance.new("TextLabel")
    Hub.Name = "Hub"
    Hub.Parent = Top
    Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hub.BackgroundTransparency = 1.000
    Hub.Position = UDim2.new(0, 75, 0, 0)
    Hub.Size = UDim2.new(0, 60, 0, 20)
    Hub.Font = Enum.Font.GothamSemibold
    Hub.Text = "HUB"
    Hub.TextColor3 = maincolor
    Hub.TextSize = 15.000
    Hub.TextXAlignment = Enum.TextXAlignment.Left
    
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = Top
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0, 5, 0, 0)
    Logo.Size = UDim2.new(0, 20, 0, 20)
    Logo.Image = "rbxassetid://"..tostring(logo)

    local Barrier = Instance.new("Frame")
    Barrier.Name = "Barrier"
    Barrier.Parent = Top
    Barrier.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    Barrier.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Barrier.BorderSizePixel = 0
    Barrier.Position = UDim2.new(0, 115, 0, 3)
    Barrier.Size = UDim2.new(0, 2, 0, 14)

    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Parent = Top
    Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description.BackgroundTransparency = 1.000
    Description.Position = UDim2.new(0, 125, 0, 0)
    Description.Size = UDim2.new(0, 250, 0, 20)
    Description.Font = Enum.Font.GothamSemibold
    Description.Text = text2
    Description.TextColor3 = Color3.fromRGB(225, 225, 225)
    Description.TextSize = 15.000
    Description.TextXAlignment = Enum.TextXAlignment.Left

    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Tab.BorderSizePixel = 0
    Tab.Position = UDim2.new(0, 5, 0, 25)
    Tab.Size = UDim2.new(0, 365, 0, 25)

    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.BorderSizePixel = 0
    ScrollTab.Size = UDim2.new(0, 365, 0, 25)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Name = "TabListLayout"
    TabListLayout.Parent = ScrollTab
    TabListLayout.FillDirection = Enum.FillDirection.Horizontal
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Page.BorderSizePixel = 0
    Page.Position = UDim2.new(0.0133333337, 0, 0.130434781, 0)
    Page.Size = UDim2.new(0, 365, 0, 395)

    local pagesFolder = Instance.new("Folder")
    pagesFolder.Name = "pagesFolder"
    pagesFolder.Parent = Page

    MakeDraggable(Top,Main)
    
    Main.BackgroundTransparency = 1
    Tab.Visible = false
    Page.Visible = false
    Main.Size = UDim2.new(0,375,0,0)
    Top.Size = UDim2.new(0,0,0,20)
    TweenService:Create(
        Top,
        TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 375, 0, 20)}
    ):Play()
    repeat wait() until Top.Size == UDim2.new(0, 375, 0, 20)
    Main.BackgroundTransparency = 0
    TweenService:Create(
        Main,
        TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 375, 0, 460)}
    ):Play()
    repeat wait() until Main.Size == UDim2.new(0, 375, 0, 460)
    Tab.Visible = true
    Page.Visible = true

    local uitab = {}
    function uitab:AddTab(text)
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = ScrollTab
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 80, 0, 25)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = text
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 14.000
        TabButton.TextTransparency = 0.5

        local MainPage = Instance.new("Frame")
        MainPage.Name = "MainPage"
        MainPage.Parent = pagesFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Size = UDim2.new(0, 365, 0, 395)
        MainPage.Visible = false

        local MainFramePage = Instance.new("ScrollingFrame")
        MainFramePage.Name = "MainFramePage"
        MainFramePage.Parent = MainPage
        MainFramePage.Active = true
        MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFramePage.BackgroundTransparency = 1.000
        MainFramePage.BorderSizePixel = 0
        MainFramePage.Size = UDim2.new(0, 365, 0, 395)
        MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainFramePage.ScrollBarThickness = 0

        local PageListLayout = Instance.new("UIListLayout")
        PageListLayout.Name = "PageListLayout"
        PageListLayout.Padding = UDim.new(0, 15)
        PageListLayout.Parent = MainFramePage
        PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = MainFramePage
        PagePadding.PaddingLeft = UDim.new(0,15)
        PagePadding.PaddingTop = UDim.new(0,15)

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next,pagesFolder:GetChildren() do
                if v.Name == "MainPage" then
                    v.Visible = false
                end
                MainPage.Visible = true
            end
            for i,v in next,ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
        end)

        if isselected == false then
            for i,v in next,pagesFolder:GetChildren() do
                if v.Name == "MainPage" then
                    v.Visible = false
                end
                MainPage.Visible = true
            end
            for i,v in next,ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            isselected = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            ScrollTab.CanvasSize = UDim2.new(0, TabListLayout.AbsoluteContentSize.X + 10, 0, 0)
            MainFramePage.CanvasSize = UDim2.new(0, 0, 0, PageListLayout.AbsoluteContentSize.Y + 30)
        end)

        local main = {}
        function main:AddButton(text,callback)
            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Name = "ButtonFrame"
            ButtonFrame.Parent = MainFramePage
            ButtonFrame.BackgroundColor3 = maincolor
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Size = UDim2.new(0, 335, 0, 30)
            
            local UICorner = Instance.new("UICorner")
            UICorner.Parent = ButtonFrame
            UICorner.CornerRadius = UDim.new(0,5)
            
            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Parent = ButtonFrame
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 1, 0, 1)
            Button.Size = UDim2.new(0, 333, 0, 28)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.GothamSemibold
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(225, 225, 225)
            Button.TextSize = 14.000

            local UICorner_2 = Instance.new("UICorner")
            UICorner_2.Parent = Button
            UICorner_2.CornerRadius = UDim.new(0,5)
            
            local Black = Instance.new("Frame")
            Black.Name = "Black"
            Black.Parent = Button
            Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Black.BackgroundTransparency = 1.000
            Black.Size = UDim2.new(0, 335, 0, 28)

            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = maincolor}
                ):Play()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.7}
                ):Play()
            end)

            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
            end)

            Button.MouseButton1Click:Connect(function()
                callback()
                Button.TextSize = 0
				TweenService:Create(
					Button,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{TextSize = 14}
				):Play()
            end)
        end

        function main:AddToggle(text,config,callback)
            config = config or false
            local istoggled = config

            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = MainFramePage
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleFrame.BackgroundTransparency = 1.000
            ToggleFrame.Size = UDim2.new(0, 335, 0, 25)

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleFrame
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.BackgroundTransparency = 1.000
            ToggleButton.Size = UDim2.new(0, 335, 0, 25)
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.TextSize = 14.000

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "ToggleLabel"
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.BackgroundTransparency = 1.000
            ToggleLabel.Position = UDim2.new(0.0447761193, 0, 0, 0)
            ToggleLabel.Size = UDim2.new(0, 276, 0, 25)
            ToggleLabel.Font = Enum.Font.GothamSemibold
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            ToggleLabel.TextSize = 15.000
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

            local ToggleImage = Instance.new("Frame")
            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = ToggleFrame
            ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            ToggleImage.Position = UDim2.new(0, 290, 0, 1)
            ToggleImage.Size = UDim2.new(0, 46, 0, 21)

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 10)
            UICorner.Parent = ToggleImage

            local Circle = Instance.new("Frame")
            Circle.Name = "Circle"
            Circle.Parent = ToggleImage
            Circle.BackgroundColor3 = Color3.fromRGB(233, 63, 63)
            Circle.Position = UDim2.new(0, 2, 0, 1)
            Circle.Size = UDim2.new(0, 19, 0, 19)

            local UICorner_2 = Instance.new("UICorner")
            UICorner_2.CornerRadius = UDim.new(0, 10)
            UICorner_2.Parent = Circle

            ToggleButton.MouseButton1Click:Connect(function()
                if istoggled == false then
                    istoggled = true
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Position = UDim2.new(0, 24, 0, 1)}
                    ):Play()
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = maincolor}
                    ):Play()
                else
                    istoggled = false
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Position = UDim2.new(0, 2, 0, 1)}
                    ):Play()
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(233, 63, 63)}
                    ):Play()
                end
                pcall(callback,istoggled)
            end)

            if config == true then
                if istoggled == false then
                    istoggled = true
                end
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, 24, 0, 1)}
                ):Play()
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundColor3 = maincolor}
                ):Play()
                pcall(callback,istoggled)
            end
		end

        function main:AddDropdown(text,option,callback)
			local isdropping = false
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropTitle = Instance.new("TextLabel")
			local DropScroll = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local DropButton = Instance.new("TextButton")
			local DropImage = Instance.new("ImageLabel")
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = MainFramePage
			Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(0, 335, 0, 30)
			
			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Dropdown
			
			DropTitle.Name = "DropTitle"
			DropTitle.Parent = Dropdown
			DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropTitle.BackgroundTransparency = 1.000
			DropTitle.Size = UDim2.new(0, 335, 0, 30)
			DropTitle.Font = Enum.Font.GothamSemibold
			DropTitle.Text = text.. " : "
			DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
			DropTitle.TextSize = 15.000
            DropTitle.TextXAlignment = Enum.TextXAlignment.Left

            local UIPaddingHAHA = Instance.new("UIPadding")
            UIPaddingHAHA.Parent = DropTitle
            UIPaddingHAHA.Name = "UIPaddingHAHA"
            UIPaddingHAHA.PaddingLeft = UDim.new(0,15)
			
			DropScroll.Name = "DropScroll"
			DropScroll.Parent = Dropdown
			DropScroll.Active = true
			DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropScroll.BackgroundTransparency = 1.000
			DropScroll.BorderSizePixel = 0
			DropScroll.Position = UDim2.new(0, 0, 0, 31)
			DropScroll.Size = UDim2.new(0, 335, 0, 70)
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropScroll.ScrollBarThickness = 3
			
			UIListLayout.Parent = DropScroll
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			UIPadding.Parent = DropScroll
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)
			
			DropImage.Name = "DropImage"
			DropImage.Parent = Dropdown
			DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImage.BackgroundTransparency = 1.000
			DropImage.Position = UDim2.new(0, 305, 0, 5)
			DropImage.Rotation = 180.000
			DropImage.Size = UDim2.new(0, 20, 0, 20)
			DropImage.Image = "rbxassetid://6031090990"
			
			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown
			DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropButton.BackgroundTransparency = 1.000
			DropButton.Size = UDim2.new(0, 335, 0, 30)
			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14.000

			for i,v in next,option do
				local Item = Instance.new("TextButton")

				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 335, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(v)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end

			DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

			DropButton.MouseButton1Click:Connect(function()
				if isdropping == false then
					isdropping = true
					Dropdown:TweenSize(UDim2.new(0,335,0,100),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
				else
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
				end
			end)

			local dropfunc = {}
			function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 335, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end
			function dropfunc:Clear()
				DropTitle.Text = tostring(text).." : "
				isdropping = false
				Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
				TweenService:Create(
					DropImage,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = 180}
				):Play()
				for i,v in next, DropScroll:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			return dropfunc
		end
        function main:AddSlider(text,min,max,set,callback)
			local Slider = Instance.new("Frame")
			local slidercorner = Instance.new("UICorner")
			local sliderr = Instance.new("Frame")
			local sliderrcorner = Instance.new("UICorner")
			local SliderLabel = Instance.new("TextLabel")
			local HAHA = Instance.new("Frame")
			local AHEHE = Instance.new("TextButton")
			local bar = Instance.new("Frame")
			local bar1 = Instance.new("Frame")
			local bar1corner = Instance.new("UICorner")
			local barcorner = Instance.new("UICorner")
			local circlebar = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local slidervalue = Instance.new("Frame")
			local valuecorner = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = MainFramePage
			Slider.BackgroundColor3 = maincolor
			Slider.BackgroundTransparency = 0
			Slider.Size = UDim2.new(0, 335, 0, 51)

			slidercorner.CornerRadius = UDim.new(0, 5)
			slidercorner.Name = "slidercorner"
			slidercorner.Parent = Slider

			sliderr.Name = "sliderr"
			sliderr.Parent = Slider
			sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			sliderr.Position = UDim2.new(0, 1, 0, 1)
			sliderr.Size = UDim2.new(0, 333, 0, 49)

			sliderrcorner.CornerRadius = UDim.new(0, 5)
			sliderrcorner.Name = "sliderrcorner"
			sliderrcorner.Parent = sliderr

			SliderLabel.Name = "SliderLabel"
			SliderLabel.Parent = sliderr
			SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderLabel.BackgroundTransparency = 1.000
			SliderLabel.Position = UDim2.new(0, 15, 0, 0)
			SliderLabel.Size = UDim2.new(0, 180, 0, 26)
			SliderLabel.Font = Enum.Font.GothamSemibold
			SliderLabel.Text = text
			SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			SliderLabel.TextSize = 16.000
			SliderLabel.TextTransparency = 0
			SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

			HAHA.Name = "HAHA"
			HAHA.Parent = sliderr
			HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HAHA.BackgroundTransparency = 1.000
			HAHA.Size = UDim2.new(0, 333, 0, 29)

			AHEHE.Name = "AHEHE"
			AHEHE.Parent = sliderr
			AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			AHEHE.BackgroundTransparency = 1.000
			AHEHE.Position = UDim2.new(0, 10, 0, 35)
			AHEHE.Size = UDim2.new(0, 313, 0, 5)
			AHEHE.Font = Enum.Font.SourceSans
			AHEHE.Text = ""
			AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
			AHEHE.TextSize = 14.000

			bar.Name = "bar"
			bar.Parent = AHEHE
			bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			bar.Size = UDim2.new(0, 313, 0, 5)

			bar1.Name = "bar1"
			bar1.Parent = bar
			bar1.BackgroundColor3 = maincolor
			bar1.BackgroundTransparency = 0
			bar1.Size = UDim2.new(set/max, 0, 0, 5)

			bar1corner.CornerRadius = UDim.new(0, 5)
			bar1corner.Name = "bar1corner"
			bar1corner.Parent = bar1

			barcorner.CornerRadius = UDim.new(0, 5)
			barcorner.Name = "barcorner"
			barcorner.Parent = bar

			circlebar.Name = "circlebar"
			circlebar.Parent = bar1
			circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
			circlebar.Position = UDim2.new(1, -2, 0, -3)
			circlebar.Size = UDim2.new(0, 10, 0, 10)

			UICorner.CornerRadius = UDim.new(0, 100)
			UICorner.Parent = circlebar

			slidervalue.Name = "slidervalue"
			slidervalue.Parent = sliderr
			slidervalue.BackgroundColor3 = maincolor
			slidervalue.BackgroundTransparency = 0
			slidervalue.Position = UDim2.new(0, 265, 0, 5)
			slidervalue.Size = UDim2.new(0, 65, 0, 18)

			valuecorner.CornerRadius = UDim.new(0, 5)
			valuecorner.Name = "valuecorner"
			valuecorner.Parent = slidervalue

			TextBox.Parent = slidervalue
			TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TextBox.Position = UDim2.new(0, 1, 0, 1)
			TextBox.Size = UDim2.new(0, 63, 0, 16)
			TextBox.Font = Enum.Font.GothamSemibold
			TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextBox.TextSize = 9.000
			TextBox.Text = set
			TextBox.TextTransparency = 0

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = TextBox

			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")

			if Value == nil then
				Value = set
				pcall(function()
					callback(Value)
				end)
			end
			
			AHEHE.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
				pcall(function()
					callback(Value)
				end)
				bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
				circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
				moveconnection = mouse.Move:Connect(function()
					TextBox.Text = Value
					Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
					pcall(function()
						callback(Value)
					end)
					bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
					circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
						circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
			releaseconnection = uis.InputEnded:Connect(function(Mouse)
				if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
					Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
					TextBox.Text = Value
				end
			end)

			TextBox.FocusLost:Connect(function()
				if tonumber(TextBox.Text) > max then
					TextBox.Text  = max
				end
				bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
				pcall(callback, TextBox.Text)
			end)
		end

        function main:AddTextbox(text,disappear,callback)
			local Textbox = Instance.new("Frame")
			local TextboxCorner = Instance.new("UICorner")
			local Textboxx = Instance.new("Frame")
			local TextboxxCorner = Instance.new("UICorner")
			local TextboxLabel = Instance.new("TextLabel")
			local txtbtn = Instance.new("TextButton")
			local RealTextbox = Instance.new("TextBox")
			local UICorner = Instance.new("UICorner")

			Textbox.Name = "Textbox"
			Textbox.Parent = MainFramePage
			Textbox.BackgroundColor3 = maincolor
			Textbox.BackgroundTransparency = 0
			Textbox.Size = UDim2.new(0, 335, 0, 31)

			TextboxCorner.CornerRadius = UDim.new(0, 5)
			TextboxCorner.Name = "TextboxCorner"
			TextboxCorner.Parent = Textbox

			Textboxx.Name = "Textboxx"
			Textboxx.Parent = Textbox
			Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Textboxx.Position = UDim2.new(0, 1, 0, 1)
			Textboxx.Size = UDim2.new(0, 333, 0, 29)

			TextboxxCorner.CornerRadius = UDim.new(0, 5)
			TextboxxCorner.Name = "TextboxxCorner"
			TextboxxCorner.Parent = Textboxx

			TextboxLabel.Name = "TextboxLabel"
			TextboxLabel.Parent = Textbox
			TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxLabel.BackgroundTransparency = 1.000
			TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
			TextboxLabel.Text = text
			TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
			TextboxLabel.Font = Enum.Font.GothamSemibold
			TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextboxLabel.TextSize = 16.000
			TextboxLabel.TextTransparency = 0
			TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

			txtbtn.Name = "txtbtn"
			txtbtn.Parent = Textbox
			txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			txtbtn.BackgroundTransparency = 1.000
			txtbtn.Position = UDim2.new(0, 1, 0, 1)
			txtbtn.Size = UDim2.new(0, 333, 0, 29)
			txtbtn.Font = Enum.Font.SourceSans
			txtbtn.Text = ""
			txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			txtbtn.TextSize = 14.000

			RealTextbox.Name = "RealTextbox"
			RealTextbox.Parent = Textbox
            RealTextbox.ClipsDescendants = true
			RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			RealTextbox.BackgroundTransparency = 0
			RealTextbox.Position = UDim2.new(0, 255, 0, 6)
			RealTextbox.Size = UDim2.new(0, 75, 0, 20)
			RealTextbox.Font = Enum.Font.GothamSemibold
			RealTextbox.Text = ""
			RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
			RealTextbox.TextSize = 11.000
			RealTextbox.TextTransparency = 0

			RealTextbox.FocusLost:Connect(function()
				callback(RealTextbox.Text)
				if disappear then
					RealTextbox.Text = ""
				end
			end)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = RealTextbox
		end
		function main:AddLabel(text)
			local Label = Instance.new("TextLabel")
			local PaddingLabel = Instance.new("UIPadding")
			local labell = {}
	
			Label.Name = "Label"
			Label.Parent = MainFramePage
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Size = UDim2.new(0, 335, 0, 20)
			Label.Font = Enum.Font.GothamSemibold
			Label.TextColor3 = Color3.fromRGB(225, 225, 225)
			Label.TextSize = 16.000
			Label.Text = text
			Label.TextXAlignment = Enum.TextXAlignment.Left

			PaddingLabel.PaddingLeft = UDim.new(0,15)
			PaddingLabel.Parent = Label
			PaddingLabel.Name = "PaddingLabel"
	
			function labell:Set(newtext)
				Label.Text = newtext
			end

			return labell
		end
		function main:AddSeperator(text)
			local Seperator = Instance.new("Frame")
			local Sep1 = Instance.new("Frame")
			local Sep2 = Instance.new("TextLabel")
			local Sep3 = Instance.new("Frame")
			
			Seperator.Name = "Seperator"
			Seperator.Parent = MainFramePage
			Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Seperator.BackgroundTransparency = 1.000
			Seperator.Size = UDim2.new(0, 335, 0, 20)
			
			Sep1.Name = "Sep1"
			Sep1.Parent = Seperator
			Sep1.BackgroundColor3 = maincolor
			Sep1.BorderSizePixel = 0
			Sep1.Position = UDim2.new(0, 0, 0, 10)
			Sep1.Size = UDim2.new(0, 80, 0, 1)
			
			Sep2.Name = "Sep2"
			Sep2.Parent = Seperator
			Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.BackgroundTransparency = 1.000
			Sep2.Position = UDim2.new(0, 120, 0, 0)
			Sep2.Size = UDim2.new(0, 100, 0, 20)
			Sep2.Font = Enum.Font.GothamSemibold
			Sep2.Text = text
			Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.TextSize = 14.000
			
			Sep3.Name = "Sep3"
			Sep3.Parent = Seperator
			Sep3.BackgroundColor3 = maincolor
			Sep3.BorderSizePixel = 0
			Sep3.Position = UDim2.new(0, 255, 0, 10)
			Sep3.Size = UDim2.new(0, 80, 0, 1)
		end

		function main:AddLine()
			local Linee = Instance.new("Frame")
			local Line = Instance.new("Frame")
			
			Linee.Name = "Linee"
			Linee.Parent = MainFramePage
			Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Linee.BackgroundTransparency = 1.000
			Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
			Linee.Size = UDim2.new(0, 335, 0, 20)
			
			Line.Name = "Line"
			Line.Parent = Linee
			Line.BackgroundColor3 = maincolor
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0, 0, 0, 10)
			Line.Size = UDim2.new(0, 335, 0, 1)
		end
        return main
    end
    return uitab
end

spawn(function()
    pcall(function()
        if _G.Setting["Kaiton"] then
            HovxrzGui.Enabled = false
        else
            HovxrzGui.Enabled = true
        end
    end)
end)

local Library = library:CreateWindow("LOCKER      ", Color3.fromRGB(155,155,255), "       Blox Fruits            ")
repeat wait() until game:IsLoaded()
local tap1 = Library:AddTab("Farm Level")

tap1:AddSeperator("ToggleGui : RightControl")

tap1:AddSeperator("Auto Farm")

function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if OldWorld then
        if Lv == 1 or Lv <= 9 or SelectMonster == "Bandit [Lv. 5]" then 
            Ms = "Bandit [Lv. 5]"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey [Lv. 14]" then 
            Ms = "Monkey [Lv. 14]"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla [Lv. 20]" then 
            Ms = "Gorilla [Lv. 20]"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif Lv == 30 or Lv <= 39 or SelectMonster == "Pirate [Lv. 35]" then 
            Ms = "Pirate [Lv. 35]"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif Lv == 40 or Lv <= 59 or SelectMonster == "Brute [Lv. 45]" then 
            Ms = "Brute [Lv. 45]"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif Lv == 60 or Lv <= 74 or SelectMonster == "Desert Bandit [Lv. 60]" then 
            Ms = "Desert Bandit [Lv. 60]"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif Lv == 75 or Lv <= 89 or SelectMonster == "Desert Officer [Lv. 70]" then
            Ms = "Desert Officer [Lv. 70]"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif Lv == 90 or Lv <= 99 or SelectMonster == "Snow Bandit [Lv. 90]" then 
            Ms = "Snow Bandit [Lv. 90]"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman [Lv. 100]" then
            Ms = "Snowman [Lv. 100]"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif Lv == 120 or Lv <= 149 or SelectMonster == "Chief Petty Officer [Lv. 120]" then
            Ms = "Chief Petty Officer [Lv. 120]"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit [Lv. 150]" then 
            Ms = "Sky Bandit [Lv. 150]"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif Lv == 175 or Lv <= 249 or SelectMonster == "Dark Master [Lv. 175]" then 
            Ms = "Dark Master [Lv. 175]"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
		elseif Lv == 190 or Lv <= 209 or SelectMonster == "Prisoner [Lv. 190]" then
			Ms = "Prisoner [Lv. 190]"
			NameQuest = "PrisonerQuest"
			QuestLv = 1
			NameMon = "Prisoner"
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514)
			CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877)
		elseif Lv == 210 or Lv <= 249 or SelectMonster == "Dangerous Prisoner [Lv. 210]" then
			Ms = "Dangerous Prisoner [Lv. 210]"
			NameQuest = "PrisonerQuest"
			QuestLv = 2
			NameMon = "Dangerous Prisoner"
			CFrameQ = CFrame.new(5308.93115, 1.65517521, 475.120514)
			CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877)
        elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior [Lv. 250]" then 
            Ms = "Toga Warrior [Lv. 250]"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator [Lv. 275]" then 
            Ms = "Gladiator [Lv. 275]"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1270.7352294921875, 7.567874908447266, -3275.294189453125)
        elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier [Lv. 300]" then 
            Ms = "Military Soldier [Lv. 300]"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5481.966796875, 9.47974967956543, 8533.9453125)
        elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy [Lv. 325]" then 
            Ms = "Military Spy [Lv. 325]"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
        elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then  
            Ms = "Fishman Warrior [Lv. 375]"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60924.0625, 18.6081485748291, 1499.62158203125)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then 
            Ms = "Fishman Commando [Lv. 400]"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard [Lv. 450]" then 
            Ms = "God's Guard [Lv. 450]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
			end
        elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda [Lv. 475]" then 
            Ms = "Shanda [Lv. 475]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
			end
        elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then
            Ms = "Royal Squad [Lv. 525]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then 
            Ms = "Royal Soldier [Lv. 550]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then 
            Ms = "Galley Pirate [Lv. 625]"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif Lv >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then
            Ms = "Galley Captain [Lv. 650]"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if NewWorld then
        if Lv == 700 or Lv <= 724 or SelectMonster == "Raider [Lv. 700]" then
            Ms = "Raider [Lv. 700]"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
			CFrameMon = CFrame.new(-750.0274658203125, 39.265113830566406, 2375.60400390625)
        elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary [Lv. 725]" then 
            Ms = "Mercenary [Lv. 725]"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-973.1364135742188, 73.25519561767578, 1399.2318115234375)
        elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate [Lv. 775]" then 
            Ms = "Swan Pirate [Lv. 775]"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(969.056396484375, 136.31959533691406, 1231.5203857421875)
        elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff [Lv. 800]" then 
            Ms = "Factory Staff [Lv. 800]"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
			if raMon == 1 then
				CFrameMon = CFrame.new(661.5947265625, 73.08507537841797, 34.038272857666016)
			elseif raMon == 2 then
				CFrameMon = CFrame.new(-241.59727478027344, 73.0850830078125, -448.80029296875)
            end
        elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then
            Ms = "Marine Lieutenant [Lv. 875]"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2881.047119140625, 73.20455169677734, -2985.87939453125)
        elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then
            Ms = "Marine Captain [Lv. 900]" 
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-1913.3197021484375, 73.2123031616211, -3332.065185546875)
        elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie [Lv. 950]" then 
            Ms = "Zombie [Lv. 950]"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire [Lv. 975]" then
            Ms = "Vampire [Lv. 975]"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-6020.2216796875, 6.528029441833496, -1280.1217041015625)
        elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then
            Ms = "Snow Trooper [Lv. 1000]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then
            Ms = "Winter Warrior [Lv. 1050]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then
            Ms = "Lab Subordinate [Lv. 1100]"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5778.29833984375, 42.52165222167969, -4481.79443359375)
        elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then
            Ms = "Horned Warrior [Lv. 1125]"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6466.01611328125, 15.97756290435791, -5667.28857421875)
        elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then 
            Ms = "Magma Ninja [Lv. 1175]"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then 
            Ms = "Lava Pirate [Lv. 1200]"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then
            Ms = "Ship Deckhand [Lv. 1250]"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then 
            Ms = "Ship Engineer [Lv. 1275]"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then 
            Ms = "Ship Steward [Lv. 1300]"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then 
            Ms = "Ship Officer [Lv. 1325]"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then 
            Ms = "Arctic Warrior [Lv. 1350]"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
			if autofarmV1 and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			end
        elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then 
            Ms = "Snow Lurker [Lv. 1375]"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then 
            Ms = "Sea Soldier [Lv. 1425]"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif Lv >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then
            Ms = "Water Fighter [Lv. 1450]"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3436.071044921875, 290.5218200683594, -10503.736328125)
		end
	end
	if ThreeWorld then
		if Lv == 1500 or Lv <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then 
            Ms = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			QuestLv = 1
			NameMon = "Pirate Millionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-302.28338623046875, 57.51716232299805, 5615.92919921875)
		elseif Lv == 1525 or Lv <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then
			NameQuest = "PiratePortQuest"
			QuestLv = 2
			NameMon = "Pistol Billionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-635.3514404296875, 111.48406982421875, 5952.5869140625)
		elseif Lv == 1575 or Lv <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			QuestLv = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6506.54345703125, 113.297119140625, -957.8739624023438)
		elseif Lv == 1600 or Lv <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then 
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			QuestLv = 2
			NameMon = "Dragon Crew Archer"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6716.9052734375, 430.8106384277344, 111.39741516113281)
		elseif Lv == 1625 or Lv <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then
			Ms = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			QuestLv = 1
			NameMon = "Female Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(4662.99951171875, 735.8788452148438, 676.922119140625)
		elseif Lv == 1650 or Lv <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then
			Ms = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			QuestLv = 2
			NameMon = "Giant Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
		elseif Lv == 1700 or Lv <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then
			Ms = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 1
			NameMon = "Marine Commodore"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
		elseif Lv == 1725 or Lv <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 2
			NameMon = "Marine Rear Admiral"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(3382.984619140625, 121.53973388671875, -6790.88037109375)
		elseif Lv == 1775 or Lv <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then
			Ms = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 1
			NameMon = "Fishman Raider"
			CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
			CFrameMon = CFrame.new(-10400.931640625, 331.7884216308594, -8408.9541015625)
		elseif Lv == 1800 or Lv <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then
			Ms = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 2
			NameMon = "Fishman Captain"
			CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
			CFrameMon = CFrame.new(-11133.873046875, 384.2198791503906, -9055.9765625)
		elseif Lv == 1825 or Lv <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then
			Ms = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			QuestLv = 1
			NameMon = "Forest Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
		elseif Lv == 1850 or Lv <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then 
			Ms = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			QuestLv = 2
			NameMon = "Mythological Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
		elseif Lv == 1900 or Lv <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then 
			Ms = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 1
			NameMon = "Jungle Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
		elseif Lv == 1925 or Lv <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then 
			Ms = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 2
			NameMon = "Musketeer Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
		elseif Lv == 1975 or Lv <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			QuestLv = 1
			NameMon = "Reborn Skeleton"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
		elseif Lv == 2000 or Lv <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
			Ms = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			QuestLv = 2
			NameMon = "Living Zombie"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
		elseif Lv == 2025 or Lv <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			QuestLv = 1
			NameMon = "Demonic Soul"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9709.30762, 204.695892, 6044.04688, -0.845798075, -3.4587876e-07, -0.533503294, -4.46235369e-08, 1, -5.77571257e-07, 0.533503294, -4.64701827e-07, -0.845798075)
		elseif Lv == 2050 or Lv <= 2075 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
			Ms = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			QuestLv = 2
			NameMon = "Posessed Mummy"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9554.11035, 65.6141663, 6041.73584, -0.877069294, 5.33355795e-08, -0.480364174, 2.06420765e-08, 1, 7.33423562e-08, 0.480364174, 5.44105987e-08, -0.877069294)
		elseif Lv == 2075 or Lv <= 2100 or SelectMonster == "Peanut Scout [Lv. 2075]" then
			Ms = "Peanut Scout [Lv. 2075]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 1
			NameMon = "Peanut Scout"
			CFrameQ = CFrame.new(-2103.401611328125, 38.447044372558594, -10192.44140625)
			CFrameMon = CFrame.new(-2190.37, 94.6626, -10098.3)
		elseif Lv == 2100 or Lv <= 2125 or SelectMonster == "Peanut President [Lv. 2100]" then
			Ms = "Peanut President [Lv. 2100]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 2
			NameMon = "Peanut President"
			CFrameQ = CFrame.new(-2103.401611328125, 38.447044372558594, -10192.44140625)
			CFrameMon = CFrame.new(-2137.686279296875, 170.53089904785156, -10609.388671875)
		elseif Lv == 2125 or Lv <= 2150 or SelectMonster == "Ice Cream Chaf [Lv. 2125]" then
			Ms = "Ice Cream Chef [Lv. 2125]"
			NameQuest = "IceCreamIslandQuest"
			QuestLv = 1
			NameMon = "Ice Cream Chef"
			CFrameQ = CFrame.new(-821.259033203125, 66.16278839111328, -10964.5791015625)
			CFrameMon = CFrame.new(-801.5482788085938, 211.06137084960938, -10972.814453125)
		elseif Lv == 2150 or Lv <= 2200 or SelectMonster == "Ice Cream Commander [Lv. 2150]" then
			Ms = "Ice Cream Commander [Lv. 2150]"
			NameQuest = "IceCreamIslandQuest"
			QuestLv = 2
			NameMon = "Ice Cream Commander"
			CFrameQ = CFrame.new(-821.259033203125, 66.16278839111328, -10964.5791015625)
			CFrameMon = CFrame.new(-552.3236694335938, 111.17111206054688, -11291.3271484375)
		elseif Lv == 2200 or Lv <= 2225 or SelectMonster == "Cookie Crafter [Lv. 2200]" then
			Ms = "Cookie Crafter [Lv. 2200]"
			NameQuest = "CakeQuest1"
			QuestLv = 1
			NameMon = "Cookie Crafter"
			CFrameQ = CFrame.new(-2022.6387939453125, 38.1414680480957, -12027.939453125)
			CFrameMon = CFrame.new(-2301.03125, 112.88335418701172, -12206.984375)
		elseif Lv == 2225 or Lv <= 2250 or SelectMonster == "Cake Guard [Lv. 2225]" then
			Ms = "Cake Guard [Lv. 2225]"
			NameQuest = "CakeQuest1"
			QuestLv = 2
			NameMon = "Cake Guard"
			CFrameQ = CFrame.new(-2022.6387939453125, 38.1414680480957, -12027.939453125)
			CFrameMon = CFrame.new(-1602.900146484375, 196.0018310546875, -12376.7861328125)
		elseif Lv == 2250 or Lv <= 2275 or SelectMonster == "Baking Staff [Lv. 2250]" then
			Ms = "Baking Staff [Lv. 2250]"
			NameQuest = "CakeQuest2"
			QuestLv = 1
			NameMon = "Baking Staff"
			CFrameQ = CFrame.new(-1927.83056640625, 38.360443115234375, -12842.0908203125)
			CFrameMon = CFrame.new(-2052.93896484375, 68.81322479248047, -12960.2685546875)
		    elseif Lv == 2275 or Lv <= 2300 or SelectMonster == "Head Baker [Lv. 2275]" then
			Ms = "Head Baker [Lv. 2275]"
			NameQuest = "CakeQuest2"
			QuestLv = 2
			NameMon = "Head Baker"
			CFrameQ = CFrame.new(-1927.83056640625, 38.360443115234375, -12842.0908203125)
			CFrameMon = CFrame.new(-2287.00732421875, 103.9866943359375, -12822.05078125)
            elseif Lv == 2300 or Lv <= 2325 or SelectMonster == "Cocoa Warrior [Lv. 2300]" then
			Ms = "Cocoa Warrior [Lv. 2300]"
			NameQuest = "ChocQuest1"
			QuestLv = 1
			NameMon = "Cocoa Warrior"
			CFrameQ = CFrame.new(231.75, 24.9003, -12200.3)
			CFrameMon = CFrame.new(37.12930679321289, 53.66633224487305, -12315.0166015625)
            elseif Lv == 2325 or Lv <= 2350 or SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
			Ms = "Chocolate Bar Battler [Lv. 2325]"
			NameQuest = "ChocQuest1"
			QuestLv = 2
			NameMon = "Chocolate Bar Battler"
			CFrameQ = CFrame.new(231.75, 24.9003, -12200.3)
			CFrameMon = CFrame.new(627.2858276367188, 75.59115600585938, -12586.1337890625)
            elseif Lv == 2350 or Lv <= 2375 or SelectMonster == "Sweet Thief [Lv. 2350]" then
			Ms = "Sweet Thief [Lv. 2350]"
			NameQuest = "ChocQuest2"
			QuestLv = 1
			NameMon = "Sweet Thief"
			CFrameQ = CFrame.new(151.198, 24.8907, -12774.6)
			CFrameMon = CFrame.new(65.77503967285156, 77.56488037109375, -12636.5615234375)
            elseif Lv == 2375 or Lv <= 2400 or SelectMonster == "Candy Rebel [Lv. 2375]" then
			Ms = "Candy Rebel [Lv. 2375]"
			NameQuest = "ChocQuest2"
			QuestLv = 2
			NameMon = "Candy Rebel"
			CFrameQ = CFrame.new(151.198, 24.8907, -12774.6)
			CFrameMon = CFrame.new(59.33293914794922, 64.40779876708984, -12892.9638671875)
            elseif Lv == 2400 or Lv <= 2425 or SelectMonster == "Candy Pirate [Lv. 2400]" then
			Ms = "Candy Pirate [Lv. 2400]"
			NameQuest = "CandyQuest1"
			QuestLv = 1
			NameMon = "Candy Pirate"
			CFrameQ = CFrame.new(-1148.8192138671875, 22.378950119018555, -14445.7177734375)
			CFrameMon = CFrame.new(-1345.212890625, 139.2557830810547, -14497.9052734375)
            elseif Lv >= 2450 or SelectMonster == "Snow Demon [Lv. 2425]" then
			Ms = "Snow Demon [Lv. 2425]"
			NameQuest = "CandyQuest1"
			QuestLv = 2
			NameMon = "Snow Demon"
			CFrameQ = CFrame.new(-1148.8192138671875, 22.378950119018555, -14445.7177734375)
			CFrameMon = CFrame.new(-844.89501953125, 139.89016723632812, -14497.513671875)
		end
	end
end

spawn(function()
    while wait(.1) do
        if autofarmV1 or V1 then
            pcall(function()  
                if AutoQuestFarm then
                    CheckLevel()
                    autofarm2()
                else
                    CheckLevel()
                    autofarm()
                end
            end)
        end
    end
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

--[[function FastFarm_()
    pcall(function()
        if game.Players.LocalPlayer.Data.Level.Value >= 15 and game.Players.LocalPlayer.Data.Level.Value <= 70 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Royal Squad [Lv. 525]") or game:GetService("Workspace").Enemies:FindFirstChild("Royal Soldier [Lv. 550]") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        			if v.Name == "Royal Squad [Lv. 525]" or v.Name == "Royal Soldier [Lv. 550]" then
        				if v.Humanoid.Health > 0 then
        					repeat task.wait()
                                EquipWeapon(SelectToolWeapon)
                                v.Humanoid:ChangeState(11)
                                v.HumanoidRootPart.CanCollide = false
                                cframemon = v.HumanoidRootPart.CFrame
                                v.Head.CanCollide = false
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                Magnet = true
                                Fast_Delay = true
        					until _G.FastFarm  == false or not v.Parent or v.Humanoid.Health <= 0
        				else
        					TP(CFrame.new(-7887.20751953125, 5636.08935546875, -1404.2613525390625))
        			    end
        			end
        		end
            else
                local CFrameFast = CFrame.new(-7887.20751953125, 5636.08935546875, -1404.2613525390625)
                if (CFrameFast.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                else
        			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        			TP(CFrame.new(-7887.20751953125, 5636.08935546875, -1404.2613525390625))
        		end
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 71 and game.Players.LocalPlayer.Data.Level.Value <= 310 then
             if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                local args = {
                    [1] = "PlayerHunter"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                for i,v in pairs(game.Players:GetPlayers()) do
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
                        if v.Data.Level.Value >= 70 or v.Data.Level.Value <= 100 then
                            repeat task.wait()
                                EquipWeapon(SelectToolWeapon)
                                TP(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
                                Fast_Delay = true
                            until v.Character.Humanoid.Health <= 0 or _G.FastFarm == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
            	    	else
            	    		local args = {
                                [1] = "PlayerHunter"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    else
                        local args = {
                            [1] = "PlayerHunter"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end)
end]]

function autofarm()
    CheckLevel()
    pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
            for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat game:GetService("RunService").Stepped:wait()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                            EquipWeapon(SelectToolWeapon)
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                            end
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.Humanoid:ChangeState(11)
                            cframemon = v.HumanoidRootPart.CFrame
                            Magnet = true
                            if Fast_Delay_Click_Custom then
                                Fast_Delay = true
                            else
                                Fast_Delay = false
                            end
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        end
                    until Auto_Farm == false or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:GetChildren(v.Name)
                end
            end
        else
            TP2(CFrameMon)
            CheckLevel()
            Fast_Delay = false
            Magnet = false
        end
    end)
end

function autofarm2()
    CheckLevel()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        TP2(CFrameQ)
        CheckLevel()
        if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
            wait(1.1)
            if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                local CommF_ = game:GetService("ReplicatedStorage").Remotes["CommF_"];CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
            end
        end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        pcall(function()
            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat wait()
                            if game:GetService("Workspace").Enemies:GetChildren(Ms) then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                    EquipWeapon(SelectToolWeapon)
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    v.Humanoid:ChangeState(11)
                                    v.HumanoidRootPart.CanCollide = false
                                    cframemon = v.HumanoidRootPart.CFrame
                                    v.Head.CanCollide = false
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    Magnet = true
                                    if Fast_Delay_Click_Custom then
                                        Fast_Delay = true
                                    else
                                        Fast_Delay = false
                                    end
                                else
                                    Magnet = false    
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            else
                                game:GetService("RunService").Heartbeat:wait()
                                CheckLevel()
                                Fast_Delay = false
                                Magnet = false
                            end
                        until not v.Parent or v.Humanoid.Health <= 0 or Auto_Farm == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:GetChildren(v.Name)
                    end
                end
            else
                CheckLevel()
                TP2(CFrameMon)
                Fast_Delay = false
                Magnet = false
            end
        end)
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == true then
        TP2(CFrameMon * CFrame.new(0,800,0))
    end
end

task.spawn(function()
	while wait(.1) do
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)

--[[task.spawn(function()
	while wait(.1) do
        pcall(function()
            wait(.1)
                CFrame.new(0,30,0) 
            wait(.1)
                CFrame.new(0,0,-30) 
            wait(.1)
                CFrame.new(30,0,0)
            wait(.1)
                CFrame.new(0,0,-30)
            wait(.1)
                CFrame.new(-30,0,0)
            wait(.1)
                CFrame.new(0,0,-25)
            wait(.1)
	    end)
    end
end)]]

spawn(function()
    while task.wait() do
        pcall(function()
            for o,p in pairs(game.ReplicatedStorage:GetChildren()) do
                for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if MagnetMain then
                        if CustamMagNet then
                            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 250 then
                                    pcall(function()
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-25)
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            for o,p in pairs(game.ReplicatedStorage:GetChildren()) do
                for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if MagnetMain then
                        if autofarmV1 or V1 or AutoFarmSelectMon and Magnet then
                            if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if (v.HumanoidRootPart.Position - cframemon.Position).Magnitude <= 300 then
                                    pcall(function()
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = cframemon
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                    end)
                                end
                            end
                        end
                        if FastFarmTog then
                            if v.Name == "Royal Squad [Lv. 525]" or v.Name == "Royal Soldier [Lv. 550]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if (v.HumanoidRootPart.Position - cframemon.Position).Magnitude < 300 then
                                    pcall(function()
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = cframemon
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                    end)
                                end
                            end
                        end
                        if AutoCandy then
                            if (v.Name == "Candy Pirate [Lv. 2400]" or v.Name == "Snow Demon [Lv. 2425]") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if (v.HumanoidRootPart.Position - Candy.Position).Magnitude < 300 then
                                    pcall(function()
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = Candy
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                    end)
                                end
                            end
                        end
                        if atoMoB then
                            if (v.Name == "Head Baker [Lv. 2275]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Prince [Lv. 2300] [Raid Boss]") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if (v.HumanoidRootPart.Position - Ato500.Position).Magnitude < 300 then
                                    pcall(function()
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = Ato500
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                    end)
                                end
                            end
                        end
                        if Auto_Bone then
                            if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - BoneEv.Position).Magnitude <= 275 then
                                pcall(function()
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.CFrame = BoneEv
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                end)
                            end
                        end
                        if AutoBatilo then
                            if v.Name == "Swan Pirate [Lv. 775]" and (v.HumanoidRootPart.Position - Pos_.Position).Magnitude <= 275 then
                                pcall(function()
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.CFrame = Pos_
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(.1) do
        if AutoHaki or Haki_Toggle or V1 then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)

spawn(function()
	pcall(function()
		while wait(.5) do
			if BuyCombatAuto or V1 then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
                if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300) then
                    local args = {
                        [1] = "BuyElectro"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300) then
                    local args = {
                        [1] = "BuyFishmanKarate"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
				if game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
						SelectToolWeapon = "Combat"
						SelectToolWeaponOld = "Combat"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") then
						SelectToolWeapon = "Black Leg"
						SelectToolWeaponOld = "Black Leg"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
						SelectToolWeapon = "Electro"
						SelectToolWeaponOld = "Electro"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") then
						SelectToolWeapon = "Fishman Karate"
						SelectToolWeaponOld = "Fishman Karate"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") then
						SelectToolWeapon = "Dragon Claw"
						SelectToolWeaponOld = "Dragon Claw"
					end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Superhuman") then
						SelectToolWeapon = "Superhuman"
						SelectToolWeaponOld = "Superhuman"
					end
				end
			end
		end
	end)
end)

spawn(function()
    while wait(.1) do
        if V1 or LegendarySword then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if V1 then
                UseCombat()
            end
        end)
    end
end)

function UseCombat()
    if true then
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") then
            SelectToolWeapon = "Dragon Talon"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("BlackLeg") then
            SelectToolWeapon = "BlackLeg"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
            SelectToolWeapon = "Combat"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") then
            SelectToolWeapon = "Electro"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") then
            SelectToolWeapon = "Fishman Karate"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") then
            SelectToolWeapon = "Death Step"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") then
            SelectToolWeapon = "Electric Claw"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") then
            SelectToolWeapon = "Sharkman Karate"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") then
            SelectToolWeapon = "Dragon Talon"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
            SelectToolWeapon = "Superhuman"
        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
            SelectToolWeapon = "Godhuman"
        end
    end
end

spawn(function()
    while wait(.1) do
        pcall(function()
            if V1 or BringFruit then
                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:IsA("Tool") then
                        if string.find(v.Name, "Fruit") then
                            repeat wait()
                                wait(.1)
                                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                                wait(.1)
                                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
                                wait(1)
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
                                wait(.1)
                            until v.Parent == game.Players.LocalPlayer.Character
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(.1) do
        pcall(function()
            if V1 or Abilities then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if V1 or Redeem then
            function UseCode(Text)
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
            end
            task.wait()
            UseCode("GAMER_ROBOT_1M")
            UseCode("ADMINGIVEAWAY")
            UseCode("GAMERROBOT_YT")
            UseCode("kittgaming")
            UseCode("Sub2Fer999")
            UseCode("Enyu_is_Pro")
            UseCode("Magicbus")
            UseCode("JCWK")
            UseCode("Starcodeheo")
            UseCode("Bluxxy")
            UseCode("SUB2GAMERROBOT_EXP1")
            UseCode("Sub2NoobMaster123")
            UseCode("Sub2Daigrock")
            UseCode("Axiore")
            UseCode("TantaiGaming")
            UseCode("StrawHatMaine")
            UseCode("Sub2OfficialNoobie")
            UseCode("TheGreatAce")
        end
    end
end)

spawn(function()
    pcall(function()
        while task.wait() do 
            if TweenTpRaid or AutoCandy or V1 or TPPos or NextIsland or Auto_Bone or New_World or autofarmV1 or AutoFarmSelectMon or atoMoB then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local BodyV = Instance.new("BodyVelocity")
                    BodyV.Name = "BodyClip"
                    BodyV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    BodyV.MaxForce = Vector3.new(10000000, 10000000, 10000000)
                    BodyV.Velocity = Vector3.new(0, 0, 0)
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end
    end)
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function() 
        if V1 or AutoCandy or TPPos or NextIsland or NoClip_Toggle or Auto_Bone or New_World or autofarmV1 or AutoFarmSelectMon or atoMoB then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
            end
        end
    end)
end)

tap1:AddToggle("Auto Kaiton", _G.Setting.Kaiton, function(v)
    wait(.1);
    wait(1);
    V1 = v;
    SelectMonster = nil
    if v == false then
        wait(0.1);
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false;
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait(1);
        V1 = false;
        Fast_Delay = false;
    end
end)

tap1:AddToggle("Auto Farm Level", _G.Setting.Farm, function(v)
    if SelectToolWeapon == "" or SelectToolWeapon == nil then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Notification System", 
            Text = "Select Weapon Please",
            Duration = 25
        })
    else
        SelectMonster = nil;
        autofarmV1 = true;
        AutoHaki = true;
    end
    if v == false then
        autofarmV1 = false;
        AutoHaki = false;
        Fast_Delay = false;
        wait(0.1)
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

spawn(function()
while true do wait()
pcall(function()
if autofarmV1 or V1 then
SelectMonster = nil
end end) end end)

spawn(function()
    while wait() do
        if AutoFarmSelectMon then
            CheckLevel()
            if AutoQuestFarm then
                autofarmselectmon1()
            else
                autofarmselectmon2()
            end
        end
    end
end)

function autofarmselectmon1()
    CheckLevel()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            TP2(CFrameQ)
            CheckLevel()
            if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                wait(1.1)
                if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    local CommF_ = game:GetService("ReplicatedStorage").Remotes["CommF_"];CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                end
            end
        end
   elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
        pcall(function()
            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat wait()
                            if game:GetService("Workspace").Enemies:GetChildren(Ms) then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    EquipWeapon(SelectToolWeapon)
                                    v.Humanoid:ChangeState(11)
                                    v.HumanoidRootPart.CanCollide = false
                                    cframemon = v.HumanoidRootPart.CFrame
                                    v.Head.CanCollide = false
                                    TP(cframemon * CFrame.new(0,30,0))
                                    Magnet = true
                                    Fast_Delay = true
                                else
                                    Magnet = false    
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            else
                                CheckLevel()
                                TP(CFrameMon)
                                Fast_Delay = false
                                Magnet = false
                            end
                        until not v.Parent or v.Humanoid.Health <= 0 or AutoFarmSelectMon == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:GetChildren(v.Name)
                    end
                end
            else
                CheckLevel()
                TP(CFrameMon)
                Fast_Delay = false
                Magnet = false
            end
        end)
    end
end

function autofarmselectmon2()
    CheckLevel()
    pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
            for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat wait()
                        if game:GetService("Workspace").Enemies:GetChildren(Ms) then
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                            end
                            EquipWeapon(SelectToolWeapon)
                            v.Humanoid:ChangeState(11)
                            v.HumanoidRootPart.CanCollide = false
                            cframemon = v.HumanoidRootPart.CFrame
                            v.Head.CanCollide = false
                            TP(cframemon * CFrame.new(0,30,0))
                            Magnet = true
                            Fast_Delay = true
                        else
                            CheckLevel()
                            TP(CFrameMon)
                            Fast_Delay = false
                            Magnet = false
                        end
                    until not v.Parent or v.Humanoid.Health <= 0 or AutoFarmSelectMon == false
                end
            end
        else
            CheckLevel()
            TP2(CFrameMon)
            Fast_Delay = false
            Magnet = false
        end
    end)
end

if OldWorld then
    SelectMonFarm = {"Default","Bandit [Lv. 5]","Monkey [Lv. 14]","Gorilla [Lv. 20]","Pirate [Lv. 35]","Brute [Lv. 45]","Desert Bandit [Lv. 60]","Desert Officer [Lv. 70]","Snow Bandit [Lv. 90]","Snowman [Lv. 100]","Chief Petty Officer [Lv. 120]","Sky Bandit [Lv. 150]","Dark Master [Lv. 175]","Toga Warrior [Lv. 250]","Gladiator [Lv. 275]","Military Soldier [Lv. 300]","Military Spy [Lv. 325]","Fishman Warrior [Lv. 375]","Fishman Commando [Lv. 400]","God's Guard [Lv. 450]","Shanda [Lv. 475]","Royal Squad [Lv. 525]","Royal Soldier [Lv. 550]","Galley Pirate [Lv. 625]","Galley Captain [Lv. 650]"}
elseif NewWorld then
    SelectMonFarm = {"Default","Raider [Lv. 700]","Mercenary [Lv. 725]","Swan Pirate [Lv. 775]","Factory Staff [Lv. 800]","Marine Lieutenant [Lv. 875]","Marine Captain [Lv. 900]","Zombie [Lv. 950]","Vampire [Lv. 975]","Snow Trooper [Lv. 1000]","Winter Warrior [Lv. 1050]","Lab Subordinate [Lv. 1100]","Horned Warrior [Lv. 1125]","Magma Ninja [Lv. 1175]","Lava Pirate [Lv. 1200]","Ship Deckhand [Lv. 1250]","Ship Engineer [Lv. 1275]","Ship Steward [Lv. 1300]","Ship Officer [Lv. 1325]","Arctic Warrior [Lv. 1350]","Snow Lurker [Lv. 1375]","Sea Soldier [Lv. 1425]","Water Fighter [Lv. 1450]"}
elseif ThreeWorld then
    SelectMonFarm = {"Default","Pirate Millionaire [Lv. 1500]","Pistol Billionaire [Lv. 1525]" ,"Dragon Crew Warrior [Lv. 1575]", "Dragon Crew Archer [Lv. 1600]","Female Islander [Lv. 1625]","Giant Islander [Lv. 1650]","Marine Commodore [Lv. 1700]","Marine Rear Admiral [Lv. 1725]","Fishman Raider [Lv. 1775]","Fishman Captain [Lv. 1800]","Forest Pirate [Lv. 1825]","Mythological Pirate [Lv. 1850]","Jungle Pirate [Lv. 1900]","Musketeer Pirate [Lv. 1925]","Reborn Skeleton [Lv. 1975]","Living Zombie [Lv. 2000]","Demonic Soul [Lv. 2025]","Posessed Mummy [Lv. 2050]","Peanut Scout [Lv. 2075]","Peanut President [Lv. 2100]","Ice Cream Chef [Lv. 2125]","Ice Cream Commander [Lv. 2150]","Cookie Crafter [Lv. 2200]","Cake Guard [Lv. 2225]","Baking Staff [Lv. 2250]","Head Baker [Lv. 2275]","Cocoa Warrior [Lv. 2300]","Chocolate Bar Battler [Lv. 2325]","Sweet Thief [Lv. 2350]","Candy Rebel [Lv. 2375]","Candy Pirate [Lv. 2400]","Snow Demon [Lv. 2425]"}
end

tap1:AddToggle("Auto Farm ( Select )", _G.Setting.FarmSelectMon, function(v)
    if SelectToolWeapon == "" or SelectToolWeapon == nil then
         game.StarterGui:SetCore("SendNotification", {
            Title = "Notification System", 
            Text = "Select Weapon Please",
            Duration = 25
        })
    else
        SelectMonster = SelectMonsterOld
        AutoFarmSelectMon = v
        AutoHaki = v
        Fast_Delay = v
    end
    if v == false then
        wait(0.1)
        AutoFarmSelectMon = v
        AutoHaki = v
        Fast_Delay = v
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

tap1:AddToggle("Auto Quest", _G.Setting.Quest, function(v)
    AutoQuestFarm = v
    AutoQuestFarmOld = v
end)

tap1:AddToggle("Fast Attack", _G.Setting.FastAttackToggle, function(v)
    DAFast = v
end)

tap1:AddDropdown("Select Mob ( Farm )", SelectMonFarm, function(v)
    SelectMonster = v
    SelectMonsterOld = v 
    wait(.1)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Select Mob Farm: \n".. tostring(v) .."",
        Duration = 10
    })
end)

Weapon = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Weapon ,v.Name)
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(Weapon ,v.Name)
    end
end

local DropWeaponMain = tap1:AddDropdown("Weapon [ Main Farm ]", Weapon, function(v)
    SelectToolWeapon = v
    SelectToolWeaponOld = v
    wait(.1)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Select Weapon [ Main ]: \n".. tostring(v) .. "",
        Duration = 10
    })
end)

local DropWeaponMisc = tap1:AddDropdown("Weapon [ More Farm ]", Weapon or _G.Setting.SelectToolWeaponMisc, function(v)
    SelectToolWeaponMisc = v
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Select Weapon [ Misc ]: \n".. tostring(v) .. "",
        Duration = 10
    })
end)

tap1:AddButton("Refresh Weapon", function()
    DropWeaponMain:Clear()
    DropWeaponMisc:Clear()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            wait(.1)
            DropWeaponMain:Add(v.Name)
            DropWeaponMisc:Add(v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            wait(.1)
            DropWeaponMain:Add(v.Name)
            DropWeaponMisc:Add(v.Name)
        end
    end
end)

tap1:AddSeperator("Setting Farm")

repeat wait() until game.Players.LocalPlayer.PlayerScripts.CombatFramework

spawn(function()
    pcall(function()
        while task.wait() do
            if AutoSetSpawn then
                if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                end
            end
        end
    end)
end)

local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
require(game.ReplicatedStorage.Util.CameraShaker):Stop()

if true or false then
    if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
        game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
    end
    if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
        game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
    end
end

function GetBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then 
        return 
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do 
        ret = ret.Parent 
    end
    return ret
end

function AttackNoCD(Num)
    if Num == 1 then
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(AC.attack, 5)
                local u9 = debug.getupvalue(AC.attack, 6)
                local u7 = debug.getupvalue(AC.attack, 4)
                local u10 = debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        AC.animator.anims.basic[1]:Play(0.001,0.001,0.001)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end)
            end
        end
    elseif Num == 0 then
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        for i,CombatFrameworkR in pairs(CbFw) do
                            pcall(function()
                                if i == 2 then
                                    local AC = CbFw2.activeController
                                    CombatFrameworkR.activeController.attacking = false
                                    CombatFrameworkR.activeController.blocking = false
                                    CombatFrameworkR.activeController.focusStart = 1655503339.0980349
                                    CombatFrameworkR.activeController.increment = 4
                                    CombatFrameworkR.activeController.hitboxMagnitude = 55
                                    CombatFrameworkR.activeController.timeToNextBlock = tick()
                                    CombatFrameworkR.activeController.timeToNextAttack = tick()
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300,760))
                                end
                            end)
                        end
                    end
                end)
            end
        end
    end
end

local STOP = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)

if not shared.orl then
    shared.orl = STOPRL.wrapAttackAnimationAsync
end

if not shared.cpc then
    shared.cpc = STOP.play 
end

spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
    end
end)

spawn(function()
    while task.wait() do 
        pcall(function()
            if true or false then
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay and Fast_Delay_Click_Custom then
                    AttackNoCD(0)
                end
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and DAFast then
                    AttackNoCD(0)
                end
            end
        end)
    end
end)

b2 = tick()
spawn(function()
    while wait(FastWait) do
        if b2 - tick() > 1 then
            wait(0.01)
            b2 = tick()
        end
        pcall(function()
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay and Fast_Delay_Click_Custom then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                AttackNoCD(1)
            end
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and DAFast then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                AttackNoCD(1)
            end
        end)
    end
end)

spawn(function()
    while wait(0.5) do 
        pcall(function()
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay_Click_Custom and Fast_Delay == false and DAFast == false then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                AttackNoCD(1)
            end
        end)
    end
end)

local Tp_ = game:GetService('TeleportService')
local Gc_ = game.CoreGui.RobloxPromptGui.promptOverlay

spawn(function()
    while wait(1) do
        pcall(function()
            Gc_.ChildAdded:connect(function(a)
                if Auto_Join_From_Kick then
                    if a.Name == 'ErrorPrompt' then
                        Tp_:Teleport(game.PlaceId)
                    end
                end
            end)
        end)
    end
end)

if FastWait == nil then
    FastWait = .1
end

tap1:AddDropdown("Fast Attack Mode ", {"Ultra", "Extra", "The Best"}, function(v)
    if v == "Ultra" then
        FastWait = .1
    elseif v == "Extra" then
        FastWait = math.random(-9999,0)
    elseif v == "The Best" then
        FastWait = 1 / 0 / 1 / 0 / 1 / 0 / 1 / 0
    else
        error("FastAttack Error")
    end
end)

tap1:AddToggle("Set Spawn Home", _G.Setting.SetHome, function(v)
    AutoSetSpawn = v
end)

tap1:AddToggle("Fast Attack", _G.Setting.FastAttack, function(v)
    Fast_Delay_Click_Custom = v
end)

tap1:AddToggle("Magnet", _G.Setting.Magnet, function(v)
    MagnetMain = v
end)

tap1:AddToggle("Auto Rejoin", _G.Setting.Rejoin, function(v)
    Auto_Join_From_Kick = v
end)

tap1:AddSeperator("More")

tap1:AddButton("Redeem Code", function()
    Redeem = true
end)

tap1:AddToggle("Fast Farm [ Low Level 1 - 200 ]", _G.Setting.FastFarm, function(v)
    FastFarmTog = v
end)

tap1:AddToggle("Buy Abilities", _G.Setting.Abilities, function(v)
    Abilities = v
end)

local tap2 = Library:AddTab("More Farm")

tap2:AddSeperator("Farm Boss")

tap2:AddToggle("Auto Farm Boss", false, function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Coming Soon",
        Duration = 25
    })
end)

Boss = {} 
local DropCheckBoss = tap2:AddDropdown("Boss", Boss, function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Coming Soon",
        Duration = 25
    })
end)

tap2:AddSeperator("Auto Function ( Simple )")

function EquipWeaponMisc(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

if ThreeWorld then
function Cake1()
    pcall(function()
        if (game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]")) or (game.ReplicatedStorage:FindFirstChild("Head Baker [Lv. 2275]") or game.ReplicatedStorage:FindFirstChild("Baking Staff [Lv. 2250]") or game.ReplicatedStorage:FindFirstChild("Cake Guard [Lv. 2225]") or game.ReplicatedStorage:FindFirstChild("Cookie Crafter [Lv. 2200]")) then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if (v.Name == "Head Baker [Lv. 2275]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Cookie Crafter [Lv. 2200]") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
                    if v.Humanoid.Health > 0 then
                        repeat wait()
                            pcall(function()
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                EquipWeaponMisc(SelectToolWeaponMisc)
                                Ato500 = v.HumanoidRootPart.CFrame
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                v.Humanoid:ChangeState(11)
                                v.Head.CanCollide = false
                                Fast_Delay = true
                                MagnetActive500 = true                                      
                            end)
                        until atoMoB == false or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
            end
        else
            TP2(CFrame.new(-2098.639404296875, 223.8921356201172, -12464.45703125))
            Fast_Delay = false
            MagnetActive500 = false
        end
    end)
end

function Cake2()
    pcall(function()
        if (game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")) then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then 
                    if v.Humanoid.Health > 0 then
                        repeat wait()
                            pcall(function()
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                EquipWeaponMisc(SelectToolWeaponMisc)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,25,50))
                                v.Humanoid:ChangeState(11)
                                v.Head.CanCollide = false
                                Fast_Delay = true 
                            end)
                        until atoMoB == false or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
            end
            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then 
                    if v.Humanoid.Health > 0 then
                        repeat wait()
                            pcall(function()
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                EquipWeaponMisc(SelectToolWeaponMisc)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,25,50))
                                v.Humanoid:ChangeState(11)
                                v.Head.CanCollide = false
                                Fast_Delay = true 
                            end)
                        until atoMoB == false or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
            end 
        else
            Fast_Delay = false
        end
    end)
end

spawn(function()
    while wait(.1) do
        pcall(function()
            if atoMoB then
                if (game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")) then
                    Cake2()
                else
                    Cake1()
                end
                local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                Event:InvokeServer("CakePrinceSpawner", true)
                Event:InvokeServer("CakePrinceSpawner")
            end
        end)
    end
end)

tap2:AddToggle("Auto Dough Boss", _G.Setting.DoughBoss, function(v)
    if SelectToolWeaponMisc == "" or SelectToolWeaponMisc == nil then
         game.StarterGui:SetCore("SendNotification", {
            Title = "Notification System", 
            Text = "Select Weapon Please: ✅",
            Duration = 25
        })
    else
        atoMoB = v
        AutoHaki = v
    end
    if v == false then
        wait(.5)
        Fast_Delay = false
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
        TP2(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

tap2:AddToggle("Auto Bone", _G.Setting.Bone, function(v)
    if SelectToolWeaponMisc == "" or SelectToolWeaponMisc == nil then
         game.StarterGui:SetCore("SendNotification", {
            Title = "Notification System", 
            Text = "Select Weapon Please: ✅",
            Duration = 25
        })
    else
        Auto_Bone = v
        AutoHaki = v
    end
    if v == false then
        wait(.5)
        Fast_Delay = false
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
        TP2(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

spawn(function()
	while wait(.1) do
		pcall(function()
			if Auto_Bone then
				if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")) or (game.ReplicatedStorage:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game.ReplicatedStorage:FindFirstChild("Living Zombie [Lv. 2000]") or game.ReplicatedStorage:FindFirstChild("Domenic Soul [Lv. 2025]") or game.ReplicatedStorage:FindFirstChild("Posessed Mummy [Lv. 2050]")) then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") then
							if v.Humanoid.Health > 0 then
								repeat wait()
                                    pcall(function()
                                        v.Humanoid:ChangeState(11)
                                        v.Head.CanCollide = false
                                        BoneEv = v.HumanoidRootPart.CFrame
                                        TP(BoneEv * CFrame.new(0,15,0))
                                        EquipWeaponMisc(SelectToolWeaponMisc)
                                        Fast_Delay = true
                                    end)
								until Auto_Bone == false or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					end
				else
                    Fast_Delay = false
                    TP2(CFrame.new(-9503.791015625, 271.1305847167969, 6263.05224609375))
				end
			end
		end)
	end
end)
end

tap2:AddSeperator("Auto Function ( Muitl )")

if OldWorld then
    function autoNew() 
        if game.Players.LocalPlayer.Data.Level.Value >= 700 then
            autofarmV1 = false
            if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                EquipWeapon("Key")
                TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                wait(1)
                Fast_Delay = false
            elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
                if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") or game.ReplicatedStorage:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
                            repeat wait()
                                pcall(function()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    EquipWeapon(SelectToolWeapon)
                                    v.Humanoid:ChangeState(11)
                                    TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    Fast_Delay = true
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                end)
                            until v.Humanoid.Health <= 0 or not v.Parent
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
                            repeat wait()
                                pcall(function()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    EquipWeapon(SelectToolWeapon)
                                    v.Humanoid:ChangeState(11)
                                    TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    Fast_Delay = true
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                end)
                            until v.Humanoid.Health <= 0 or not v.Parent
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end
                else
                    Fast_Delay = false
                    TP2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                end
            else
                Fast_Delay = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        end
    end

    spawn(function()
        while wait(.1) do
            pcall(function()
                if V1 or New_World then
                    autoNew()
                end
            end)
        end
    end)

    tap2:AddToggle("Auto NewWorld", _G.Setting.NewWorld, function(v)
        New_World = v
        if v == false then
            wait(0.1)
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
end

if NewWorld then
    function AutoSwan_() 
        if game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
            TP2(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                    if v.Name == "Don Swan [Lv. 1000] [Boss]" then
                        if v.Humanoid.Health > 0 then
                            repeat wait()
                                EquipWeapon(SelectToolWeapon)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                Fast_Delay = true
                            until v.Humanoid.Health <= 0 or not v.Parent
                        end
                    end
                end
            end
            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                if game.ReplicatedStorage:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                    if v.Name == "Don Swan [Lv. 1000] [Boss]" then
                        if v.Humanoid.Health > 0 then
                            repeat wait()
                                EquipWeapon(SelectToolWeapon)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                Fast_Delay = true
                            until v.Humanoid.Health <= 0 or not v.Parent
                        end
                    end
                end
            end
        end
    end
    function AutoBartilo_() 
        if game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
            if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Swan Pirate [Lv. 775]" then
                            pcall(function()
                                repeat wait()
                                    EquipWeapon(SelectToolWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    Pos_ = v.HumanoidRootPart.CFrame
                                    MagnetBatilo = true
                                    Fast_Delay = true
                                    until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                MagnetBatilo = false
                            end)
                        end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if v.Name == "Swan Pirate [Lv. 775]" then
                            pcall(function()
                                repeat wait()
                                    EquipWeapon(SelectToolWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    Pos_ = v.HumanoidRootPart.CFrame
                                    MagnetBatilo = true
                                    Fast_Delay = true
                                    until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                MagnetBatilo = false
                            end)
                        end
                    end
                else
                    Fast_Delay = true
                    MagnetBatilo = false
                    TP(CFrame.new(1057.92761, 137.614319, 1242.08069))
                end
            else
                TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
                if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    wait(1.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                end
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
            if QuestBartilo == nil then
                TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
            end
            if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                wait(1.1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                QuestBartilo = 1
            end
            if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == "Jeremy [Lv. 850] [Boss]" then
                        repeat wait()
                            EquipWeapon(SelectToolWeapon)
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,6))
                            Fast_Delay = true
                        until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false
                    end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if v.Name == "Jeremy [Lv. 850] [Boss]" then
                        repeat wait()
                            EquipWeapon(SelectToolWeapon)
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,6))
                            Fast_Delay = true
                        until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false
                    end
                end
            else
                if QuestBartilo == 1 then
                    TP(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))
                end
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
            Fast_Delay = false
            TP2(game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.CFrame)
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.CFrame
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.CFrame
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.CFrame
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.CFrame
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.CFrame
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.CFrame
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.CFrame
            wait(.5)
        end
    end
    function AutoThird_() 
        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 then
            V1 = false
            autofarmV1 = false
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") == 0 then
                TP2(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                    wait(1.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                end
                wait(2)
                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "rip_indra [Lv. 1500] [Boss]" then
                                repeat wait()
                                    pcall(function()
                                        EquipWeapon(SelectToolWeapon)
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,25,25))
                                        FoundIndra = true
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                    end)
                                until v.Humanoid.Health <= 0 or not v.Parent
                            end
                        end
                    end
                elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                    TP(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                end
            end
        end
    end
    spawn(function()
        while wait(.1) do
            pcall(function()
                if AutoSwan then
                    AutoSwan_()
                end
                if AutoThirdWorld then
                    AutoThird_()
                end
                if AutoBartilo then
                    AutoBartilo_()
                end
            end)
        end
    end)
end
if NewWorld then
    tap2:AddToggle("Auto ThirdWorld", _G.Setting.LegendarySword, function(v)
        LegendarySword = v
        if v == false then
            wait(0.1)
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    tap2:AddToggle("Auto ThirdWorld", _G.Setting.ThirdWorld, function(v)
        AutoThirdWorld = v
        if v == false then
            wait(0.1)
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    tap2:AddToggle("Auto Bartilo", _G.Setting.Bartilo, function(v)
        AutoBartilo = v
        if v == false then
            wait(0.1)
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    tap2:AddToggle("Auto Swan", _G.Setting.Swan, function(v)
        AutoSwan = v
        if v == false then
            wait(0.1)
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible = false
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
end

local tap3 = Library:AddTab("Stats")

tap3:AddSeperator("Stats")

spawn(function()
	while wait(.1) do
		if melee then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if def then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if sword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", 1)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if gun then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", 1)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if DevilFruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 1)
		end
	end
end)

spawn(function()
	while wait() do
        if AutoStat or V1 then            
            if game.Players.LocalPlayer.Data.Stats.Melee.Level.Value <= 2400 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
			end
		end
	end
end)

tap3:AddToggle("Auto Melee", _G.Setting.Melee, function(v)
    melee = v
end)

tap3:AddToggle("Auto Defense", _G.Setting.Defense, function(v)
    def = v
end)

tap3:AddToggle("Auto Sword", _G.Setting.Sword, function(v)
    sword = v
end)

tap3:AddToggle("Auto Gun", _G.Setting.Gun, function(v)
    gun = v
end)

tap3:AddToggle("Auto DevilFruit", _G.Setting.DevilFruit, function(v)
    DevilFruit = v
end)

tap3:AddSeperator("Stats Kaiton")

tap3:AddToggle("Auto Stats Kaiton", _G.Setting.StatKaiton, function(v)
    AutoStat = v
end)

local tap4 = Library:AddTab("Teleports")

if OldWorld then
    TPselect = {
        "Jones Salad",
        "Marine 1",
        "Marine 2",
        "Midle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Frozen Village",
        "Colosseum",
        "Prison",
        "Mob Leader",
        "Magma Village",
        "UnderWater Gate",
        "UnderWater City",
        "Fountain City",
        "Sky 1",
        "Sky 2",
        "Sky 3"
    }
elseif NewWorld then
    TPselect = {
        "Dock",
        "Mansion",
        "Kingdom Of Rose",
        "Cafe",
        "Sunflower Field",
        "Jeramy Mountain",
        "Colossuem",
        "Factory",
        "The Bridge",
        "Green Bit",
        "Graveyard",
        "Dark Area",
        "Snow Mountain",
        "Hot Island",
        "Cold Island",
        "Ice Castle",
        "Usopp's Island",
        "inscription Island",
        "Forgotten Island",
        "Ghost Ship"
    }
elseif ThreeWorld then
    TPselect = {
        "Port Town",
        "Hydra Island",
        "Gaint Tree",
        "Mansion",
        "Castle on the Sea",
        "Graveyard Island",
        "Icecream Island",
        "Peanut Island",
        "Cookie Island",
        "Sea of treats",
        "New island",
        "Lab",
        "MysticIsland"
    }
end

function TP(CFgo)
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude < 150 then
        pcall(function()
            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo
            return
        end)
    end
    local CP = game:GetService("Players").LocalPlayer.Character
    local LPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    local tween_s = game:service"TweenService"
    local LP = game.Players.LocalPlayer
    local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/320, Enum.EasingStyle.Linear), {CFrame = CFgo})
    tween:Play()
    if not tween then
        return tween
    end
end

function TP2(CFgo)
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude < 150 then
        pcall(function()
            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo
            return
        end)
    end
    local CP = game:GetService("Players").LocalPlayer.Character
    local LPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    local tween_s = game:service"TweenService"
    local LP = game.Players.LocalPlayer
    local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear), {CFrame = CFgo})
    tween:Play()
    if not tween then
        return tween
    end
end

function ByPass(Pos)
    pcall(function()
        if ByPass_TP then
            NameTP = Pos
            game.Players.LocalPlayer.Character.Head:Destroy()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos 
            wait(.35)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif ByPass_TP == false then
            pcall(function()
                TP(Pos)
                task.wait()
                TP2(Pos)
            end)
        end
    end)
end

spawn(function()
    while wait(.5) do 
        pcall(function()
            if TPLocal then
                if ByPass_TP == false then
                    TPPos = true
                    tweenTP()
                elseif ByPass_TP then
                    TPPos = false
                    tweenTP()
                    task.wait()
                    game.Players.LocalPlayer.Character.Head:Destroy()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NameTP
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NameTP
                    for i = 1,5 do
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                end
            end
        end)
    end
end)

function tweenTP()
    if true then
        if OldWorld then
            if TweenNameMap == "Jones Salad" then
                ByPass(CFrame.new(1042.1501464844, 16.299360275269, 1444.3442382813))
            elseif TweenNameMap == "Marine1" then
                ByPass(CFrame.new(-2599.6655273438, 6.9146227836609, 2062.2216796875))
            elseif TweenNameMap == "Marine2" then
                ByPass(CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188))
            elseif TweenNameMap == "Midle Town" then
                ByPass(CFrame.new(-655.97088623047, 7.878026008606, 1573.7612304688))
            elseif TweenNameMap == "Jungle" then
                ByPass(CFrame.new(-1499.9877929688, 22.877912521362, 353.87060546875))
            elseif TweenNameMap == "Pirate Village" then
                ByPass(CFrame.new(-1163.3889160156, 44.777843475342, 3842.8276367188))
            elseif TweenNameMap == "Desert" then
                ByPass(CFrame.new(954.02056884766, 6.6275520324707, 4262.611328125))
            elseif TweenNameMap ==  "Frozen Village" then
                ByPass(CFrame.new(1144.5270996094, 7.3292083740234, -1164.7322998047))
            elseif TweenNameMap == "Colosseum" then
                ByPass(CFrame.new(-1667.5869140625, 39.385631561279, -3135.5817871094))
            elseif TweenNameMap == "Prison" then
                ByPass(CFrame.new(4857.6982421875, 5.6780304908752, 732.75750732422))
            elseif TweenNameMap ==  "Mob Leader" then
                ByPass(CFrame.new(-2841.9604492188, 7.3560485839844, 5318.1040039063))
            elseif TweenNameMap == "Magma Village" then
                ByPass(CFrame.new(-5328.8740234375, 8.6164798736572, 8427.3994140625))
            elseif TweenNameMap == "UnderWater Gate" then
                ByPass(CFrame.new(3893.953125, 5.3989524841309, -1893.4851074219))
            elseif TweenNameMap == "UnderWater City" then
                ByPass(CFrame.new(61191.12109375, 18.497436523438, 1561.8873291016))
            elseif TweenNameMap == "Fountain City" then
                ByPass(CFrame.new(5244.7133789063, 38.526943206787, 4073.4987792969))
            elseif TweenNameMap == "Sky1" then
                ByPass(CFrame.new(-4878.0415039063, 717.71246337891, -2637.7294921875))
            elseif TweenNameMap == "Sky2" then
                ByPass(CFrame.new(-7899.6157226563, 5545.6030273438, -422.21798706055))
            elseif TweenNameMap == "Sky3" then
                ByPass(CFrame.new(-7868.5288085938, 5638.205078125, -1482.5548095703))
            end
        elseif NewWorld then
            if TweenNameMap == "Dock" then
                ByPass(CFrame.new(-12.519311904907, 19.302536010742, 2827.853515625))
            elseif TweenNameMap == "Mansion" then
                ByPass(CFrame.new(-390.34829711914, 321.89730834961, 869.00506591797))
            elseif TweenNameMap == "Kingdom Of Rose" then
                ByPass(CFrame.new(-388.29895019531, 138.35575866699, 1132.1662597656))
            elseif TweenNameMap == "Cafe" then
                ByPass(CFrame.new(-379.70889282227, 73.0458984375, 304.84692382813))
            elseif TweenNameMap == "Sunflower Field" then
                ByPass(CFrame.new(-1576.7171630859, 198.61849975586, 13.725157737732))
            elseif TweenNameMap == "Jeramy Mountain" then
                ByPass(CFrame.new(1986.3519287109, 448.95678710938, 796.70239257813))
            elseif TweenNameMap == "Colossuem" then
                ByPass(CFrame.new(-1871.8974609375, 45.820514678955, 1359.6843261719))
            elseif TweenNameMap == "Factory" then
                ByPass(CFrame.new(349.53750610352, 74.446998596191, -355.62420654297))
            elseif TweenNameMap == "The Bridge" then
                ByPass(CFrame.new(-1860.6354980469, 88.384948730469, -1859.1593017578))
            elseif TweenNameMap == "Green Bit" then
                ByPass(CFrame.new(-2202.3706054688, 73.097663879395, -2819.2687988281))
            elseif TweenNameMap == "Graveyard" then
                ByPass(CFrame.new(-5617.5927734375, 492.22183227539, -778.3017578125))
            elseif TweenNameMap == "Dark Area" then
                ByPass(CFrame.new(3464.7700195313, 13.375151634216, -3368.90234375))
            elseif TweenNameMap == "Snow Mountain" then
                ByPass(CFrame.new(561.23834228516, 401.44781494141, -5297.14453125))
            elseif TweenNameMap == "Hot Island" then
                ByPass(CFrame.new(-5505.9633789063, 15.977565765381, -5366.6123046875))
            elseif TweenNameMap == "Cold Island" then
                ByPass(CFrame.new(-5924.716796875, 15.977565765381, -4996.427734375))
            elseif TweenNameMap == "Ice Castle" then
                ByPass(CFrame.new(6111.7109375, 294.41259765625, -6716.4829101563))
            elseif TweenNameMap == "Usopp's Island" then
                ByPass(CFrame.new(4760.4985351563, 8.3444719314575, 2849.2426757813))
            elseif TweenNameMap == "inscription Island" then
                ByPass(CFrame.new(-5099.01171875, 98.241539001465, 2424.4035644531))
            elseif TweenNameMap == "Forgotten Island" then
                ByPass(CFrame.new(-3051.9514160156, 238.87203979492, -10250.807617188))
            elseif TweenNameMap == "Ghost Ship" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif ThreeWorld then
            if TweenNameMap == "Port Town" then
                ByPass(CFrame.new(-275.21615600586, 43.755737304688, 5451.0659179688))
            elseif TweenNameMap == "Hydra Island" then
                ByPass(CFrame.new(5541.2685546875, 668.30456542969, 195.48069763184))
            elseif TweenNameMap == "Gaint Tree" then
                ByPass(CFrame.new(2276.0859375, 25.87850189209, -6493.03125))
            elseif TweenNameMap == "Mansion" then
                ByPass(CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375))
            elseif TweenNameMap == "Castle on the Sea" then
                ByPass(CFrame.new(-5498.0458984375, 313.79473876953, -2860.6022949219))
            elseif TweenNameMap == "Graveyard Island" then
                ByPass(CFrame.new(-9515.07324, 142.130615, 5537.58398))
            elseif TweenNameMap == "Icecream Island" then
                ByPass(CFrame.new(-880.894531, 118.245354, -11030.7607))
            elseif TweenNameMap == "Peanut Island" then
                ByPass(CFrame.new(-2124.06738, 44.0723495, -10179.8281))
            elseif TweenNameMap == "Cookie Island" then
                ByPass(CFrame.new(-1862.953857421875, 40.08573532104492, -11810.9052734375))
            elseif TweenNameMap == "Sea of treats" then
                ByPass(CFrame.new(226.3279571533203, 37.14205551147461, -12237.6240234375))
            elseif TweenNameMap == "New island" then
                ByPass(CFrame.new(-1078.72607421875, 16.64043426513672, -14476.9814453125))
            elseif TweenNameMap == "Lab" then
                ByPass(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
            elseif TweenNameMap == "MysticIsland" then
                TP(game:GetService("Workspace").Map:FindFirstChild("MysticIsland").HumanoidRootPart.CFrame * CFrame.new(0,500,-100))
            end
        end
    end
end

tap4:AddSeperator("Teleports")

tap4:AddDropdown("Select Teleport", TPselect, function(lol)
    TweenNameMap = lol
end)

tap4:AddToggle("Bypass Teleport", _G.Setting.BypassTeleport, function(v)
    ByPass_TP = v
end)

ByPass_TP = true
task.wait()
ByPass_TP = false

tap4:AddToggle("Teleport", false, function(v)
    TPLocal = v
    if v == false then
        TPPos = false
        wait(.1)
        TP2(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame)
        TP2(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame)
    end
end)

tap4:AddSeperator("Support Warp Teleports")

tap4:AddButton("Mansion ( Warp )", function()
    if OldWorld then
        game.Players.LocalPlayer:Kick("Not Support ( ThreeWorld )")
    elseif NewWorld then
        game.Players.LocalPlayer:Kick("Not Support ( ThreeWorld )")
    elseif ThreeWorld then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Turtle.TradeTable.P1.CFrame
    end
end)

local tap5 = Library:AddTab("Dungeon")

tap5:AddSeperator("Raid")

spawn(function()
    while task.wait() do
        pcall(function()
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if Killaura then
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        pcall(function()
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.Humanoid.Health = 0 / 1
                            v.Humanoid:ChangeState(15)
                            v.Humanoid:TakeDamage(99999999999)
                        end)
                    end
                end
            end
            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                if KillauraAll then
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        pcall(function()
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.Humanoid.Health = 1 / 0 
                            v.Humanoid:ChangeState(15)
                            v.Humanoid:TakeDamage(99999999999)
                        end)
                    end
                end
            end
            pcall(function()
                if not OldWorld and NextIsland then
                    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                        TP2(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame * CFrame.new(0,50,0))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                        TP2(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame * CFrame.new(0,50,0))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                        TP2(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame * CFrame.new(0,50,0))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                        TP2(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame * CFrame.new(0,50,0))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                        TP2(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame * CFrame.new(0,50,0))
                    elseif NewWorld then
                        TP2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                    elseif ThreeWorld then
                        TP2(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
                    end
                end
                if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                    if BuyRaid then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", SelectRaid)
                    end  
                end
                if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
                    if NewWorld then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    elseif ThreeWorld then
                        fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    end
                end
            end)
        end)
    end
end)

tap5:AddDropdown("Select Raid", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha","Bird: Phoenix","Dough"}, function(v)
    SelectRaid = v
end)

tap5:AddToggle("Kill Aura", _G.Setting.KillAura, function(v)
    Killaura = v
end)

tap5:AddToggle("Kill Aura All Mob ( Rick )", _G.Setting.KillAuraAll, function(v)
    KillauraAll = v
end)

tap5:AddToggle("Auto Next Island", _G.Setting.NextIsland, function(v)
    NextIsland = v
    TweenTpRaid = v
    if v == false then
        wait(.1)
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        TP2(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

tap5:AddToggle("Auto Raid", _G.Setting.BuyRaid, function(v)
    BuyRaid = v
    NextIsland = v 
    TweenTpRaid = v
    wait(10)
    Killaura = v
end)

tap5:AddSeperator("Awake Fruit")

spawn(function()
	while wait(.5) do
        pcall(function()
			if RaidAwaken then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
                task.wait()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
			end
		end)
	end
end)

tap5:AddToggle("Auto Awake Fruit", _G.Setting.AwakeFruit, function(v)
    RaidAwaken = v
end)

local tap6 = Library:AddTab("Item & Buy")
tap6:AddSeperator("ResetStats & Reroll race")

tap6:AddButton("Reset Stat [ 2500 F ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end)

tap6:AddButton("Reroll race [ 3000 F ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end)

tap6:AddSeperator("Abilities")

tap6:AddButton("Skyjump", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
end)

tap6:AddButton("Buso Haki", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
end)

tap6:AddButton("Soru", function()
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
end)

tap6:AddButton("Ken Haki", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
end)

tap6:AddSeperator("Fighting Styles V.1")

tap6:AddButton("Dark Step",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
end)

tap6:AddButton("Electric",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
end)

tap6:AddButton("Water Kung Fu",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
end)

tap6:AddButton("Dragon Claw",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(u"BlackbeardReward","DragonClaw","1")
    task.wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
end)

tap6:AddSeperator("Fighting Styles V.2")

tap6:AddButton("Death Step",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
end)

tap6:AddButton("Electric Claw",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
end)

tap6:AddButton("Sharkman Karate",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end)

tap6:AddButton("Dragon Breath",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
end)

tap6:AddSeperator("Fighting Styles Misc")

tap6:AddButton("Superhuman",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
end)

tap6:AddButton("Godhuman",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
end)

local tap8 = Library:AddTab("Misc")

tap8:AddSeperator("Misc")

tap8:AddButton("Join Pirates Team", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
end)

tap8:AddButton("Join Marines Team",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines")
end)

if _G.Setting["AFK"] then
    warn("AFK : On")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        local vu = game:GetService("VirtualUser")
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end

tap8:AddButton("AFK", function()
    warn("AFK : On")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        local vu = game:GetService("VirtualUser")
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

tap8:AddToggle("Magnet 200", _G.Setting.Magnet_200, function(v)
    CustamMagNet = v
end)

tap8:AddToggle("Bring Fruit", _G.Setting.BringFruit, function(v)
	BringFruit = v
end)

tap8:AddToggle("Auto Haki", _G.Setting.Haki, function(v)
    Haki_Toggle = v
end)

tap8:AddToggle("Nocilp", _G.Setting.Noclip, function(v)
    NoClip_Toggle = v
end)

tap8:AddToggle("DamageCounter", _G.Setting.DamageCounter, function(v)
    game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = v
end)

tap8:AddToggle("White Screen", _G.Setting.WhiteScreen, function(v)
    White_Screen = v
    wait(.25)
    if v == false then 
        game:GetService("RunService"):Set3dRenderingEnabled(true)
        pcall(setfpscap(2000))
        game.Lighting.FogEnd = 2500
    end
end)


spawn(function()
    while wait(.1) do
        pcall(function()
            if White_Screen then
                if White_Screen then
                    game.Lighting.FogEnd = math.huge
                    if game:GetService("Lighting"):FindFirstChild("FantasySky") then game:GetService("Lighting").FantasySky:Destroy() end
                    game:GetService("RunService"):Set3dRenderingEnabled(false)
                    pcall(setfpscap(30))
                end
            end
        end)
    end
end)

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local File = pcall(function()
	AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)

if not File then
	table.insert(AllIDs, actualHour)
	writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

function TPReturner()
	local Site;
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i,v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) then
			for _,Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
				if tonumber(actualHour) ~= tonumber(Existing) then
					local delFile = pcall(function()
						--delfile("NotSameServers.json")
						AllIDs = {}
						table.insert(AllIDs, actualHour)
					end)
				end
			end
			num = num + 1
		end
		if Possible == true then
			table.insert(AllIDs, ID)
			wait()
			pcall(function()
				--writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
				wait()
				game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
			end)
			end
		end
	end
end

tap8:AddButton("Hop Server",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "plz wait!!",
        Duration = 5
    })
    wait(.1)
    for index = 1,10 do
        TPReturner()
    end
end)

tap8:AddButton("Rejoin",function()
    local L_1 = game.PlaceId
    game:GetService('TeleportService'):Teleport(L_1)
end)

tap8:AddButton("Fps Boost",function()
	local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

tap8:AddSeperator("Auto Open & Buy")

if ThreeWorld then
    spawn(function()
        while wait(.1) do
            if AutoBuySurprise then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end
    end)

    tap8:AddToggle("Buy Bone Surprise", _G.Setting.Surprise,function(v)
        AutoBuySurprise = v
    end)

    tap8:AddButton("Buy Bone Surprise",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
    end)
end

tap8:AddButton("Open Fruit Shop",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Coming Soon",
        Duration = 25
    })
end)

tap8:AddButton("Open Awakening",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Coming Soon",
        Duration = 25
    })
end)

tap8:AddButton("Open Haki",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification System", 
        Text = "Coming Soon",
        Duration = 25
    })
end)

task.spawn(function()
	if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
		game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
			pcall(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
					game.Players.LocalPlayer.Character.Stun.Value = 0
				end
			end)
		end)
	end
end)
