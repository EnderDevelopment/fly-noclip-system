local isFlying = false
local isNoclip = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if IsControlJustPressed(1, Config.FlyKey) then
            TriggerServerEvent('FlyNoclipSystem:ToggleFly')
        end
        
        if IsControlJustPressed(1, Config.NoclipKey) then
            TriggerServerEvent('FlyNoclipSystem:ToggleNoclip')
        end
        
        if isFlying or isNoclip then
            local playerPed = PlayerPedId()
            
            if isFlying then
                DisableControlAction(0, 21, true) -- Disable sprint
                DisableControlAction(0, 22, true) -- Disable jump
                
                if IsControlPressed(0, 32) then -- W key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = -math.sin(math.rad(heading)) * Config.FlySpeed
                    local forwardY = math.cos(math.rad(heading)) * Config.FlySpeed
                    SetEntityVelocity(playerPed, forwardX, forwardY, 0.0)
                end
                
                if IsControlPressed(0, 33) then -- S key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = math.sin(math.rad(heading)) * Config.FlySpeed
                    local forwardY = -math.cos(math.rad(heading)) * Config.FlySpeed
                    SetEntityVelocity(playerPed, forwardX, forwardY, 0.0)
                end
                
                if IsControlPressed(0, 34) then -- A key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = -math.sin(math.rad(heading + 90)) * Config.FlySpeed
                    local forwardY = math.cos(math.rad(heading + 90)) * Config.FlySpeed
                    SetEntityVelocity(playerPed, forwardX, forwardY, 0.0)
                end
                
                if IsControlPressed(0, 35) then -- D key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = -math.sin(math.rad(heading - 90)) * Config.FlySpeed
                    local forwardY = math.cos(math.rad(heading - 90)) * Config.FlySpeed
                    SetEntityVelocity(playerPed, forwardX, forwardY, 0.0)
                end
                
                if IsControlPressed(0, 22) then -- Space key
                    SetEntityVelocity(playerPed, 0.0, 0.0, Config.FlySpeed)
                end
                
                if IsControlPressed(0, 36) then -- Left Ctrl key
                    SetEntityVelocity(playerPed, 0.0, 0.0, -Config.FlySpeed)
                end
            end
            
            if isNoclip then
                SetEntityCollision(playerPed, false, false)
                SetEntityVisible(playerPed, false, false)
                
                if IsControlPressed(0, 32) then -- W key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = -math.sin(math.rad(heading)) * Config.NoclipSpeed
                    local forwardY = math.cos(math.rad(heading)) * Config.NoclipSpeed
                    SetEntityCoordsNoOffset(playerPed, GetEntityCoords(playerPed) + vector3(forwardX, forwardY, 0.0), true, true, true)
                end
                
                if IsControlPressed(0, 33) then -- S key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = math.sin(math.rad(heading)) * Config.NoclipSpeed
                    local forwardY = -math.cos(math.rad(heading)) * Config.NoclipSpeed
                    SetEntityCoordsNoOffset(playerPed, GetEntityCoords(playerPed) + vector3(forwardX, forwardY, 0.0), true, true, true)
                end
                
                if IsControlPressed(0, 34) then -- A key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = -math.sin(math.rad(heading + 90)) * Config.NoclipSpeed
                    local forwardY = math.cos(math.rad(heading + 90)) * Config.NoclipSpeed
                    SetEntityCoordsNoOffset(playerPed, GetEntityCoords(playerPed) + vector3(forwardX, forwardY, 0.0), true, true, true)
                end
                
                if IsControlPressed(0, 35) then -- D key
                    local heading = GetEntityHeading(playerPed)
                    local forwardX = -math.sin(math.rad(heading - 90)) * Config.NoclipSpeed
                    local forwardY = math.cos(math.rad(heading - 90)) * Config.NoclipSpeed
                    SetEntityCoordsNoOffset(playerPed, GetEntityCoords(playerPed) + vector3(forwardX, forwardY, 0.0), true, true, true)
                end
                
                if IsControlPressed(0, 22) then -- Space key
                    SetEntityCoordsNoOffset(playerPed, GetEntityCoords(playerPed) + vector3(0.0, 0.0, Config.NoclipSpeed), true, true, true)
                end
                
                if IsControlPressed(0, 36) then -- Left Ctrl key
                    SetEntityCoordsNoOffset(playerPed, GetEntityCoords(playerPed) + vector3(0.0, 0.0, -Config.NoclipSpeed), true, true, true)
                end
            end
        end
    end
end)

RegisterNetEvent('FlyNoclipSystem:SetFly')
AddEventHandler('FlyNoclipSystem:SetFly', function(fly)
    isFlying = fly
    if isFlying then
        SetEntityCollision(PlayerPedId(), false, false)
    else
        SetEntityCollision(PlayerPedId(), true, true)
    end
end)

RegisterNetEvent('FlyNoclipSystem:SetNoclip')
AddEventHandler('FlyNoclipSystem:SetNoclip', function(noclip)
    isNoclip = noclip
    if isNoclip then
        SetEntityCollision(PlayerPedId(), false, false)
        SetEntityVisible(PlayerPedId(), false, false)
    else
        SetEntityCollision(PlayerPedId(), true, true)
        SetEntityVisible(PlayerPedId(), true, false)
    end
end)