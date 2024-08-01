print('^4 [kmack_bridge] ^6 Loaded ESX Notifications^7')

local Notis = {}

function Notis.Success(source, message, time)
    TriggerClientEvent('esx:showNotification', source, message, 'success', time or 5000)
end

function Notis.Error(source, message, time)
    TriggerClientEvent('esx:showNotification', source, message, 'error', time or 5000)
end

function Notis.Info(source, message, time)
    TriggerClientEvent('esx:showNotification', source, message, 'info', time or 5000)
end

function Notis.Warn(source, message, time)
    TriggerClientEvent('esx:showNotification', source, message, 'error', time or 5000)
end

return Notis