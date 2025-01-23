---@diagnostic disable: duplicate-set-field, lowercase-global

if GetResourceState("qbx_core") ~= "started" then return end

server = {}

function server.AddHunger(source, amount)
    local playerState = Player(source).state
    local oldHunger = playerState.hunger or 0
    local newHunger = oldHunger + amount
    newHunger = lib.math.clamp(newHunger, 0, 100)

    playerState.hunger = newHunger
end

function server.AddThirst(source, amount)
    local playerState = Player(source).state
    local oldThirst = playerState.thirst or 0
    local newThirst = oldThirst + amount
    newThirst = lib.math.clamp(newThirst, 0, 100)

    playerState.thirst = newThirst
end

function server.RelieveStress(source, amount)
    local playerState = Player(source).state
    local oldStress = playerState.stress or 0
    local newStress = oldStress - amount
    newStress = lib.math.clamp(newStress, 0, 100)

    playerState.stress = newStress
end