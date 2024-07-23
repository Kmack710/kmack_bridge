local Inventory = {}
local config = require('config')
print('^4 [kmack_bridge] ^1 Loaded Ox Inventory')

function Inventory.AddItem(source, item, amount)
    exports.ox_inventory:AddItem(source, item, amount)
end

function Inventory.AddItemWithMetaData(source, item, amount, metadata)
    exports.ox_inventory:AddItemWithMetaData(source, item, amount, metadata)
end

function Inventory.RemoveItem(source, item, amount)
    exports.ox_inventory:RemoveItem(source, item, amount)
end

function Inventory.RemoveItemWithMetaData(source, item, amount, metadata)
    exports.ox_inventory:RemoveItem(source, item, amount, metadata)
end

function Inventory.HasItem(source, item, amount)
    local items = exports.ox_inventory:Search(source, 'count', item)
    if amount == nil then amount = 1 end
    if not amount then amount = 1 end
    if items ~= 0 and items >= amount then
        return true
    else
        return false
    end
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
    --- get rid of spaces and caps in the name for the id
    local id = string.lower(name)
    id = string.gsub(id, ' ', '')
    exports.ox_inventory:RegisterStash(id, name, slots, weight)
end

function Inventory.AddItemToStash(stash, item, amount, metadata)
    exports.ox_inventory:AddItem(stash, item, amount, metadata)
end

function Inventory.RemoveItemFromStash(stash, item, amount)
    exports.ox_inventory:RemoveItem(stash, item, amount)
end

function Inventory.StashHasItem(stash, item, amount)
    local items = exports.ox_inventory:Search(stash, 'count', item)
    if amount == nil then amount = 1 end
    if items ~= 0 and items >= amount then
        return true
    else
        return false
    end
end

return Inventory