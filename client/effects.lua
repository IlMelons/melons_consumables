function Drunk(type, duration)
    if type == "drunk" then
        animSet = "MOVE_M@DRUNK@MODERATEDRUNK"
    elseif type == "heavydrunk" then
        animSet = "MOVE_M@DRUNK@VERYDRUNK"
    else
        return print("[ERROR]: Drunk Function - Received wrong effect type, fix it.")
    end
    lib.requestAnimSet(animSet, 500)

    local playerPed = cache.ped
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

function OnDrugs(type, duration)
    if type == "ondrugs" then
        animSet = "move_m@hipster@a"
        lib.requestAnimSet(animSet, 500)

        local playerPed = cache.ped
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(playerPed, true)
        SetPedConfigFlag(playerPed, 100, true)
        SetPedMovementClipset(playerPed, animSet, true)

        Wait(duration*1000)

        ClearTimecycleModifier()
        SetPedMotionBlur(playerPed, false)
        SetPedConfigFlag(playerPed, 100, false)
        ResetPedMovementClipset(playerPed, 1.0)
        RemoveAnimSet(animSet)
    elseif type == "onheavydrugs" then
        AnimpostfxPlay("DrugsTrevorClownsFightIn", 3.0, false)
        Wait(3000)
        AnimpostfxPlay("DrugsTrevorClownsFight", 3.0, false)
        Wait(duration*1000)
        AnimpostfxPlay("DrugsTrevorClownsFightOut", 3.0, false)
        AnimpostfxStop("DrugsTrevorClownsFight")
        AnimpostfxStop("DrugsTrevorClownsFightIn")
        AnimpostfxStop("DrugsTrevorClownsFightOut")
    else
        return print("[ERROR]: OnDrugs Function - Received wrong effect type, fix it.")
    end

    RemoveAnimSet(animSet)
end

RegisterNetEvent("melons_consumables:client:ondrugs", function(duration)
    OnDrugs("ondrugs", duration)
end)

RegisterNetEvent("melons_consumables:client:onheavydrugs", function(duration)
    OnDrugs("onheavydrugs", duration)
end)

function Doped(type, duration)
    local doped = true
    local dopedDuration = 0
    if type == "doped" then
        AnimpostfxPlay("BeastIntroScene", 500, false)
    elseif type == "heavydoped" then
        AnimpostfxPlay("BeastIntroScene", 1000, false)
    else
        return print("[ERROR]: Doped Function - Received wrong effect type, fix it.")
    end
    CreateThread(function()
        while doped do
            Wait(1000)
            RestorePlayerStamina(cache.playerId, 1.0)
            dopedDuration += 1
            if dopedDuration >= duration then
                doped = false
            end
        end
    end)
end

RegisterNetEvent("melons_consumables:client:doped", function(duration)
    Doped("doped", duration)
end)

RegisterNetEvent("melons_consumables:client:heavydoped", function(duration)
    Doped("heavydoped", duration)
end)