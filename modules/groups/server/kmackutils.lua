print('^4 [kmack_bridge] ^2 Loaded kmack_utils Group system^7')

local GroupSystem = {}
function GroupSystem.GetGroupLeader(groupId)
    return exports.kmack_utils:GetGroupLeader(groupId)
end

function GroupSystem.GetGroupMembers(groupId)
    return exports.kmack_utils:GetGroupMembers(groupId)
end

function GroupSystem.FindGroupByMember(source)
   return exports.kmack_utils:FindGroupByMember(source)
end

function GroupSystem.GetGroupMembersCount(groupId)
    return exports.kmack_utils:GetGroupMembersCount(groupId)
end

function GroupSystem.CreateBlipForGroup(groupId, name, data)
    exports.kmack_utils:CreateBlipForGroup(groupId, name, data)
end

function GroupSystem.RemoveBlipForGroup(groupId, name)
    exports.kmack_utils:RemoveBlipForGroup(groupId, name)
end

function GroupSystem.SendGroupEvent(groupId, event, args)
    exports.kmack_utils:SendGroupClientEvent(groupId, event, args)
end

function GroupSystem.NotifyGroup(groupId, msg, timeout)
    exports.kmack_utils:NotifyGroup(groupId, msg)
end

function GroupSystem.SendGroupServerEvent(groupID, event, args)
    exports.kmack_utils:SendGroupServerEvent(groupID, event, args)
end

return GroupSystem