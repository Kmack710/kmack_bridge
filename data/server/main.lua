
--- If you dont know what your doing, dont touch anything below
--- Edit the files for your framework, inv, phone and notis in the respective folders.
local config = require 'config'
local data = {
    Framework = {},
    Inventory = {},
    Phone = {},
    Noti = {},
}
if config.Framework == 'qb' then
  data.Framework = require 'frameworks.server.qbcore'
elseif config.Framework == 'qbx' then
    data.Framework = require 'frameworks.server.qbox'
elseif config.Framework == 'esx' then
    data.Framework = require 'frameworks.server.esx'
end

if config.InventoryScript == 'ox' then
    data.Inventory = require 'modules.inventory.server.ox'
elseif config.InventoryScript == 'qb' then
    data.Inventory = require 'modules.inventory.server.qb'
elseif config.InventoryScript == 'qs' then
    data.Inventory = require 'modules.inventory.server.qs'
elseif config.InventoryScript == 'core' then
    data.Inventory = require 'modules.inventory.server.core'
end

if config.PhoneScript == 'yseries' then
    data.Phone = require 'modules.phone.server.yseries'
elseif config.PhoneScript == 'lb' then
    data.Phone = require 'modules.phone.server.lb'
end

if config.Notifications == 'qb' then
    data.Noti = require 'modules.notis.server.qb'
elseif config.Notifications == 'esx' then
    data.Noti = require 'modules.notis.server.esx'
elseif config.Notifications == 'ox' then
    data.Noti = require 'modules.notis.server.ox'
else
    data.Noti = require 'modules.notis.server.custom'
end



local function GetBridge()
    return data
end

exports('GetBridge', GetBridge)