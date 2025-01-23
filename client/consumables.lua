---@description Player State Manager
local playerState = LocalPlayer.state

function InitPlayerAltState()
    playerState:set("isAltered", false, false)
end

---@description Player Effects Manager
local WaitForEffect = 2000

function Drunk(animSet, timecycle, duration)
    if playerState.isAltered then return end
    if not animSet then return lib.print.error("Drunk Function - animSet is nil") end
    if not duration then return lib.print.error("Drunk Function - duration is nil") end

    playerState.isAltered = true

    Wait(WaitForEffect)

    lib.requestAnimSet(animSet, 500)
    local playerPed = cache.ped or PlayerPedId()
    SetPedIsDrunk(playerPed, true)
    SetTimecycleModifier(timecycle)
    SetPedConfigFlag(playerPed, 100, true)
    SetPedMovementClipset(playerPed, animSet, 1.0)

    Wait(duration*1000)

    ClearTimecycleModifier()
    SetPedIsDrunk(playerPed, false)
    SetPedConfigFlag(playerPed, 100, false)
    ResetPedMovementClipset(playerPed, 1.0)
    RemoveAnimSet(animSet)

    playerState.isAltered = false
end

function OnDrugs(animSet, timecycle, duration)
    if playerState.isAltered then return end
    if not animSet then return lib.print.error("OnDrugs Function - animSet is nil") end
    if not timecycle then return lib.print.error("OnDrugs Function - timecycle is nil") end
    if not duration then return lib.print.error("OnDrugs Function - duration is nil") end

    playerState.isAltered = true

    Wait(WaitForEffect)

    lib.requestAnimSet(animSet, 500)
    local playerPed = cache.ped or PlayerPedId()
    SetTimecycleModifier(timecycle)
    SetPedMotionBlur(playerPed, true)
    SetPedConfigFlag(playerPed, 100, true)
    SetPedMovementClipset(playerPed, animSet, 1.0)

    Wait(duration*1000)

    ClearTimecycleModifier()
    SetPedMotionBlur(playerPed, false)
    SetPedConfigFlag(playerPed, 100, false)
    ResetPedMovementClipset(playerPed, 1.0)
    RemoveAnimSet(animSet)

    playerState.isAltered = false
end

function Doped(duration)
    if playerState.isAltered then return end
    if not duration then return lib.print.error("Doped Function - duration is nil") end

    playerState.isAltered = true

    Wait(WaitForEffect)

    AnimpostfxPlay("BeastIntroScene", 1000, false)
    local playerIndex = cache.playerId or PlayerId()
    local dopedDuration = math.max(0, duration)
    CreateThread(function()
        while dopedDuration > 0 do
            Wait(1000)
            RestorePlayerStamina(playerIndex, 1.0)
            dopedDuration -= 1
        end
    end)

    playerState.isAltered = false
end

RegisterNetEvent("melons_consumables:client:drunk", function(duration)
    Drunk("MOVE_M@DRUNK@MODERATEDRUNK", "spectator5", duration)
end)

RegisterNetEvent("melons_consumables:client:verydrunk", function(duration)
    Drunk("MOVE_M@DRUNK@VERYDRUNK", "spectator5", duration)
end)

RegisterNetEvent("melons_consumables:client:ondrugs", function(duration)
    OnDrugs("move_m@hipster@a", "MP_corona_switch", duration)
end)

RegisterNetEvent("melons_consumables:client:onheavydrugs", function(duration)
    OnDrugs("MOVE_M@DRUNK@VERYDRUNK", "spectator5", duration)
end)

RegisterNetEvent("melons_consumables:client:doped", Doped)