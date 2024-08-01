local Notis = {}
local QBCore = exports['qb-core']:GetCoreObject()

function Notis.Success(message, time)
    QBCore.Functions.Notify(message, 'success', time)
end

function Notis.Error(message, time)
    QBCore.Functions.Notify(message, 'error', time)
end

function Notis.Info(message, time)
    QBCore.Functions.Notify(message, 'primary', time)
end

function Notis.Warn(message, time)
    QBCore.Functions.Notify(message, 'warn', time)
end

return Notis