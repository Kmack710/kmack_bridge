print('^4 [kmack_bridge] ^6 Loaded Custom Notifications^7')

local Notis = {}

function Notis.Success(source, message, time)
    TriggerClientEvent('okokNotify:Alert', source, ' ', message, time or 5000, 'success', false)
end

function Notis.Error(source, message, time)
    TriggerClientEvent('okokNotify:Alert', source, ' ', message, time or 5000, 'error', false)
end

function Notis.Info(source, message, time)
    TriggerClientEvent('okokNotify:Alert', source, ' ', message, time or 5000, 'info', false)
end

function Notis.Warn(source, message, time)
    TriggerClientEvent('okokNotify:Alert', source, ' ', message, time or 5000, 'warning', false)
end

return Notis