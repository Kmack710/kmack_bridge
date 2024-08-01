print('^4 [kmack_bridge] ^2 Loaded custom Group system^7')

local GroupSystem = {}
function GroupSystem.GetGroupLeader(groupId)
    --- return   --- source of leader

end

function GroupSystem.GetGroupMembers(groupId)
    -- return --- tbl source and char names
end

function GroupSystem.FindGroupByMember(source)
   -- return --- returns group id 
end

function GroupSystem.GetGroupMembersCount(groupId)
    -- return -- returns group size (int)
end

function GroupSystem.CreateBlipForGroup(groupId, name, data)
    --- create blip for group
end

function GroupSystem.RemoveBlipForGroup(groupId, name)
    --- remove blip for group
end

function GroupSystem.SendGroupEvent(groupId, event, args)
    --- send group event
end

function GroupSystem.NotifyGroup(groupId, msg, timeout)
    --- notify group  
end

function GroupSystem.SendGroupServerEvent(groupID, event, args)
   --- send a server event for the group. 
end

return GroupSystem