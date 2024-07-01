local QBCore = exports["qb-core"]:GetCoreObject()

local function DebugPrint(msg)
    if Config.BthDebug then
        print("^1[DEBUG] ^7" .. msg)
    end
end

RegisterServerEvent("drug:addbaggies")
AddEventHandler("drug:addbaggies", function()
    local src = source
    local ped = GetPlayerPed(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local Coords = GetEntityCoords(ped)
    
    DebugPrint("Player is within range of BTH processing area.")

    if #(Config.Coords - Coords) < 3 then 
        TriggerEvent("cwd-drug:overallproccess", Player)

        local hasItem1 = Player.Functions.GetItemByName(Config.BTHItemToTake1) ~= nil
        local hasItem2 = Player.Functions.GetItemByName(Config.BTHItemToTake2) ~= nil

        if hasItem1 and hasItem2 then
            DebugPrint("Player has both required items: " .. Config.BTHItemToTake1 .. " and " .. Config.BTHItemToTake2)

            Player.Functions.RemoveItem(Config.BTHItemToTake1, 1)
            Player.Functions.RemoveItem(Config.BTHItemToTake2, 1)

            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.BTHItemToTake1], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.BTHItemToTake2], "remove")
            TriggerClientEvent("QBCore:Notify", src, "Making Black Tar Heroin", "success", 8000)

            Player.Functions.AddItem(Config.BTHItemToGive, 8)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.BTHItemToGive], "add")
        else
            DebugPrint("Player is missing required items: " .. Config.BTHItemToTake1 .. " or " .. Config.BTHItemToTake2)

            TriggerClientEvent("QBCore:Notify", src, "You are missing either Oil Barrels & Poppy Plants.", "error")
        end
    else
        DebugPrint("Player is not within range of BTH processing area.")
    end
end)
