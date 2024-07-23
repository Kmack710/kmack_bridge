local Inventory = {}
local config = require('config')
print('^4 [kmack_bridge] ^1 Loaded Core Inventory')

function Inventory.AddItem(source, item, amount)
    local Player = Bridge.Framework.PlayerDataS(source)
    if not Player then return end
    local inventory = Player.Pid
    if config.Framework == 'esx' then
        inventory:gsub(':','')
    end
    exports['core_inventory']:addItem(inventory, item, amount)

end

function Inventory.AddItemWithMetaData(source, item, amount, metadata)
    local Player = Bridge.Framework.PlayerDataS(source)
    if not Player then return end
    local inventory = Player.Pid
    if config.Framework == 'esx' then
        inventory:gsub(':','')
    end
    exports['core_inventory']:addItem(inventory, item, amount, metadata)

end

function Inventory.RemoveItem(source, item, amount)
    local Player = Bridge.Framework.PlayerDataS(source)
    if not Player then return end
    local inventory = Player.Pid
    if config.Framework == 'esx' then
        inventory:gsub(':','')
    end
    local linventory = exports.core_inventory:getInventory(inventory)
    if amount == nil then amount = 1 end
    if linventory then
        for k, v in pairs(linventory) do
            if v.name == item then
                if v.amount >= amount then
                    exports['core_inventory']:removeItemExact(inventory, v.itemId, amount)
                end
            end
        end
    end
end

function Inventory.RemoveItemWithMetaData(source, item, amount, metadata)
    local Player = Bridge.Framework.PlayerDataS(source)
    if not Player then return end
    local inventory = Player.Pid
    if config.Framework == 'esx' then
        inventory:gsub(':','')
    end
    local linventory = exports.core_inventory:getInventory(inventory)
    if amount == nil then amount = 1 end
    if linventory then
        for k, v in pairs(linventory) do
            if v.name == item then
                if v.amount >= amount  and metadata == v.metadata then
                    exports['core_inventory']:removeItemExact(inventory, v.itemId, amount)
                end
            end
        end
    end
end

function Inventory.HasItem(source, item, amount)
    local Player = Bridge.Framework.PlayerDataS(source)
    if not Player then return end
    local inventory = Player.Pid
    if config.Framework == 'esx' then
        inventory:gsub(':','')
    end
    local linventory = exports.core_inventory:getInventory(inventory)
    if amount == nil then amount = 1 end
    if linventory then
        for k, v in pairs(linventory) do
            if v.name == item then
                if v.amount >= amount then
                    return true
                end
            end
        end
    end
    return false

end

function Inventory.CreateUseableItem(item, cb)
    if config.Framework == 'qbx' then
        exports.qbx_core:CreateUseableItem(item, cb)
    elseif config.Framework == 'qb' then
        local QBCore = exports.['qb-core']:GetCoreObject()
        QBCore.Functions.CreateUseableItem(item, cb)
    elseif config.Framework == 'esx' then
        ESX.RegisterUsableItem(item, cb)
    else
        print('Please add a create useable item function for your framework')
    end
end

function Inventory.CreateStash(source, name, slots, weight)

end

function Inventory.AddItemToStash(source, stash, item, amount)

end

function Inventory.RemoveItemFromStash(source, stash, item, amount)

end

function Inventory.StashHasItem(source, stash, item, amount)

end

return Inventory