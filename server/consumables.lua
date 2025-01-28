local function isValidEffect(effect)
    return type(effect) == "table" and type(effect.type) == "string" and type(effect.name) == "string" and type(effect.duration) == "number"
end

local function isValidStatus(status)
    return type(status) == "table" and (type(status.hunger) == "number" or type(status.thirst) == "number" or type(status.stress) == "number")
end

exports("consumable", function(event, item, inventory)
    local effect = item.server.effect
    local status = item.server.status
    if event == "usingItem" then
        if status and not isValidStatus(status) then
            lib.print.error("Status not valid for item "..item.name)
            return false
        end
        if effect and not isValidEffect(effect) then
            lib.print.error("Effect not valid for item "..item.name)
            return false
        end
        return
    end

    if event == "usedItem" then
        if effect then
            TriggerClientEvent("melons_consumables:client:"..effect.name, inventory.id, effect.duration)
        end
        if status then
            return SetPlayerStatus(inventory.id, status)
        end
    end
end)

function SetPlayerStatus(source, status)
    if status.hunger then
        server.AddHunger(source, status.hunger)
    end
    if status.thirst then
        server.AddThirst(source, status.thirst)
    end
    if status.stress then
        server.RelieveStress(source, status.stress)
    end
end