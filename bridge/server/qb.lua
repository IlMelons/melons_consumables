if GetResourceState("qb-core") ~= "started" then return end

local QBCore = exports["qb-core"]:GetCoreObject()

---@diagnostic disable: duplicate-set-field
server = {}

function server.AddHunger(source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local oldHunger = Player.PlayerData.metadata["hunger"] or 0
    local newHunger = oldHunger + amount
    newHunger = lib.math.clamp(newHunger, 0, 100)

    Player.Functions.SetMetaData("hunger", newHunger)
end

function server.AddThirst(source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local oldThirst = Player.PlayerData.metadata["thirst"] or 0
    local newThirst = oldThirst + amount
    newThirst = lib.math.clamp(newThirst, 0, 100)

    Player.Functions.SetMetaData("thirst", newThirst)
end