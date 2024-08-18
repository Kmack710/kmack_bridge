local Ox = require '@ox_core.lib.init'
print('^4 [kmack_bridge] ^3 Loaded OX Framework^7')
local Framework = {}

local plLoaded = false

function Framework.PlayerDataC()
    while not plLoaded do
        Wait(250)
    end
    local data = Ox.GetPlayer()
    local groups = data.getGroups()
    local groupName = data.get('activeGroup')
    local pJob
    if groupName == nil then
        pJob = {
            name = 'citizen',
            label = 'Citizen',
            Grade = {
                name = 'none',
                label = 'None',
                level = 0
            }
        }
    else
        local grade = data.getGroup(groupName)
         pJob = {
            name = groupName,
            label = GlobalState['group.'..groupName].label,
            Grade = {
                name = string.lower(GlobalState['group.'..groupName].grades[grade]),
                label = GlobalState['group.'..groupName].grades[grade],
                level = grade
            }
        }
    end
    local accounts = lib.callback.await('kmack_bridge:getAccountBalances', false)
    local balances = {
        bank = accounts.bank,
        cash = accounts.cash
    }
    local Pdata = {

        Pid = data.stateId,
        CharId = data.charId, --- some things in ox will require this.
        Name = data.get("firstName").." "..data.get("lastName"),
        Bank = balances.bank,
        Cash = balances.cash,
        Source = GetPlayerServerId(PlayerId()),
        Job = pJob,
        Gang = false, --- no gang support in ox yet that i know of.
    }
    return Pdata
end

--- kmack_bridge:playerLoaded 
AddEventHandler('ox:playerLoaded', function()
    TriggerEvent('kmack_bridge:playerLoaded')
    plLoaded = true
end)

AddEventHandler('ox:playerLogout', function()
    TriggerEvent('kmack_bridge:playerUnLoaded')
    plLoaded = false
end)

return Framework