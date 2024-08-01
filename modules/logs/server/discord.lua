print('^4 [kmack_bridge]  Loaded Discord Logs^7')

local Logs = {}
local APIKey = 'DISCORD_WEBHOOK' 

function Logs.Create(source, Pid, resource, event, message)
    if APIKey == 'DISCORD_WEBHOOK' then
        print('^1 [kmack_bridge] ^7You need to set a webhook in modules/logs/server/discord.lua')
        return
    end
    ---- by default all logs will be pushed to one webhook, to change this you can do something like this below
    --   if resource == 'kmack_lib' then
    --     APIKey = 'DISCORD_WEBHOOK' --- enter new webhook here specific for kmack_lib logs
    --   elseif resource == 'kmack_bridge' then
    --     APIKey = 'DISCORD_WEBHOOK' --- enter new webhook here specific for kmack_bridge logs
    --   end

    local embeds = {
        {
            title = 'Resource: '..resource,
            description = 'Player: '..Pid..'\nEvent: '..event..'\nMessage: '..message,
            color = 16711680,
            footer = {
                text = 'kmack_bridge Logs',
            },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%S')
        }
    }
    --- push to discord
    PerformHttpRequest(APIKey, function(err, text, headers) end, 'POST', json.encode({embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

return Logs