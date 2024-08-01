local Logs = {}


local APIKey = 'YOUR_API'

function Logs.Create(source, Pid, resource, event, message)
    if APIKey == 'YOUR_API' then
        print('^1 [kmack_bridge] ^7You need to set a API key in modules/logs/server/custom.lua')
        return
    end
    --- use any custom logs here with the data provided above
end

return Logs