local Notis = {}

function Notis.Success(message, time)
    local data = {
        type = 'success',
        description = message,
        duration = time or 5000,
    }
    lib.notify(data)
end

function Notis.Error(message, time)
    local data = {
        type = 'error',
        description = message,
        duration = time or 5000,
    }
    lib.notify(data)
end

function Notis.Info(message, time)
    local data = {
        type = 'inform',
        description = message,
        duration = time or 5000,
    }
    lib.notify(data)
end

function Notis.Warn(message, time)
    local data = {
        type = 'warning',
        description = message,
        duration = time or 5000,
    }
    lib.notify(data)
end

return Notis