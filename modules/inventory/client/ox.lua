local Inventory = {}
print('^4 [kmack_bridge] ^1 Loaded Ox Inventory')
function Inventory.OpenStash(stash, stashslotsweight)
    if not exports.ox_inventory:openInventory('stash', stash) then
        TriggerServerEvent('kmack_bridge:Server:OxCreateStash', stash, stashslotsweight.weight, stashslotsweight.slots)
        Wait(500)
        exports.ox_inventory:openInventory('stash', stash)
    end
    exports.ox_inventory:openInventory('stash', stash)
end

function Inventory.OpenPlayerInventory(data)
    exports.ox_inventory:openInventory('player', data)
end

return Inventory