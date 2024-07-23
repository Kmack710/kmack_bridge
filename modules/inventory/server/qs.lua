local Inventory = {}
print('^4 [kmack_bridge] ^1 Loaded qs Inventory')

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

function Inventory.CreateUseableItem(item, cb)
    exports['qs-inventory']:CreateUseableItem(item, cb)
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

return Inventory