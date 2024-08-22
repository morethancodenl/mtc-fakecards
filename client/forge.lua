local Config = require 'config.config'

--- Client side event for forging a card with a specific item such as a progressbar
---@param item any
---@param vData any
RegisterNetEvent('mtc-fakecards:client:forgeCards', function (item, vData)
    local pCoords = GetEntityCoords(cache.ped)
    local distance = #(Config.Ped.coords.xyz - pCoords)

    -- Checks if the distance is larger than 5 then it will be a cheater
    if distance > 5.0 then return end
    
    -- Progressbar for forging the card
    if lib.progressBar({
        duration = 3000,
        label = locale('progress_forge'):format(vData.label),
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'misscarsteal4@actor',
            clip = 'actor_berating_loop',
            blendIn = 3.0,
            blendOut = 3.0,
        }
    }) then 
        -- Triggers the server event to forge the card
        TriggerServerEvent('mtc-fakecards:server:forgeCard', item, vData) 
    end
end)