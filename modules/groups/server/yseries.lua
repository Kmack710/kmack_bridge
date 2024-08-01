print('^4 [kmack_bridge] ^2 Loaded Yseries Group system^7')
local GroupSystem = {}
function GroupSystem.GetGroupLeader(groupId)
    return exports["yseries"]:GetGroupLeader(groupId)
end

function GroupSystem.GetGroupMembers(groupId)
    return exports["yseries"]:GetGroupMembers(groupId) --- tbl source and char names
end

function GroupSystem.FindGroupByMember(source)
    return exports["yseries"]:FindGroupByMember(source)
end

function GroupSystem.GetGroupMembersCount(groupId)
    return exports["yseries"]:GetGroupMembersCount(groupId)
end

function GroupSystem.CreateBlipForGroup(groupId, name, data)
    exports["yseries"]:CreateBlipForGroup(groupId, name, data)
end

function GroupSystem.RemoveBlipForGroup(groupId, name)
    exports["yseries"]:RemoveBlipForGroup(groupId, name)
end

function GroupSystem.SendGroupEvent(groupId, event, args)
    exports["yseries"]:SendGroupEvent(groupId, event, args)
end

function GroupSystem.NotifyGroup(groupId, msg, timeout)
    exports["yseries"]:NotifyGroup(groupId, msg, timeout)
end

function GroupSystem.SendGroupServerEvent(groupID, event, args)
    exports["yseries"]:sendGroupServerEvent(groupID, event, args)
end

return GroupSystem