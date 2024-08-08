local Framework = {}

function Framework.PlayerDataC()
    local data = QBX.PlayerData
    local pJob = data.job
    pJob.Grade = {}
    pJob.Grade.name = pJob.grade.name
    pJob.Grade.label = pJob.grade.name
    pJob.Grade.level = pJob.grade.level
    local Pdata = {
        Pid = data.citizenid,
        Name = data.charinfo.firstname..' '..data.charinfo.lastname,
        Bank = data.bank,
        Cash = data.money,
        Source = data.source,
        Job = pJob,
        Gang = data.gang,
    }
    return Pdata
end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('kmack_bridge:playerLoaded')
end)

AddEventHandler('qbx_core:client:playerLoggedOut', function()
    TriggerEvent('kmack_bridge:playerUnLoaded')
end)

return Framework