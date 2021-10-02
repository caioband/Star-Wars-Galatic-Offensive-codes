local Anim = script.Animations
local Meshes = script.Meshes
local Upper = Instance.new("Animation")
local Slam = Instance.new("Animation")
Upper.AnimationId = "rbxassetid://7609222851"
Slam.AnimationId = "rbxassetid://7609237740"
local KP = game:GetService("KeyframeSequenceProvider")
local Debris = game:GetService("Debris")


local Handler = {

	MeleeAnim = {
		["L"] = Anim.Combo1,
		["LL"] = Anim.Combo2,
		["LLL"] = Anim.Combo3,
		["LLLL"] = Anim.Combo4,
		["LLLLL"] = Anim.Combo5
	}
}


function Handler.getAnim(Humanoid,seq)
	local lentgh = 0

	local ks = KP:GetKeyframeSequenceAsync(Handler.MeleeAnim[seq].AnimationId)
	local kf = ks:GetKeyframes()

	for i = 1, #kf do 
		local Time = kf[i].Time
		if Time < lentgh then
			lentgh = Time

		end

	end
	return Humanoid.Animator:LoadAnimation(Handler.MeleeAnim[seq]),lentgh

end

function Handler.create(plr, char, hrp)
	local FH = game.ReplicatedStorage["Fire Hand"]:Clone()
	local FHC = FH:Clone()
	local rh = hrp.Parent:FindFirstChild("RightHand")
	local lh = hrp.Parent:FindFirstChild("LeftHand")
	FH.Parent = rh
	FHC.Parent = lh
	FH.Enabled = false
	FHC.Enabled = false
	local V = plr.Values.Last
	local HitV = plr.Values.HitV
	local animator = char.Humanoid:WaitForChild("Animator")
	local UpperKF = animator:LoadAnimation(Upper)
	local SlamKF = animator:LoadAnimation(Slam)
	local hrp = char:WaitForChild("HumanoidRootPart")
	local folder  = Instance.new("Folder")
	folder.Name = plr.Name.."Combat"
	folder.Parent = workspace
	Debris:AddItem(folder, .25)

	local Hitbox = Meshes.Hitbox:Clone()
	Hitbox.CFrame =  hrp.CFrame * CFrame.new(0,0,-2)
	Hitbox.Parent = folder 

	local weld = Instance.new("ManualWeld")
	weld.Part0 = Hitbox
	weld.Part1 = hrp
	weld.C0 = weld.Part0.CFrame:ToObjectSpace(weld.Part1.CFrame)
	weld.Parent = weld.Part0


	local conn 
	conn = Hitbox.Touched:connect(function()end)
	local res = Hitbox:GetTouchingParts()


	coroutine.wrap(function()
		for i, obj in pairs(res) do

			if not obj:IsDescendantOf(char) then
				local ehum = obj.Parent:FindFirstChild("Humanoid")
				local ehrp = obj.Parent:FindFirstChild("HumanoidRootPart")
				
				
				print(ehum)
				if ehum and ehum.Health > 0 then
					Hitbox:Destroy()

					if conn then
						conn:Disconnect()
					end
					if HitV.Value == 4 then
						
						local bv = Instance.new("BodyVelocity", ehrp)
						bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						bv.Velocity =  Vector3.new(0,100,0)
						UpperKF:Play()
						Debris:AddItem(bv, 0.25)
						wait(.25)
						ehrp.Anchored = true
						hrp.Anchored = true
						hrp.Position = ehrp.Position + Vector3.new(0,15,0)
						FH.Enabled = true
						FHC.Enabled = true
						SlamKF:Play()
						
						bv:Destroy()
						SlamKF.Stopped:connect(function()
							FH.Enabled = false
							FHC.Enabled = false
							ehrp.Anchored = false
							local bv2 = Instance.new("BodyVelocity", ehrp)
							bv2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
							bv2.Velocity =  Vector3.new(0,-40,0)
							
							wait(0.5)
							hrp.Anchored = false
							bv2:Destroy()
							ehum:TakeDamage(1000000)
							HitV.Value = 0
							

						end)
					end
					local bv = Instance.new("BodyVelocity", ehrp)
					bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					bv.Velocity = hrp.CFrame.LookVector * 10
					ehum:TakeDamage(10)
					HitV.Value += 1
					Debris:AddItem(bv, 0.2)
					wait(0.2)
					bv:Destroy()
					
					break
				end
			end
		end
	end)()

	task.delay(.25, function()
		if conn then
			conn:Disconnect()
		end
	end)
end


return Handler
