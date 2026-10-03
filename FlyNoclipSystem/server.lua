ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('FlyNoclipSystem:ToggleFly')
AddEventHandler('FlyNoclipSystem:ToggleFly', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local identifier = xPlayer.identifier
        
        MySQL.Async.fetchScalar('SELECT fly_permission FROM fly_noclip_permissions WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(hasPermission)
            if hasPermission then
                local isFlying = not xPlayer.get('isFlying')
                xPlayer.set('isFlying', isFlying)
                TriggerClientEvent('FlyNoclipSystem:SetFly', source, isFlying)
            else
                TriggerClientEvent('esx:showNotification', source, 'You do not have permission to use fly.')
            end
        end)
    end
end)

RegisterServerEvent('FlyNoclipSystem:ToggleNoclip')
AddEventHandler('FlyNoclipSystem:ToggleNoclip', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local identifier = xPlayer.identifier
        
        MySQL.Async.fetchScalar('SELECT noclip_permission FROM fly_noclip_permissions WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(hasPermission)
            if hasPermission then
                local isNoclip = not xPlayer.get('isNoclip')
                xPlayer.set('isNoclip', isNoclip)
                TriggerClientEvent('FlyNoclipSystem:SetNoclip', source, isNoclip)
            else
                TriggerClientEvent('esx:showNotification', source, 'You do not have permission to use noclip.')
            end
        end)
    end
end)