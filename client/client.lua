local QBCore = exports["qb-core"]:GetCoreObject()
local isProcessing = false

CreateThread(function()
    Wait(100)
    QBCore.Functions.TriggerCallback(
        "qb-drug:server:getConfig",
        function(config)
            exports["qb-target"]:AddBoxZone("drugprocessing", config.Coords, 2.75, 1, {
                name = "drugprocessing",
                heading = 312,
                debugPoly = false,
                minZ = 38.75,
                maxZ = 42.75,
            }, {
                options = {
                    {
                        event = "drug:overallproccess",
                        icon = "fas fa-hammer",
                        label = "Process Black Tar Heroin",
                        item = config.ItemToTake, -- Change Me on server.lua
                    },
                },
                distance = 2,
            })
        end
    )
end)

RegisterNetEvent("drug:overallproccess")
AddEventHandler("drug:overallproccess", function()
    local player = PlayerPedId()
    FreezeEntityPosition(player, true)
    
    QBCore.Functions.Progressbar("drug-", "Processing..", 30000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 16,
    }, {}, {}, function() -- Done
        FreezeEntityPosition(player, false)
        TriggerServerEvent("drug:addbaggies")
        isProcessing = false
    end, function() -- Cancel
        isProcessing = false
        ClearPedTasksImmediately(player)
        FreezeEntityPosition(player, false)
    end)
end)
