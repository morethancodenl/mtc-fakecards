local Config = require 'config.config'

--- Registers the Context Menu for the player
RegisterNetEvent('mtc-fakecards:client:openMenu', function ()
    local pCoords = GetEntityCoords(cache.ped)
    local distance = #(Config.Ped.coords.xyz - pCoords)

    -- Checks if the distance is larger than 5 then it will be a cheater
    if distance > 5.0 then return end

    -- Creates the options
    local options = {}

    -- Loops through the items and addes them to the options
    for item, vData in pairs(Config.Items) do
        local isDisabled = false
        if QBX.PlayerData.money.cash < vData.price then
            isDisabled = true
        end

        options[#options+1] = {
            title = locale('menu_forge_card'):format(vData.label),
            icon = vData.icon,
            description  = locale('menu_desc_forge_card'):format(vData.label, vData.price),
            disabled = isDisabled,
            onSelect = function()
                TriggerEvent('mtc-fakecards:client:forgeCards', item, vData)
            end
        }
    end

    -- Registers the Context Menu
    lib.registerContext{
        id = 'mtc-fakecards:forgeCardPed',
        title = locale('ped_name'),
        options = options
    }

    -- Shows the Context Menu to the player
    lib.showContext('mtc-fakecards:forgeCardPed')
end)