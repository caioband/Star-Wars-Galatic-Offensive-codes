local DSS = game:GetService("DataStoreService")
local PlrData = DSS:GetDataStore("PlrData")

local function PlayerEntra(plr)
    
    local info = Instance.new("Folder")
    info.Name = "info"
    info.Parent = plr
    
    local Mortes = Instance.new("IntValue")
    Mortes.Name = "Deaths"
    Mortes.Parent = info
    
    local Kills = Instance.new("IntValue")
    Kills.Name = "Kills"
    Kills.Parent = info
    
    local Level = Instance.new("IntValue")
    Level.Name = "Level"
    Level.Parent = info
    
    local XP = Instance.new("IntValue")
    XP.Name = "XP"
    XP.Parent = info
    
    local ID_Player = plr.UserId
    local data = PlrData:GetAsync(ID_Player)
    
    if data then
        Mortes.Value = data["Deaths"]
        Kills.Value = data["Kills"]
        Level.Value = data["Level"]
        XP.Value = data["XP"]
    else
        Mortes.Value = 0
        Kills.Value = 0
        Level.Value = 1
        XP.Value = 0
    end
    
end


local function CriarTable(plr)
    local Player_Status = {}
    for _, status in pairs(plr.info:GetChildren()) do
        Player_Status[status.name] = status.Value
    end
    return Player_Status
end

local function PlayerSaiu(plr)
    local Player_Status = CriarTable(plr)
    local   sucesso, erro = pcall(function()
        local ID_Player = plr.UserId
        PlrData:SetAsync(ID_Player,Player_Status)
        
    end)
    if not sucesso then
        warn("Ocorreu um erro"..erro)
    else
        print("Salvo com sucesso")
    end   
end

game.Players.PlayerAdded:Connect(PlayerEntra)
game.Players.PlayerRemoving:Connect(PlayerSaiu)
