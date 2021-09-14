----Result here: https://streamable.com/h91m56
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
local GameGui = game.StarterGui:WaitForChild("GameGui")
local LoadoutFR = GameGui:WaitForChild("Loadout")
local Arma1 = LoadoutFR:WaitForChild("Arma1")
local Arma2 = LoadoutFR:WaitForChild("Arma2")
local Arma3 = LoadoutFR:WaitForChild("Arma3")
local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PastaEventos = ReplicatedStorage:WaitForChild("Eventos")
local Timer = PastaEventos:WaitForChild("Timer")
local Plr = game.Players.LocalPlayer

local template = script:WaitForChild("PlayerFrame")
local scroller = script.Parent:WaitForChild("PlayerScroller")

local Frame = script.Parent:WaitForChild("Frame")
local PlayerList = Frame:WaitForChild("TextLabel")
local JoinBtn = Frame:WaitForChild("Join")
local InGame = game:GetService("Players"):GetPlayers()
local Start = false
local Jogadores = 1


Frame.Visible = true
scroller.Visible= true
JoinBtn.Visible = true

function updatePlayers()

	for i, child in pairs(scroller:GetChildren()) do

		if child:IsA("Frame") then child:Destroy() end
	end


	for i, plr in pairs(game.Players:GetPlayers()) do

		local templateClone = template:Clone()
		local Time = plr.Team


		templateClone.Name = plr.Name		
		templateClone.DisplayName.Text = plr.DisplayName
		templateClone.RealName.Text = "@" .. plr.Name
		local TeamFR = templateClone:WaitForChild("Team")

		if plr.Team == plr.Neutral  then
			templateClone.TeamName.Text = "N/A"
			TeamFR.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431)
		elseif plr.Team == Teams:WaitForChild("Galatic Empire") then
			templateClone.TeamName.Text = "Galatic Empire"
			TeamFR.BackgroundColor3 = Color3.new(0.666667, 0, 0)
		elseif plr.Team == Teams:WaitForChild("Rebel Alliance") then
			templateClone.TeamName.Text = "Rebel Alliance"
			TeamFR.BackgroundColor3 = Color3.new(0, 0.333333, 0.498039)
		end


		game.Players.PlayerAdded:Connect(function()
			Jogadores += 1
			print(Jogadores)
		end)
		game.Players.PlayerRemoving:Connect(function()
			Jogadores -= 1
			print(Jogadores)
		end)



		Start = true

		if Start == true then
			JoinBtn.Visible = true
		end

		local part = Instance.new("Part")
		part.Shape = Enum.PartType.Cylinder
		part.Orientation = Vector3.new(0, -90, 0)
		part.Size = Vector3.new(1, 1, 1)
		part.Transparency = 1







		local camera = Instance.new("Camera")
		camera.CFrame = part.CFrame * CFrame.Angles(0, math.rad(90), 0) + Vector3.new(0, 0, 1.25)



		templateClone.Parent = scroller


		scroller.CanvasSize = UDim2.new(0, 0, 0, scroller.UIListLayout.AbsoluteContentSize.Y)




	end
end

updatePlayers()
game.Players.PlayerAdded:Connect(updatePlayers)
game.Players.PlayerRemoving:Connect(updatePlayers)



local camera = game.Workspace:WaitForChild("Camera")
local camera1 = game.Workspace:WaitForChild("CameraModos")
local camera2 = game.Workspace:WaitForChild("CameraModos2")
local camera3 = game.Workspace:WaitForChild("CameraModos3")
local screenGui = game.Players.LocalPlayer.PlayerGui:WaitForChild("GameGui")


repeat wait()
	camera.CameraType = Enum.CameraType.Scriptable
until camera.CameraType == Enum.CameraType.Scriptable
camera.CFrame = camera1.CFrame
camera.FieldOfView = 45


local StartFR = screenGui:WaitForChild("Starting")
local BlaFR = screenGui:WaitForChild("Bla")
local Sound = StartFR:WaitForChild("Resistencia")
local TweenService = game:GetService("TweenService")
local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0)
local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0)
local StartPos = UDim2.new(0.396,0,-1,0)
local StartPos2 = UDim2.new(0.396,0,0.394,0)
local BlaPos = UDim2.new(0,0,-2,0)
local BlaPos2 = UDim2.new(0,0,0,0)
local StartTween = TweenService:Create(StartFR, tweenInfo2, {Position=StartPos2})
local StartTween2 = TweenService:Create(StartFR, tweenInfo2, {Position=StartPos})
local BlaTween = TweenService:Create(BlaFR, tweenInfo2, {Position=BlaPos2})
local BlaTween2 = TweenService:Create(BlaFR, tweenInfo2, {Position=BlaPos})
local Time = StartFR:WaitForChild("Timer")
local CurrentTimer = screenGui:WaitForChild("Timer")
local MinutosLabel = CurrentTimer:WaitForChild("Minutos")
local SegundosLabel = CurrentTimer:WaitForChild("Segundos")
local PontosLabel = CurrentTimer:WaitForChild("pontos")
local Full = 10
local Minutes = 10
local Seconds = 00
local HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local char = game.Players.LocalPlayer.Character
local LOCAL_SCRIPT = char:WaitForChild("local")
LOCAL_SCRIPT.Disabled = true

function iniciar()
	if Start == true then 
		game.ReplicatedStorage.Eventos.Start:FireServer()
		scroller.Visible = false
		Frame.Visible = false
		print(Start)
		StartTween:Play()
		repeat
			Full -= 1
			Time.Text = Full
			wait(1)
		until Full == 0
		StartFR.Visible = false
		StartTween2:Play()
		Sound:Play()
		Sound.Looped = true
		BlaTween:Play()
		wait(4)
		camera.CFrame = camera2.CFrame
		BlaTween2:Play()
		wait(4)
		BlaTween:Play()
		wait(2)
		camera.CFrame = camera3.CFrame
		BlaTween2:Play()
		wait(4)
		BlaTween:Play()
		HRP.CFrame = game.Workspace:WaitForChild("spawn").CFrame
		LOCAL_SCRIPT.Disabled = false
		wait(2)
		camera.CameraType = Enum.CameraType.Custom
		BlaTween2:Play()
		camera.FieldOfView = 60
		Sound.Volume  = 0.5
		Timer:FireServer()
		CurrentTimer.Visible = true


	end
end

game.ReplicatedStorage.Eventos.Timer.OnClientEvent:Connect(function(MINUTOS, SEGUNDOS)

	MinutosLabel.Text = MINUTOS
	SegundosLabel.Text = SEGUNDOS
	local acabando = false


	if SEGUNDOS < 10 then 
		SegundosLabel.Text = "0"..SEGUNDOS
	end
	if MINUTOS < 10 then 
		MinutosLabel.Text = "0"..MINUTOS
	end

	if MINUTOS == 0 and SEGUNDOS <= 30 then 
		MinutosLabel.TextStrokeColor3 = Color3.new(0.866667, 0, 0.0117647)
		SegundosLabel.TextStrokeColor3 = Color3.new(0.866667, 0, 0.0117647)
		PontosLabel.TextStrokeColor3 = Color3.new(0.866667, 0, 0.0117647)

	end
	if MINUTOS == 0 and SEGUNDOS <= 10 then
		acabando = true
		repeat wait()

			MinutosLabel.Visible = false
			SegundosLabel.Visible = false
			wait(1)
			MinutosLabel.Visible = true
			SegundosLabel.Visible = true
			if SEGUNDOS < 10 then
				SegundosLabel.Text = "0"..SEGUNDOS
			end
		until SEGUNDOS <= 0 or MINUTOS <= 0
	end


end)

local need = 1


Arma1.MouseButton1Click:Connect(function()
    
end)

Arma2.MouseButton1Click:Connect(function()
    
end)

Arma3.MouseButton1Click:Connect(function()
    
end)


JoinBtn.MouseButton1Click:Connect(function()
	if #InGame >= need then
		iniciar()
	else
		PlayerList.Text = "Need".." " ..need - #InGame .. " ".."more players to start"
		wait(2)
		PlayerList.Text = "Player List"		
	end
end)
