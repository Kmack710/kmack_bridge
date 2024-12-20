local Inventory = {}
print('^4 [kmack_bridge] ^8 Loaded qb Inventory^7')

function Inventory.AddItem(source, item, amount)
    exports['qb-inventory']:AddItem(source, item, amount)
end

function Inventory.AddItemWithMetaData(source, item, amount, metadata)
    exports['qb-inventory']:AddItem(source, item, amount, false, metadata)
end

function Inventory.RemoveItem(source, item, amount)
    exports['qb-inventory']:RemoveItem(source, item, amount, false)
end

function Inventory.RemoveItemWithMetaData(source, item, amount, metadata)
    -- qbcore sucks so... this is just a normal item remove.
    exports['qb-inventory']:RemoveItem(source, item, amount, false)
end

function Inventory.HasItem(source, item, amount)
    if amount == nil then amount = 1 end
    return exports['qb-inventory']:HasItem(source, item, amount)
end

function Inventory.CreateStash(source, name, slots, weight)
    --- qb allows the client to make stashes..... so this doesnt get used

end

function Inventory.GetItems(source)
    local QBCore = exports['qb-core']:GetCoreObject()
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid --- cause for some reason qb-inventory couldnt get citizenid from source on their side...
    local items = exports['qb-inventory']:LoadInventory(source, citizenid)
    local itemData = {}
    for k, v in pairs(items) do
        table.insert(itemData, {name = v.name, amount = v.amount, metadata = v.metadata or nil})
    end
    return itemData
end

function Inventory.WipeInventory(source, itemsToExclude)
    local items = itemsToExclude or false
    exports['qb-inventory']:ClearInventory(source, items)
end

function Inventory.AddItemToStash(source, stash, item, amount)
    --- Dont know if this works, just get a better inventory system tbh
    exports['qb-inventory']:AddItem(stash, item, amount, false)
end

function Inventory.RemoveItemFromStash(source, stash, item, amount)
    --- same as above, might not work, just use a better inventory system
    exports['qb-inventory']:RemoveItem(stash, item, amount, false)

end

function Inventory.StashHasItem(source, stash, item, amount)
    ---- same as above, might not work, just use a better inventory system
    return exports['qb-inventory']:HasItem(stash, item, amount)
end

return Inventory