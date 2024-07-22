local Framework = {}
function Framework.PlayerDataC()
    local data = ESX.GetPlayerData() 
    local pAccount = data.accounts
    local pBank = {}
    local pCash = {}
    for k,v in pairs(pAccount) do
        if v.name == 'bank' then
            pBank = v.money
        elseif v.name == 'money' then
            pCash = v.money
        end
    end
    local pJob = data.job
    pJob.Grade = {}
    pJob.Grade.name = data.job.grade_name
    pJob.Grade.label = data.job.grade_label
    pJob.Grade.level = data.job.grade
    local Pdata = {
        Pid = data.identifier,
        Name = data.name,
        Identifier = data.identifier,
        Bank = pBank,
        Cash = pCash,
        Source = data.playerId,
        Job = pJob,
        Gang = false, -- esx has no gang system by default so add your own function here.    
    }
    return Pdata
end

return Framework