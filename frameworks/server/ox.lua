local Ox = require '@ox_core.lib.init'
print('^4 [kmack_bridge] ^3 Loaded OX Framework^7')
local Framework = {}

function Framework.PlayerDataS(source)
    local data = Ox.GetPlayer(source)
    if data ~= nil then
        local groupName, grade = data.getGroupByType('job')
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
            --local grade = data.getGroup(groupName)
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
        local money = exports.ox_inventory:GetItemCount(source, 'money')
        local Pdata = {
            Pid = data.stateId,
            CharId = data.charId, --- some things in ox will require this.
            Name = data.get("firstName").." "..data.get("lastName"),
            Identifier = data.identifier,
            Bank = data.getAccount().balance,
            Cash = money,
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
    local data = {
        bank = Player.getAccount().balance,
        cash = exports.ox_inventory:Search(source, 'count', 'money')
    }
    return data
end)

function Framework.GetPlayerFromPidS(pid)
    local charId = Ox.GetCharIdFromStateId(pid)
    local Player = Ox.GetPlayerFromFilter(charId)
    if Player.source then
        return Framework.PlayerDataS(Player.source)
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