local Ox = require '@ox_core.lib.init'
print('^4 [kmack_bridge] ^3 Loaded OX Framework^7')
local Framework = {}

function Framework.PlayerDataS(source)
    local data = Ox.GetPlayer(source)
    if data ~= nil then
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
        local accounts = data.getAccounts()
        local accountid
        for k,v in pairs(accounts) do
            if v.isDefault and v.type == 'personal' then
                accountid = v.id
                break
            end
        end
        local Pdata = {
            Pid = data.stateId,
            Name = data.get("firstName").." "..data.get("lastName"),
            Identifier = data.identifier,
            Bank = data.getAccount(accountid).balance,
            Cash = function() return exports.ox_inventory:Search(source, 'count', 'money') end,
            Source = data.source,
            Job = pJob,
            AddBankMoney = function(amount) Ox.DepositMoney(source, accountid, amount) end,
            RemoveBankMoney = function(amount) Ox.WithdrawMoney(source, accountid, amount) end,
            AddCash = function(amount) exports.ox_inventory:AddItem(source, 'money', amount) end,
            RemoveCash = function(amount) exports.ox_inventory:RemoveItem(source, 'money', amount) end,
            SetJob = function(job, grade) data.setGroup(job, grade) end,
            Gang = false, --- no gang support in ox yet that i know of. 
            SetGang = false,
        }
        return Pdata
    else
        return false
    end
end

lib.callback.register('kmack_bridge:getAccountBalances', function(source)
    local Player = Ox.GetPlayer(source)
    local accounts = Player.getAccounts()
    local accountid
    for k,v in pairs(accounts) do
        if v.isDefault and v.type == 'personal' then
            accountid = v.id
            break
        end
    end
    local data = {
        bank = Player.getAccount(accountid).balance,
        cash = exports.ox_inventory:Search(source, 'count', 'money')
    }
    return data
end)

function Framework.GetPlayerFromPidS(pid)
    local Player = Ox.GetCharIdFromStateId(pid)
    if Player then
        return Player
    else
        return false
    end
end

function Framework.CreateUseableItem(item, cb)
    ---- Not used as we do so directly in ox_inventory or other inventory systems.
end

function Framework.OfflinePlayerPayment(pid, amount)


end



return Framework