local Inventory = {}
print('^4 [kmack_bridge] ^1 Loaded Ox Inventory')
function Inventory.OpenStash(stash, stashslotsweight)
    exports.ox_inventory:openInventory('stash', stash)
end

function Inventory.OpenPlayerInventory(data)
    exports.ox_inventory:openInventory('player', data)
end

return Inventory