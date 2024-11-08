local Inventory = {}
print('^4 [kmack_bridge] ^5 Loaded qs Inventory^7')

function Inventory.AddItem(source, item, amount)
    exports['qs-inventory']:AddItem(source, item, amount)
end

function Inventory.AddItemWithMetaData(source, item, amount, metadata)
    exports['qs-inventory']:AddItem(source, item, amount, nil, metadata)
end

function Inventory.RemoveItem(source, item, amount)
    exports['qs-inventory']:RemoveItem(source, item, amount)
end

function Inventory.RemoveItemWithMetaData(source, item, amount, metadata)
    exports['qs-inventory']:RemoveItem(source, item, amount, nil, metadata)
end

function Inventory.HasItem(source, item, amount)
   local itemCount =  exports['qs-inventory']:GetItemTotalAmount(source, item)
   if amount == nil then amount = 1 end
    if itemCount >= amount then
         return true
    else
         return false
    end
end

function Inventory.CreateStash(source, name, slots, weight)
    exports['qs-inventory']:RegisterStash(source, name, slots, weight)
end

function Inventory.AddItemToStash(source, stash, item, amount)
    exports['qs-inventory']:AddItemIntoStash(stash, item, amount)
end

function Inventory.RemoveItemFromStash(source, stash, item, amount)
    exports['qs-inventory']:RemoveItemIntoStash(stash, item, amount)
end

function Inventory.StashHasItem(source, stashid, item, amount)
    local stash = exports['qs-inventory']:GetStashItems(stashid)
    local itemCount = 0
    for k, v in pairs(stash) do
        if v.name == item then
            itemCount = itemCount + v.amount
        end
    end
    if amount == nil then amount = 1 end
    if itemCount >= amount then
        return true
    else
        return false
    end
end

function Inventory.GetItems(source)
    local items = exports['qs-inventory']:GetInventory(source)
    local itemData = {}
    for k, v in pairs(items) do
        table.insert(itemData, {name = v.name, amount = v.amount, metadata = v.metadata or nil})
    end
    return itemData
end

function Inventory.WipeInventory(source, itemsToExclude)
    local items = Inventory.GetItems(source)
    for k, v in pairs(items) do
        if not itemsToExclude then
            exports['qs-inventory']:RemoveItem(source, v.name, v.amount)
        else
            if not itemsToExclude[v.name] then
                exports['qs-inventory']:RemoveItem(source, v.name, v.amount)
            end
        end
    end

end

return Inventory