local QBCore = exports['qb-core']:GetCoreObject()
print('^4 [kmack_bridge] ^1 Loaded QB-Core Framework')
local Framework = {}

function Framework.PlayerDataS(source)
    local data = QBCore.Functions.GetPlayer(source)
    if data ~= nil then
        local pJob = data.PlayerData.job
        pJob.Grade = {}
        pJob.Grade.name = pJob.grade.name
        pJob.Grade.label = pJob.grade.name
        pJob.Grade.level = pJob.grade.level
        local Pdata = {
            Pid = data.PlayerData.citizenid,
            Name = data.PlayerData.charinfo.firstname .. " " .. data.PlayerData.charinfo.lastname,
            Identifier = data.PlayerData.license,
            Bank = data.Functions.GetMoney("bank"),
            Cash = data.Functions.GetMoney('cash'),
            Source = data.PlayerData.source,
            Job = pJob,
            AddBankMoney = function(amount) data.Functions.AddMoney("bank", amount) end,
            RemoveBankMoney = function(amount) data.Functions.RemoveMoney("bank", amount) end,
            AddCash = function(amount) data.Functions.AddMoney("cash", amount) end,
            RemoveCash = function(amount) data.Functions.RemoveMoney("cash", amount) end,
            SetJob = function(job, grade) data.Functions.SetJob(job, grade) end,
            Gang = data.PlayerData.gang,
            SetGang = data.Functions.SetGang,
        }
        return Pdata
    else
        return false
    end
end

function Framework.GetPlayerFromPidS(pid)
    local Player = QBCore.Functions.GetPlayerByCitizenId(pid)
    if Player then
        return Framework.PlayerDataS(Player.PlayerData.source)
    else
        return false
    end
end

function Framework.CreateUseableItem(item, cb)
    QBCore.Functions.CreateUseableItem(item, cb)
end

function Framework.OfflinePlayerPayment(pid, amount)


end

return Framework