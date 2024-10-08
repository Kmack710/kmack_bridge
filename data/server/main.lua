local Config = require 'config'
Bridge = {
    Framework = {},
    Inventory = {},
    Phone = {},
    Noti = {},
    GroupSystem = {},
    Config = Config,
}
if Config.Framework == 'qb' then
    Bridge.Framework = require 'frameworks.server.qbcore'
elseif Config.Framework == 'qbx' then
    Bridge.Framework = require 'frameworks.server.qbox'
elseif Config.Framework == 'esx' then
    Bridge.Framework = require 'frameworks.server.esx'
elseif Config.Framework == 'ox' then
    Bridge.Framework = require 'frameworks.server.ox'
end
if Config.InventoryScript == 'ox' then
    Bridge.Inventory = require 'modules.inventory.server.ox'
elseif Config.InventoryScript == 'qb' then
    Bridge.Inventory = require 'modules.inventory.server.qb'
elseif Config.InventoryScript == 'qs' then
    Bridge.Inventory = require 'modules.inventory.server.qs'
elseif Config.InventoryScript == 'core' then
    Bridge.Inventory = require 'modules.inventory.server.core'
end
if Config.PhoneScript == 'yseries' then
    Bridge.Phone = require 'modules.phone.server.yseries'
elseif Config.PhoneScript == 'lb' then
    Bridge.Phone = require 'modules.phone.server.lb'
elseif Config.PhoneScript == 'qb' then
    Bridge.Phone = require 'modules.phone.server.qb'
elseif Config.PhoneScript == 'qs' then
    Bridge.Phone = require 'modules.phone.server.qs'
elseif Config.PhoneScript == 'npwd' then
    Bridge.Phone = require 'modules.phone.server.npwd'
end
if Config.Notifications == 'qb' then
    Bridge.Noti = require 'modules.notis.server.qb'
elseif Config.Notifications == 'esx' then
    Bridge.Noti = require 'modules.notis.server.esx'
elseif Config.Notifications == 'ox' then
    Bridge.Noti = require 'modules.notis.server.ox'
else
    Bridge.Noti = require 'modules.notis.server.custom'
end

if Config.GroupSystem == 'yseries' then
    Bridge.GroupSystem = require 'modules.groups.server.yseries'
elseif Config.GroupSystem == 'ps' then
    Bridge.GroupSystem = require 'modules.groups.server.psPlayergroups'
elseif Config.GroupSystem == 'slrn' then
    Bridge.GroupSystem = require 'modules.groups.server.slrn'
elseif Config.GroupSystem == 'kmack_utils' then
    Bridge.GroupSystem = require 'modules.groups.server.kmackutils'
else
    Bridge.GroupSystem = require 'modules.groups.server.custom'
end

if Config.Logs == 'ox' then
    Bridge.Logs = require 'modules.logs.server.ox'
elseif Config.Logs == 'discord' then
    Bridge.Logs = require 'modules.logs.server.discord'
else
    Bridge.Logs = require 'modules.logs.server.custom'
end

local function GetBridge()
    return Bridge
end

exports('GetBridge', GetBridge)

