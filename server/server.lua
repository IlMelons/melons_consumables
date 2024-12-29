exports("UseItem", function(event, item, inventory, data)
    local itemData = item.server.status
    if event == "usingItem" then
        if type(itemData) ~= "table" then
            print("[ERROR]: You need to set status for "..item.name .." to make it usable")
            return false
        end
        return
    end

    if event == "usedItem" then
        if itemData.effect then
            TriggerClientEvent("melons_consumables:client:"..itemData.effect, inventory.id, itemData.duration)
        end
        if itemData.hunger or itemData.thirst then
            return SetPlayerStatus(inventory.id, itemData)
        end
    end
end)

function SetPlayerStatus(source, data)
    if data.hunger then
        server.AddHunger(source, data.hunger)
    end
    if data.thirst then
        server.AddThirst(source, data.thirst)
    end
end