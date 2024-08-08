local Config = require 'config'

Bridge = {
    Framework = {},
    Inventory = {},
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


RegisterNetEvent('kmack_bridge:playerLoaded', function()
    --- Just used in other resources as event handler for player loaded.
end)

RegisterNetEvent('kmack_bridge:playerUnLoaded', function()
    --- Just used in other resources as event handler for player unloaded.
end)