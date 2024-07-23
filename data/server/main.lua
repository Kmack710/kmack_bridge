
--- If you dont know what your doing, dont touch anything below
--- Edit the files for your framework, inv, phone and notis in the respective folders.
local config = require 'config'
Bridge = {
    Framework = {},
    Inventory = {},
    Phone = {},
    Noti = {},
}
if config.Framework == 'qb' then
    Bridge.Framework = require 'frameworks.server.qbcore'
elseif config.Framework == 'qbx' then
    Bridge.Framework = require 'frameworks.server.qbox'
elseif config.Framework == 'esx' then
    Bridge.Framework = require 'frameworks.server.esx'
elseif config.Framework == 'sandbox' then
    Bridge.Framework = require 'frameworks.server.sandbox'
end

if config.InventoryScript == 'ox' then
    Bridge.Inventory = require 'modules.inventory.server.ox'
elseif config.InventoryScript == 'qb' then
    Bridge.Inventory = require 'modules.inventory.server.qb'
elseif config.InventoryScript == 'qs' then
    Bridge.Inventory = require 'modules.inventory.server.qs'
elseif config.InventoryScript == 'core' then
    Bridge.Inventory = require 'modules.inventory.server.core'
elseif config.InventoryScript == 'sandbox' then
    Bridge.Inventory = require 'modules.inventory.server.sandbox'
end

if config.PhoneScript == 'yseries' then
    Bridge.Phone = require 'modules.phone.server.yseries'
elseif config.PhoneScript == 'lb' then
    Bridge.Phone = require 'modules.phone.server.lb'
elseif config.PhoneScript == 'sandbox' then
    Bridge.Phone = require 'modules.phone.server.sandbox'
end

if config.Notifications == 'qb' then
    Bridge.Noti = require 'modules.notis.server.qb'
elseif config.Notifications == 'esx' then
    Bridge.Noti = require 'modules.notis.server.esx'
elseif config.Notifications == 'ox' then
    Bridge.Noti = require 'modules.notis.server.ox'
elseif config.Notifications == 'sandbox' then
    Bridge.Noti = require 'modules.notis.server.sandbox'
else
    Bridge.Noti = require 'modules.notis.server.custom'
end



local function GetBridge()
    return Bridge
end

exports('GetBridge', GetBridge)