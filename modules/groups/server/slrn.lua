print('^4 [kmack_bridge] ^2 Loaded slrn Group system^7')

local GroupSystem = {}
function GroupSystem.GetGroupLeader(groupId)
    local leader = exports.slrn_groups:GetGroupLeader(group)
    return leader  --- source of leader

end

function GroupSystem.GetGroupMembers(groupId)
    local members = exports.slrn_groups:getGroupMembers(groupId)
    return members --- tbl source and char names
end

function GroupSystem.FindGroupByMember(source)
    local group = exports.slrn_groups:GetGroupByMembers(source)
    return group 
   -- return --- returns group id 
end

function GroupSystem.GetGroupMembersCount(groupId)
     return exports.slrn_groups:getGroupSize(groupId)
end

function GroupSystem.CreateBlipForGroup(groupId, name, data)
    --- create blip for group
    exports.slrn_groups:CreateBlipForGroup(groupId, name, data)
end

function GroupSystem.RemoveBlipForGroup(groupId, name)
    --- remove blip for group
    exports.slrn_groups:RemoveBlipForGroup(groupId, name)
end

function GroupSystem.SendGroupEvent(groupId, event, args)
    --- send group event
    local members = exports.slrn_groups:getGroupMembers(groupId)
    for k,v in pairs(members) do
        TriggerClientEvent(event, v, args)
    end
end

function GroupSystem.NotifyGroup(groupId, msg, timeout)
    --- notify group  
     exports.slrn_groups:NotifyGroup(groupId, msg, 'success')
end

function GroupSystem.SendGroupServerEvent(groupID, event, args)
   --- send a server event for the group.
   TriggerEvent(event, groupID, args)
end

return GroupSystem