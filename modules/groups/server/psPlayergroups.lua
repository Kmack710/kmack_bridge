print('^4 [kmack_bridge] ^2 Loaded ps-Playergroups Group system^7')

local GroupSystem = {}
function GroupSystem.GetGroupLeader(groupId)
    return exports["ps-playergroups"]:GetGroupLeader(groupId)
end

function GroupSystem.GetGroupMembers(groupId)
    return exports["ps-playergroups"]:getGroupMembers(groupId)--- tbl source and char names
end

function GroupSystem.FindGroupByMember(source)
    return exports["ps-playergroups"]:FindGroupByMember(source)
end

function GroupSystem.GetGroupMembersCount(groupId)
    return exports["ps-playergroups"]:getGroupSize(groupId)
end

function GroupSystem.CreateBlipForGroup(groupId, name, data)
    exports["ps-playergroups"]:CreateBlipForGroup(groupId, name, data.label, data.coords, data.sprite, data.color or 1, data.scale or 0.5, data.route or false)
end

function GroupSystem.RemoveBlipForGroup(groupId, name)
    exports["ps-playergroups"]:RemoveBlipForGroup(groupId, name)
end

function GroupSystem.SendGroupEvent(groupId, event, args)
    exports["ps-playergroups"]:GroupEvent(groupId, event, args)
end

function GroupSystem.NotifyGroup(groupId, msg, timeout)
    --- No notify group function built into ps, will add something later 
end

function GroupSystem.SendGroupServerEvent(groupID, event, args)
    --- doesnt have function for this in ps, will add something later
end

return GroupSystem