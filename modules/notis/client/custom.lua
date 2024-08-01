local Notis = {}

function Notis.Success(message, time)
    exports['okokNotify']:Alert(' ', message, time or 5000, 'success', false)
end

function Notis.Error(message, time)
    exports['okokNotify']:Alert(' ', message, time or 5000, 'error', false)
end

function Notis.Info(message, time)
    exports['okokNotify']:Alert(' ', message, time or 5000, 'info', false)
end

function Notis.Warn(message, time)
    exports['okokNotify']:Alert(' ', message, time or 5000, 'warning', false)
end

return Notis