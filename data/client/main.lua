
--- If you dont know what your doing, dont touch anything below
--- Edit the files for your framework, inv, phone and notis in the respective folders.
local data = {
    Framework = {},
    Inventory = {},
    Phone = {},
    Noti = {},
}
if Config.Framework == 'qb' then
  data.Framework = require 'frameworks.client.qbcore'
elseif Config.Framework == 'qbx' then
    data.Framework = require 'frameworks.client.qbox'
elseif Config.Framework == 'esx' then
    data.Framework = require 'frameworks.client.esx'
elseif Config.Framework == 'ox' then
    data.Framework = require 'frameworks.client.ox'
end

if Config.InventoryScript == 'ox' then
    data.Inventory = require 'modules.inventory.client.ox'
elseif Config.InventoryScript == 'qb' then
    data.Inventory = require 'modules.inventory.client.qb'
elseif Config.InventoryScript == 'qs' then
    data.Inventory = require 'modules.inventory.client.qs'
end

if Config.PhoneScript == 'yseries' then
    data.Phone = require 'modules.phone.client.yseries'
elseif Config.PhoneScript == 'lb' then
    data.Phone = require 'modules.phone.client.lb'
elseif Config.PhoneScript == 'npwd' then
    data.Phone = require 'modules.phone.client.npwd'
elseif Config.PhoneScript == 'qb' then
    data.Phone = require 'modules.phone.client.qb'
elseif Config.PhoneScript == 'qs' then
    data.Phone = require 'modules.phone.client.qs'
end

if Config.Notifications == 'qb' then
    data.Noti = require 'modules.notis.client.qb'
elseif Config.Notifications == 'esx' then
    data.Noti = require 'modules.notis.client.esx'
elseif Config.Notifications == 'ox' then
    data.Noti = require 'modules.notis.client.ox'
else
    data.Noti = require 'modules.notis.client.custom'
end



local function GetBridge()
    return data
end

exports('GetBridge', GetBridge)

--local Bridge = exports.kmack_bridge:GetBridge()