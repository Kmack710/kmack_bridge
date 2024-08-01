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

return Framework