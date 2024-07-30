local Inventory = {}
local config = require('config')
print('^4 [kmack_bridge] ^1 Loaded qb Inventory')

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
    


end

return Inventory