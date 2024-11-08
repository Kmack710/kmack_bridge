local Inventory = {}
print('^4 [kmack_bridge] ^5 Loaded Ox Inventory^7')

function Inventory.AddItem(source, item, amount)
    exports.ox_inventory:AddItem(source, item, amount)
end

function Inventory.AddItemWithMetaData(source, item, amount, metadata)
    exports.ox_inventory:AddItem(source, item, amount, metadata)
end

function Inventory.RemoveItem(source, item, amount)
    exports.ox_inventory:RemoveItem(source, item, amount)
end

function Inventory.RemoveItemWithMetaData(source, item, amount, metadata)
    exports.ox_inventory:RemoveItem(source, item, amount, metadata)
end

function Inventory.GetItems(inventory)
    local items = exports.ox_inventory:GetInventoryItems(inventory)
    local itemData = {}
    for k, v in pairs(items) do
        table.insert(itemData, {name = v.name, amount = v.amount, metadata = v.metadata})
    end
    return itemData
end

function Inventory.WipeInventory(inventory, itemsToExclude)
    local items = itemsToExclude or false
    exports.ox_inventory:ClearInventory(inventory, items)
end

function Inventory.HasItem(source, item, amount)
    local items = exports.ox_inventory:Search(source, 'count', item)
    if not amount then amount = 1 end
    if not items then items = 0 end
    if items ~= 0 and items >= amount then
        return true
    else
        return false
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

RegisterNetEvent('kmack_bridge:Server:OxCreateStash', function(name, weight, slots)
    local id = string.lower(name)
    id = string.gsub(id, ' ', '')
    exports.ox_inventory:RegisterStash(id, name, slots, weight)
end)

return Inventory