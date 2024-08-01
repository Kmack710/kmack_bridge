local Notis = {}

function Notis.Success(message, time)
    ESX.ShowNotification(message, 'success', time)
end

function Notis.Error(message, time)
    ESX.ShowNotification(message, 'error', time)
end

function Notis.Info(message, time)
    ESX.ShowNotification(message, 'info', time)
end

function Notis.Warn(message, time)
    ESX.ShowNotification(message, 'error', time)
end

return Notis