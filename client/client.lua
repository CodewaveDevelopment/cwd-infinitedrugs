local QBCore = exports["qb-core"]:GetCoreObject()
local isProcessing = false

local function DebugPrint(msg)
    if Config.BthDebug then
        print("^1[DEBUG] ^7" .. msg)
    end
end

CreateThread(function()
    exports["qb-target"]:AddBoxZone("drugprocessing", Config.Coords, 2.75, 1, {
        name = "drugprocessing",
        heading = 312,
        debugPoly = false,
        minZ = 38.75,
        maxZ = 42.75,
    }, {
        options = {
            {
                event = "cwd-drug:overallproccess",
                icon = "fas fa-hammer",
                label = "Process Black Tar Heroin",
                item = Config.BTHItemToTake1,
            },
        },
        distance = 2,
    })
end)

RegisterNetEvent("cwd-drug:overallproccess")
AddEventHandler("cwd-drug:overallproccess", function()
    local player = PlayerPedId()
    FreezeEntityPosition(player, true)
    
    DebugPrint("Processing started.")
    
    QBCore.Functions.Progressbar("drug-processing", "Processing..", 30000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 16,
    }, {}, {}, function()
        FreezeEntityPosition(player, false)
        TriggerServerEvent("drug:addbaggies")
        DebugPrint("Processing finished successfully.")
        isProcessing = false
    end, function()
        isProcessing = false
        ClearPedTasksImmediately(player)
        FreezeEntityPosition(player, false)
        DebugPrint("Processing canceled or failed.")
    end)
end)
