local Config = require 'config.config'
local Names = require 'config.names'

-- Gets an Random name for the player
local function getRandomName(nameTable)
    local index = math.random(1, #nameTable)
    return nameTable[index]
end

local function afterPurchase(personData)
    -- Do Something.....
end

--- Forges a Custom Card for a specific item
---@param item any
---@param itemData any
RegisterNetEvent('mtc-fakecards:server:forgeCard', function (item, itemData, id)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local pCoords = GetEntityCoords(GetPlayerPed(src))

    -- Checks the distance
    local distance = #(Config.Ped.coords[id].xyz - pCoords)
    -- Checks if the distance is larger than 5 then it will be a cheater
    if distance > 5.0 then return end

    -- Gets the gender variable
    local gender = player.PlayerData.charinfo.gender == 0 and 'male' or 'female'

    if not player.Functions.RemoveMoney('cash', itemData.price, 'mtc-fakecards purchase') then
        DropPlayer(src, 'You do not have enough money to purchase this item') -- Change this to your own ban system, player cannot trigger this event because of an earlier client side check
    end
    -- Gets the persons data
    local personData = {
        citizenid = exports['qbx_core']:GenerateUniqueIdentifier('citizenid'),
        firstname = getRandomName(Names.firstname[gender]),
        lastname = getRandomName(Names.lastname),
        birthdate = ('%s-%s-%s'):format(math.random(1,30), math.random(1,12), math.random(1980,2004)),
    }

    -- TriggerClientEvent('mtc-fakecards:client:eventAfterPurchase', src, personData)
    -- afterPurchase(personData)

    -- Create a custom meta license and adds the item
    exports['qbx_idcard']:CreateCustomMetaLicense(src, item, personData) 
end)