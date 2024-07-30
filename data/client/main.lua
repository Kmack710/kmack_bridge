
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
  data.Framework = require 'frameworks.client.qbcore'
elseif config.Framework == 'qbx' then
    data.Framework = require 'frameworks.client.qbox'
elseif config.Framework == 'esx' then
    data.Framework = require 'frameworks.client.esx'
elseif config.Framework == 'ox' then
    data.Framework = require 'frameworks.client.ox'
end

if config.InventoryScript == 'ox' then
    data.Inventory = require 'modules.inventory.client.ox'
elseif config.InventoryScript == 'qb' then
    data.Inventory = require 'modules.inventory.client.qb'
elseif config.InventoryScript == 'qs' then
    data.Inventory = require 'modules.inventory.client.qs'
end

if config.PhoneScript == 'yseries' then
    data.Phone = require 'modules.phone.client.yseries'
elseif config.PhoneScript == 'lb' then
    data.Phone = require 'modules.phone.client.lb'
elseif config.PhoneScript == 'npwd' then
    data.Phone = require 'modules.phone.client.npwd'
elseif config.PhoneScript == 'qb' then
    data.Phone = require 'modules.phone.client.qb'
elseif config.PhoneScript == 'qs' then
    data.Phone = require 'modules.phone.client.qs'
end

if config.Notifications == 'qb' then
    data.Noti = require 'modules.notis.client.qb'
elseif config.Notifications == 'esx' then
    data.Noti = require 'modules.notis.client.esx'
elseif config.Notifications == 'ox' then
    data.Noti = require 'modules.notis.client.ox'
else
    data.Noti = require 'modules.notis.client.custom'
end



local function GetBridge()
    return data
end

exports('GetBridge', GetBridge)

--local Bridge = exports.kmack_bridge:GetBridge()