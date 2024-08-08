print('^4 [kmack_bridge] ^3 Loaded ESX Framework^7')
local Framework = {}

function Framework.PlayerDataS(source)
    local data = ESX.GetPlayerFromId(source)
    if data ~= nil then
        local pJob = data.job
        pJob.Grade = {}
        pJob.Grade.name = data.job.grade_name
        pJob.Grade.label = data.job.grade_label
        pJob.Grade.level = data.job.grade
        local Pdata = {
            Pid = data.identifier,
            Name = data.name,
            Identifier = data.identifier,
            Bank = data.getAccount('bank').money,
            Cash = data.getMoney(),
            Source = source,
            Job = pJob,
            SetJob = data.setJob,
            AddCash = data.addMoney,
            RemoveMoney = data.removeMoney,
            AddBankMoney = function(amount) data.addAccountMoney('bank', amount) end,
            RemoveBankMoney = function(amount) data.removeAccountMoney('bank', amount) end,
            Gang = false, --- esx has no gang system by default so add your own functions here.
            SetGang = false,
        }
        return Pdata
    else
        return false
    end
end

function Framework.GetPlayerFromPidS(pid)
    local Player = ESX.GetPlayerFromIdentifier(pid)
    if Player ~= nil then
        return Framework.PlayerDataS(Player.source)
    else
        return false
    end
end

function Framework.OfflinePlayerPayment(pid, amount)


end

function Framework.CreateUseableItem(item, cb)
    ESX.RegisterUsableItem(item, cb)
end


return Framework