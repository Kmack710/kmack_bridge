print('^4 [kmack_bridge] ^6 Loaded OX Notifications^7')

local Notis = {}

function Notis.Success(source, message, time)
    local data = {
        type = 'success',
        description = message,
        duration = time or 5000,
    }
    TriggerClientEvent('ox_lib:notify', source, data)
end

function Notis.Error(source, message, time)
    local data = {
        type = 'error',
        description = message,
        duration = time or 5000,
    }
    TriggerClientEvent('ox_lib:notify', source, data)
end

function Notis.Info(source, message, time)
    local data = {
        type = 'inform',
        description = message,
        duration = time or 5000,
    }
    TriggerClientEvent('ox_lib:notify', source, data)
end

function Notis.Warn(source, message, time)
    local data = {
        type = 'warning',
        description = message,
        duration = time or 5000,
    }
    TriggerClientEvent('ox_lib:notify', source, data)
end

return Notis