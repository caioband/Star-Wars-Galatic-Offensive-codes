local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")
local TS = game:GetService("TeleportService")


game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All,false)
local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")
local camera = game.Workspace:WaitForChild("Camera")
local MenuCam = workspace:WaitForChild("cameraS")
local MenuCam2 = workspace:WaitForChild("cameraS2")
local MenuCam3 = workspace:WaitForChild("cameraS3")
local MenuCam4 = workspace:WaitForChild("cameraS4")
local DuloCam = workspace:WaitForChild("cameraDulo")
local CaioCam = workspace:WaitForChild("cameraCaio")
local StarCam = workspace:WaitForChild("cameraStar")
local ModosCam = workspace:WaitForChild("CameraModos")


repeat wait()
	camera.CameraType = Enum.CameraType.Scriptable
until camera.CameraType == Enum.CameraType.Scriptable
camera.CFrame = MenuCam.CFrame
camera.FieldOfView = 45

local screenGui = game.Players.LocalPlayer.PlayerGui:WaitForChild("MenuGui")
local textLabel = screenGui.Frame:WaitForChild("Loading")
local MenuFR = screenGui:WaitForChild("Menu")
local CreditsFR = screenGui:WaitForChild("CreditsFR")
local DuloFR = CreditsFR:WaitForChild("Dulo")
local ProfileFR = screenGui:WaitForChild("Profile")
local P2 = ProfileFR:WaitForChild("P2")
local PlrImg = P2:WaitForChild("PlayerImage")
PlrImg.Image = game.Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)

local NameLabel = P2:WaitForChild("Name")
local LevelLabel = P2:WaitForChild("Level")
local DeathsLabel = P2:WaitForChild("Deaths")
local KillsLabel = P2:WaitForChild("Kills")
local KDRLabel = P2:WaitForChild("KDR")


NameLabel.Text = "Name:".." "..player.Name
LevelLabel.Text = "Level:".." "..player.info.Level.Value
DeathsLabel.Text = "Deaths:".." "..player.info.Deaths.Value
KillsLabel.Text = "Kills:".." "..player.info.Kills.Value



local PlayBtn = MenuFR:WaitForChild("Play")
local CreditBtn = MenuFR:WaitForChild("Credits")
local HelpBtn  = MenuFR:WaitForChild("Help")
local Frame = screenGui:WaitForChild("Frame")
local ModosFR = screenGui:WaitForChild("Modos")
local Play1 = ModosFR.Modo1:WaitForChild("Play1")
local Play2 = ModosFR.Modo2:WaitForChild("Play2")
local Play3 = ModosFR.Modo3:WaitForChild("Play3")
local BackModos = ModosFR:WaitForChild("Back")
local Sound = MenuFR:WaitForChild("CloneWars")
local Sound2 = MenuFR:WaitForChild("Vader")
local RepublicImage = screenGui.Frame:WaitForChild("Republic")
local bla = screenGui:WaitForChild("bla")
local DuloBackBtn = CreditsFR:WaitForChild("Back")
local NextBtn = CreditsFR:WaitForChild("Next")
local PreviousBtn = CreditsFR:WaitForChild("Previous")
local CaioFR = CreditsFR:WaitForChild("Caio")
local StarFR = CreditsFR:WaitForChild("Star")
local YPBtn = ModosFR:WaitForChild("YP")
local newSize = UDim2.new(0,200,0,200)
local newPos = UDim2.new(0.404,0,0.279,0)
local newSize2 = UDim2.new(0,1700,0,11)
local BlaSize = UDim2.new(-0.5,0,0,0)
local BlaPosition = UDim2.new(0,0,0.488,0)
local newSize3 = UDim2.new(1,0,1,0)
local MenuPos = UDim2.new(-1,0,0,0)
local newPos3 = UDim2.new(0,0,0,0)
local newSize4 = UDim2.new(0,210,0,60 )
local newPos4 = UDim2.new(0.226,0,0.417)
local newSize4b = UDim2.new(0,200,0, 50 )
local newPos4b = UDim2.new(0.216,0,0.407)
local newSize5 = UDim2.new(0,210,0,60)
local newPos5 = UDim2.new(0.206,0,0.546,0)
local newPos5b = UDim2.new(0.216,0,0.556,0)
local TransPos = UDim2.new(0,0,-1,0)
local PlrLevel = player.info.Level.Value


ReplicatedFirst:RemoveDefaultLoadingScreen()

local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0)
local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0)
local BlaTween = TweenService:Create(bla, tweenInfo2, {Size=newSize2})
local BlaTween2 = TweenService:Create(bla, tweenInfo2, {Size=newSize3, Position=newPos3})
local BlaTween3 = TweenService:Create(bla, tweenInfo2, {Position=newPos3})
local BlaTween4 = TweenService:Create(bla, tweenInfo2, {Position=TransPos})
local MenuTween = TweenService:Create(MenuFR, tweenInfo, {Position=newPos3})
local MenuTween2 = TweenService:Create(MenuFR, tweenInfo, {Position=MenuPos})
local HoverOverPlayBtn = TweenService:Create(PlayBtn, tweenInfo, {Position=newPos4 , Size=newSize4})
local LeavePlayBtn = TweenService:Create(PlayBtn, tweenInfo, {Position=newPos4b , Size=newSize4b})
local HoverOverCreditBtn = TweenService:Create(CreditBtn, tweenInfo, {Position=newPos5 , Size=newSize4})
local LeaveCreditBtn = TweenService:Create(CreditBtn, tweenInfo, {Position=newPos5b , Size=newSize4b})
local PlayBtn = MenuFR:WaitForChild("Play")
local Frame2 = screenGui:WaitForChild("Frame2")
local Start = false

function Transitions()
	while true do
		print("ta indo")

		Frame2.BackgroundTransparency -= 0.01

		wait()
		if Start == true then 
			print(Start)
			break
		end
		if Frame2.BackgroundTransparency <= 0 then

			if camera.CFrame == MenuCam.CFrame then
				print("hmmm")
				camera.FieldOfView = 45	
				Frame2.BackgroundTransparency = 0
				camera.CFrame = MenuCam2.CFrame
				wait(2)
				repeat wait()
					Frame2.BackgroundTransparency += 0.01
				until Frame2.BackgroundTransparency >= 1
				wait(8)



			elseif camera.CFrame == MenuCam2.CFrame then
				print("hmmm")
				Frame2.BackgroundTransparency = 0
				camera.CFrame = MenuCam3.CFrame
				wait(2)
				repeat wait()
					Frame2.BackgroundTransparency += 0.01
				until Frame2.BackgroundTransparency >= 1
				wait(8)


			elseif camera.CFrame == MenuCam3.CFrame then
				print("hmmm")
				Frame2.BackgroundTransparency = 0
				camera.CFrame = MenuCam4.CFrame
				camera.FieldOfView = 60
				wait(2)
				repeat wait()
					Frame2.BackgroundTransparency += 0.01
				until Frame2.BackgroundTransparency >= 1
				wait(8)


			elseif camera.CFrame == MenuCam4.CFrame then
				print("hmmm")
				Frame2.BackgroundTransparency = 0
				camera.CFrame = MenuCam.CFrame
				camera.FieldOfView = 60
				wait(2)
				repeat wait()
					Frame2.BackgroundTransparency += 0.01
				until Frame2.BackgroundTransparency >= 1
				wait(8)


			end
		end
	end
end


function Start()
	while true do
		wait()
		bla.BackgroundTransparency += 0.01
		if bla.BackgroundTransparency >= 1 or Start == true   then 
			print(Start)
			break
		end

	end 
	wait(8)
end

 
local ContentProvider = game:GetService("ContentProvider")
local Mapa = game.Workspace:GetChildren()

if not game:IsLoaded() then
    repeat 
        textLabel.Text = "Loading."
        wait(0.5)
        textLabel.Text = "Loading.."
        wait(0.5)
        textLabel.Text = "Loading..."
        wait(0.5)
    until game:IsLoaded()
    
    game.Loaded:Wait()
end
wait()

textLabel:Destroy()
RepublicImage:Destroy()
BlaTween:Play()
wait(1)
BlaTween2:Play()
wait(3)
Frame:Destroy()
Sound:Play()
MenuTween:Play()


player.info.XP.Changed:connect(function(NovoValor)
    if NovoValor >= 100 + PlrLevel*5 then
       game.ReplicatedStorage.XP:FireServer(player)
    end
    
end)

PlayBtn.MouseEnter:Connect(function()
	print("eae rapá")
	HoverOverPlayBtn:Play()
end)

PlayBtn.MouseLeave:Connect(function()
	LeavePlayBtn:Play()
end)

CreditBtn.MouseEnter:Connect(function()
	print("eae rapá2")
	HoverOverCreditBtn:Play()
end)

CreditBtn.MouseLeave:Connect(function()
	LeaveCreditBtn:Play()
end)

CreditBtn.MouseButton1Click:Connect(function()
	Start = true
	print(Start)
	Frame2.BackgroundTransparency = 1
	bla.Position = TransPos
	bla.Size = newSize3
	bla.BackgroundTransparency = 0
	BlaTween3:Play()
	MenuFR.Visible = false
	wait(2)
	camera.CFrame = DuloCam.CFrame
	BlaTween4:Play()
	wait(0.1)
	DuloFR.Visible = true
	CreditsFR.Visible = true
	NextBtn.Visible = true
	PreviousBtn.Visible = true
	DuloBackBtn.Visible = true
end)

DuloBackBtn.MouseButton1Click:Connect(function()
	if camera.CFrame == DuloCam.CFrame then
		Start = false 
		print(Start)
		Frame2.BackgroundTransparency = 1
		bla.Position = TransPos
		bla.Size = newSize3
		bla.BackgroundTransparency = 0
		BlaTween3:Play()
		wait(.1)
		MenuFR.Visible = true
		CreditsFR.Visible = false
		DuloFR.Visible = false
		NextBtn.Visible = false
		PreviousBtn.Visible = false
		DuloBackBtn.Visible = false
		wait(2)
		camera.CFrame = MenuCam.CFrame
		BlaTween4:Play()
		Transitions()
	elseif camera.CFrame == CaioCam.CFrame then
		Start = false 
		print(Start)
		Frame2.BackgroundTransparency = 1
		bla.Position = TransPos
		bla.Size = newSize3
		bla.BackgroundTransparency = 0
		BlaTween3:Play()
		wait(.1)
		MenuFR.Visible = true
		CreditsFR.Visible = false
		CaioFR.Visible = false
		NextBtn.Visible = false
		PreviousBtn.Visible = false
		DuloBackBtn.Visible = false
		wait(2)
		camera.CFrame = MenuCam.CFrame
		BlaTween4:Play()
		Transitions()
	elseif camera.CFrame == StarCam.CFrame then
		Start = false 
		print(Start)
		Frame2.BackgroundTransparency = 1
		bla.Position = TransPos
		bla.Size = newSize3
		bla.BackgroundTransparency = 0
		BlaTween3:Play()
		wait(.1)
		MenuFR.Visible = true
		CreditsFR.Visible = false
		StarFR.Visible = false
		NextBtn.Visible = false
		PreviousBtn.Visible = false
		DuloBackBtn.Visible = false
		wait(2)
		camera.CFrame = MenuCam.CFrame
		BlaTween4:Play()
		Transitions()
	end
end)

NextBtn.MouseButton1Click:Connect(function()
	if camera.CFrame == DuloCam.CFrame then 
		print(Start)
		Frame2.BackgroundTransparency = 1
		bla.Position = TransPos
		bla.Size = newSize3
		bla.BackgroundTransparency = 0
		NextBtn.Visible = false
		PreviousBtn.Visible = false
		DuloBackBtn.Visible = false
		DuloFR.Visible = false
		BlaTween3:Play()
		MenuFR.Visible = false
		wait(2)
		camera.CFrame = CaioCam.CFrame
		BlaTween4:Play()
		wait(0.1)
		CaioFR.Visible = true
		NextBtn.Visible = true
		PreviousBtn.Visible = true
		DuloBackBtn.Visible = true
		CreditsFR.Visible = true
	elseif camera.CFrame == CaioCam.CFrame then
		print(Start)
		Frame2.BackgroundTransparency = 1
		bla.Position = TransPos
		bla.Size = newSize3
		bla.BackgroundTransparency = 0
		NextBtn.Visible = false
		PreviousBtn.Visible = false
		DuloBackBtn.Visible = false
		CaioFR.Visible = false
		BlaTween3:Play()
		MenuFR.Visible = false
		wait(2)
		camera.CFrame = StarCam.CFrame
		BlaTween4:Play()
		wait(0.1)
		StarFR.Visible = true
		NextBtn.Visible = true
		PreviousBtn.Visible = true
		DuloBackBtn.Visible = true
		CreditsFR.Visible = true
		
		
	end
end)

PlayBtn.MouseButton1Click:Connect(function()
	local char = player.Character
	local HumR = char:WaitForChild("HumanoidRootPart")
	Start = true
	print(Start)
	Frame2.BackgroundTransparency = 1
	bla.Position = TransPos
	bla.Size = newSize3
	bla.BackgroundTransparency = 0
	BlaTween3:Play()
	MenuFR.Visible = false
	wait(2)
	ModosFR.Visible = true
	camera.CFrame = ModosCam.CFrame
	BlaTween4:Play()
	camera.FieldOfView = 60
	
end)

YPBtn.MouseButton1Click:Connect(function()
    BlaTween3:Play()
    ModosFR.Visible = false
    wait(2)
    ProfileFR.Visible = true
    BlaTween4:Play()
    
    
    
    
end)

Play1.MouseButton1Click:Connect(function()
	TS:Teleport(7220458680)
end)

Play2.MouseButton1Click:Connect(function()
end)

BackModos.MouseButton1Click:Connect(function()
	Start = false
	print(Start)
	Frame2.BackgroundTransparency = 1
	bla.Position = TransPos
	bla.Size = newSize3
	bla.BackgroundTransparency = 0
	BlaTween3:Play()
	ModosFR.Visible = false
	wait(2)
	MenuFR.Visible = true
	camera.CFrame = MenuCam.CFrame
	BlaTween4:Play()
	camera.FieldOfView = 45
	Transitions()
end)

Start()
Transitions()

