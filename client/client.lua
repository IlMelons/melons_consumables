AddEventHandler("onClientResourceStart", function(resourceName)
    if resourceName ~= cache.resource then return end
    InitPlayerAltState()
end)

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName ~= cache.resource then return end
    InitPlayerAltState()
end)