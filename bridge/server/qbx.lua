if GetResourceState("qbx_core") ~= "started" then return end

---@diagnostic disable: duplicate-set-field
server = {}

function server.AddHunger(source, amount)
    local oldHunger = Player(source).state.hunger or 0
    local newHunger = oldHunger + amount
    newHunger = lib.math.clamp(newHunger, 0, 100)
    Player(source).state.hunger = newHunger
end

function server.AddThirst(source, amount)
    local oldThirst = Player(source).state.thirst or 0
    local newThirst = oldThirst + amount
    newThirst = lib.math.clamp(newThirst, 0, 100)
    Player(source).state.thirst = newThirst
end