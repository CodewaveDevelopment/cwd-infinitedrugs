local QBCore = exports["qb-core"]:GetCoreObject()
local Config = {
    ItemToGive = "bth-baggy", -- Item to give after the process
    ItemToTake1 = "poppy_plant", -- First item to take before processing
    ItemToTake2 = "oil-barrel", -- Second item to take before processing
    Coords = vector3(-885.51, 7621.87, 41.49), -- Coords
}

QBCore.Functions.CreateCallback("qb-drug:server:getConfig", function(source, cb)
    cb(Config)
end)

-- Adds The After Process Product You want After The Progress Bar Is Finished

RegisterServerEvent("drug:addbaggies", function()
    local src = source
    local ped = GetPlayerPed(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local Coords = GetEntityCoords(ped)

    if #(Config.Coords - Coords) < 3 then 
        TriggerEvent("drug:overallproccess", Player)

        if Player.Functions.GetItemByName(Config.ItemToTake1) ~= nil and Player.Functions.GetItemByName(Config.ItemToTake2) ~= nil then
            Player.Functions.RemoveItem(Config.ItemToTake1, 1)
            Player.Functions.RemoveItem(Config.ItemToTake2, 1)

            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemToTake1], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemToTake2], "remove")
            TriggerClientEvent("QBCore:Notify", src, "Making Black Tar Heroin", "success", 8000)

            Player.Functions.AddItem(Config.ItemToGive, 8)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemToGive], "add")
        else
            TriggerClientEvent("QBCore:Notify", src, "You are missing either Oil Barrels & Poppy Plants.", "error")
        end
    end
end)

-- Create Drug (rock)

RegisterServerEvent("drug:addbaggies", function()
    local src = source
    local ped = GetPlayerPed(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local Coords = GetEntityCoords(ped)

    if #(Config.Coords - Coords) < 3 then 
        TriggerEvent("drug:overallproccess", Player)

        if Player.Functions.GetItemByName(Config.ItemToTake1) ~= nil and Player.Functions.GetItemByName(Config.ItemToTake2) ~= nil then
            Player.Functions.RemoveItem(Config.ItemToTake1, 1)
            Player.Functions.RemoveItem(Config.ItemToTake2, 1)

            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemToTake1], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemToTake2], "remove")
            TriggerClientEvent("QBCore:Notify", src, "Making Black Tar Heroin", "success", 8000)

            Player.Functions.AddItem(Config.ItemToGive, 8)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemToGive], "add")
        else
            TriggerClientEvent("QBCore:Notify", src, "You are missing either Oil Barrels & Poppy Plants.", "error")
        end
    end
end)