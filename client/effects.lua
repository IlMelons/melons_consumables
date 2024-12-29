function Drunk(type, duration)
    if type == "drunk" then
        animSet = "MOVE_M@DRUNK@MODERATEDRUNK"
    elseif type == "heavydrunk" then
        animSet = "MOVE_M@DRUNK@VERYDRUNK"
    else
        return print("[ERROR]: Drunk Function - Received wrong effect type, fix it.")
    end
    lib.requestAnimSet(animSet, 500)

    local playerPed = PlayerPedId()
    SetPedIsDrunk(playerPed, true)
    SetTimecycleModifier("spectator5")
    SetPedConfigFlag(playerPed, 100, true)
    SetPedMovementClipset(playerPed, animSet, 1.0)

    Wait(duration*1000)

    ClearTimecycleModifier()
    SetPedIsDrunk(playerPed, false)
    SetPedConfigFlag(playerPed, 100, false)
    ResetPedMovementClipset(playerPed, 1.0)

    RemoveAnimSet(animSet)
end

RegisterNetEvent("melons_consumables:client:drunk", function(duration)
    Drunk("drunk", duration)
end)

RegisterNetEvent("melons_consumables:client:heavydrunk", function(duration)
    Drunk("heavydrunk", duration)
end)