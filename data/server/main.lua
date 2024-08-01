--- If you dont know what your doing, dont touch anything below
--- Edit the files for your framework, inv, phone and notis in the respective folders.
local Bridge = {
    Framework = {},
    Inventory = {},
    Phone = {},
    Noti = {},
    Config = Config
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



local function GetBridge()
    return Bridge
end

exports('GetBridge', GetBridge)