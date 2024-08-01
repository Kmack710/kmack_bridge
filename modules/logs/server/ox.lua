print('^4 [kmack_bridge]  Loaded ox_lib Logs^7')

local Logs = {}

local APIKey = 'YOUR_API' --- not used since its handled in ox_lib

function Logs.Create(source, Pid, resource, event, message)
    lib.logger(Pid, event, message, resource..","..source)
end

return Logs