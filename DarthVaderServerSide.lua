local ReplicatedStorage = game.ReplicatedStorage
local Tween = game:GetService("TweenService")

local Ligar_Tween = TweenInfo.new(
	0.1,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out,
	0,
	false,
	0.1
)

local Tween_Choke = TweenInfo.new(
	5,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local Desligar_Tween = TweenInfo.new(
	0.15,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

ReplicatedStorage.Eventos.TocarSom.OnServerEvent:Connect(function(Player,Som)
	local Sabre = workspace:FindFirstChild(Player.Name .. " Sabre")
	Sabre.Punho:FindFirstChild(Som):Play()
end)

ReplicatedStorage.Eventos.TocarSomCharacter.OnServerEvent:Connect(function(Player,Som)
	local Head = Player.Character.Head
	Head:FindFirstChild(Som):Play()
end)

ReplicatedStorage.Eventos.PararSom.OnServerEvent:Connect(function(Player,Som)
	local Sabre = workspace:FindFirstChild(Player.Name .. " Sabre")
	Sabre.Punho:FindFirstChild(Som):Stop()
end)

ReplicatedStorage.Eventos.Choke.OnServerEvent:Connect(function(Player,Camera)
	local Union = ReplicatedStorage.Storage.HitPart:Clone()
	local Weld = Instance.new("Weld",Union)
	Union.Parent = workspace
	Union.CFrame = Player.Character.RightHand.CFrame * CFrame.new(0,0,-5)
	Weld.Part0 = Union
	Weld.Part1 = Player.Character.LeftHand
	Weld.C0 = Weld.C1 * CFrame.new(0,0,-8) * CFrame.fromOrientation(0,math.rad(-90),math.rad(90))
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://7224715868"
	local AnimTrack
	Union.Touched:Connect(function(Touch)
		if Touch:IsA("BasePart") and Touch.Parent:FindFirstChild("Humanoid") then
			if Touch.Parent.Values.Choke.Value == false then
				Touch.Parent.Values.Choke.Value = true
				AnimTrack = Touch.Parent.Humanoid.Animator:LoadAnimation(Anim)
				Touch.Parent.HumanoidRootPart.Anchored = true
				Tween:Create(Touch.Parent.HumanoidRootPart,Tween_Choke,{CFrame = Touch.Parent.HumanoidRootPart.CFrame * CFrame.new(0,2,0)}):Play()
				AnimTrack:Play()
			end
		end
	end)
	wait(9.5)
	Union:Destroy()
	Player.PlayerGui.DarthVaderGui.Tempo_Q.Value.Value = 20
	Player.PlayerGui.DarthVaderGui.Tempo_Q.Visible = true
	repeat
		Player.PlayerGui.DarthVaderGui.Tempo_Q.Value.Value -= 1
		Player.PlayerGui.DarthVaderGui.Tempo_Q.Text = Player.PlayerGui.DarthVaderGui.Tempo_Q.Value.Value
		wait(1)
	until Player.PlayerGui.DarthVaderGui.Tempo_Q.Value.Value == 0
	Player.PlayerGui.DarthVaderGui.Tempo_Q.Visible = false
end)

ReplicatedStorage.Eventos.Ligar.OnServerEvent:Connect(function(Player)
	local Sabre = workspace:FindFirstChild(Player.Name .. " Sabre")
	Tween:Create(Sabre.Sabre,Ligar_Tween,{Size = Vector3.new(4.625,0.2,0.2)}):Play()
	Tween:Create(Sabre.Luz,Ligar_Tween,{Size = Vector3.new(4.625,0.2,0.2)}):Play()
	Sabre.Sabre.Transparency = 0.5
	Sabre.Luz.Transparency = 0
	Sabre.Luz.Trail.Enabled = true
end)

ReplicatedStorage.Eventos.TiroRefletido.OnServerEvent:Connect(function(Player,Alvo,Cframe,Posicao)
	local laser = Instance.new("Part")
	laser.Name = "Tiro"
	laser.Size = Vector3.new(0.2, 0.2, 0.2)
	laser.Anchored = true
	laser.CanCollide = false
	laser.CanTouch = true
	laser.Locked = true
	laser.BrickColor = BrickColor.new("Really red")
	laser.CFrame = Cframe
	laser.Parent = workspace
	local maxDistance = 200
	local curDistance = 0
	local stepDistance = 4
	local stepWait = 0
	local currentPos = Posicao
	local currentNormal = Alvo
	local function Step(overrideDistance)
		local params = RaycastParams.new()
		local direction = currentNormal * (overrideDistance or stepDistance)
		params.FilterType = Enum.RaycastFilterType.Blacklist
		params.FilterDescendantsInstances = {script.Parent}
		local result = workspace:Raycast(currentPos, direction)
		local pos
		if result then
			pos = result.Position
		else
			pos = currentPos + direction
		end
		laser.Size = Vector3.new(0.4, 0.4, (pos - currentPos).Magnitude)
		laser.CFrame = CFrame.new(currentPos:Lerp(pos, 0.5), pos)
		local oldPos = currentPos
		currentPos = pos
		if result then
			local norm = result.Normal
			local reflect = (currentNormal - (2 * currentNormal:Dot(norm) * norm))
			currentNormal = reflect
			Step(stepDistance - (pos - oldPos).Magnitude)
			return
		end
		curDistance = (curDistance + (pos - oldPos).Magnitude)
		if curDistance > (maxDistance - 75) then
			local d = (curDistance - (maxDistance - 75)) / 75
			laser.Transparency = d
		end
		if curDistance < maxDistance then
			wait(stepWait)
			Step()
		end
	end
	Step()
	laser:Destroy()
end)

ReplicatedStorage.Eventos.MudarValue.OnServerEvent:Connect(function(Player,Value,ValueDoValue)
	Value = ValueDoValue
end)

ReplicatedStorage.Eventos.Desligar.OnServerEvent:Connect(function(Player)
	local Sabre = workspace:FindFirstChild(Player.Name .. " Sabre")
	Tween:Create(Sabre.Sabre,Desligar_Tween,{Size = Vector3.new(0.05, 0.2, 0.15)}):Play()
	Tween:Create(Sabre.Luz,Desligar_Tween,{Size = Vector3.new(0.05, 0.2, 0.15)}):Play()
	wait(0.15)
	Sabre.Sabre.Transparency = 1
	Sabre.Luz.Transparency = 1
	Sabre.Luz.Trail.Enabled = false
end)

ReplicatedStorage.Eventos.DarDano.OnServerEvent:Connect(function(Player,Dano,Pessoa)
	Pessoa:TakeDamage(Dano)
end)

ReplicatedStorage.Eventos.Morte.OnServerEvent:Connect(function(Player,NomeCharacter,CharacterAntigo)
	
	local CharacterClone = game.ReplicatedStorage.Characters:FindFirstChild(NomeCharacter):Clone()
	local ScriptAnimacao = script.Animate:Clone()
	CharacterClone.Parent = workspace
	CharacterClone.Name = Player.Name .. " Character"
	Player.Character = CharacterClone
	for i,v in pairs(CharacterClone.Scripts:GetDescendants()) do
		if v:IsA("LocalScript") or v:IsA("Script") then
			v.Parent = CharacterClone
			
		end
	end
ScriptAnimacao.Parent = CharacterClone
		CharacterAntigo:Destroy()
	
end)

ReplicatedStorage.Eventos.SetupSabre.OnServerEvent:Connect(function(Player,SabreNome)
	local SabreClonado = ReplicatedStorage.Sabres:FindFirstChild(SabreNome):Clone()
	local Weld = Instance.new("Weld",SabreClonado.PrimaryPart)
	SabreClonado.Name = Player.Name .. " Sabre"
	SabreClonado.Parent = workspace
	Weld.Name = "WeldMao"
	Weld.Part0 = SabreClonado.PrimaryPart
	Weld.Part1 = Player.Character.RightHand
	Weld.C0 = Weld.C1 * CFrame.new(0.225,-0.005,0.3) * CFrame.fromOrientation(0,math.rad(-90),0)
end)
