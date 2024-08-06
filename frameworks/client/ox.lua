local Ox = require '@ox_core.lib.init'
print('^4 [kmack_bridge] ^3 Loaded OX Framework^7')
local Framework = {}

function Framework.PlayerDataC()
    local data = Ox.GetPlayer()
    local groups = data.getGroups()
    local groupName, grade = data.getGroup(groups)
    local pJob = {
        name = groupName,
        label = GlobalState['group.'..groupName].label,
        Grade = {
            name = string.lower(GlobalState['group.'..groupName].grades[grade]),
            label = GlobalState['group.'..groupName].grades[grade],
            level = grade
        }
    }
    local accounts = lib.callback.await('kmack_bridge:getAccountBalances', false)
    local balances = {
        bank = accounts.bank,
        cash = accounts.cash
    }
    local Pdata = {

        Pid = data.stateId,
        Name = data.get("firstName").." "..data.get("lastName"),
        Bank = balances.bank,
        Cash = balances.cash,
        Source = GetPlayerServerId(PlayerId()),
        Job = pJob,
        Gang = false, --- no gang support in ox yet that i know of.
    }
    return Pdata
end

return Framework