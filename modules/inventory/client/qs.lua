local Inventory = {}

function Inventory.OpenStash(stash, stashslotsweight)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stash, {
        maxweight = stashslotsweight.maxweight,
        slots = stashslotsweight.slots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", stash)
end

function Inventory.OpenInventory(data)
    TriggerServerEvent("inventory:server:OpenInventory", 'player', data)
end

return Inventory