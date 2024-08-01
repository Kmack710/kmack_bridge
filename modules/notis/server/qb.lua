print('^4 [kmack_bridge] ^8 Loaded QB Notifications^7')

local Notis = {}

function Notis.Success(source, message, time)
    TriggerClientEvent('QBCore:Notify', source, message, 'success', time or 5000)
end

function Notis.Error(source, message, time)
    TriggerClientEvent('QBCore:Notify', source, message, 'error', time or 5000)
end

function Notis.Info(source, message, time)
    TriggerClientEvent('QBCore:Notify', source, message, 'primary', time or 5000)
end

function Notis.Warn(source, message, time)
    TriggerClientEvent('QBCore:Notify', source, message, 'warn', time or 5000)
end

return Notis