local Config = require 'config'

Bridge = {
    Framework = {},
    Inventory = {},
    Phone = {},
    Noti = {},
    Config = Config
}
if Config.Framework == 'qb' then
  Bridge.Framework = require 'frameworks.client.qbcore'
elseif Config.Framework == 'qbx' then
    Bridge.Framework = require 'frameworks.client.qbox'
elseif Config.Framework == 'esx' then
    Bridge.Framework = require 'frameworks.client.esx'
elseif Config.Framework == 'ox' then
    Bridge.Framework = require 'frameworks.client.ox'
end

if Config.InventoryScript == 'ox' then
    Bridge.Inventory = require 'modules.inventory.client.ox'
elseif Config.InventoryScript == 'qb' then
    Bridge.Inventory = require 'modules.inventory.client.qb'
elseif Config.InventoryScript == 'qs' then
    Bridge.Inventory = require 'modules.inventory.client.qs'
end

if Config.PhoneScript == 'yseries' then
    Bridge.Phone = require 'modules.phone.client.yseries'
elseif Config.PhoneScript == 'lb' then
    Bridge.Phone = require 'modules.phone.client.lb'
elseif Config.PhoneScript == 'npwd' then
    Bridge.Phone = require 'modules.phone.client.npwd'
elseif Config.PhoneScript == 'qb' then
    Bridge.Phone = require 'modules.phone.client.qb'
elseif Config.PhoneScript == 'qs' then
    Bridge.Phone = require 'modules.phone.client.qs'
end

if Config.Notifications == 'qb' then
    Bridge.Noti = require 'modules.notis.client.qb'
elseif Config.Notifications == 'esx' then
    Bridge.Noti = require 'modules.notis.client.esx'
elseif Config.Notifications == 'ox' then
    Bridge.Noti = require 'modules.notis.client.ox'
else
    Bridge.Noti = require 'modules.notis.client.custom'
end



local function GetBridge()
    return Bridge
end

exports('GetBridge', GetBridge)