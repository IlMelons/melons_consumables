if GetResourceState("es_extended") ~= "started" then return end
if GetResourceState("esx_status") ~= "started" then return end

---@diagnostic disable: duplicate-set-field, lowercase-global
server = {}

---@description ONLY BETA SPERIMENTATION (ESX HAVE A METHOD LIKE THIS RESOURCE BUT CLIENT SIDE) 

function server.AddHunger(src, amount)
    TriggerClientEvent("esx_status:add", src, "hunger", amount * 10000)
end

function server.AddThirst(src, amount)
    TriggerClientEvent("esx_status:add", src, "thirst", amount * 10000)
end

function server.RelieveStress(src, amount)
    --- STRESS NOT SUPPORTED ON ESX FROM WHAT I SEE
    --- ADD YOUR OWN STRESS SYSTEM
end