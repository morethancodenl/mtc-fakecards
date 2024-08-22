lib.locale()
local spawnedPed = nil
local Config = require 'config.config'

-- Creates a new point
for _ , coords in pairs(Config.Ped.coords) do
    local point = lib.points.new({coords = coords.xyz, distance = 15})

    --- On the player entering the point it will create the eped
    function point:onEnter()
        -- Checks if the ped is already spawned
        if spawnedPed then return end
        local pedHash = joaat(Config.Ped.model)

        -- Requests the model
        lib.requestModel(pedHash)

        -- Creates the ped
        spawnedPed = CreatePed(4, pedHash, coords, 0.0, false, false)
        SetBlockingOfNonTemporaryEvents(spawnedPed, true)
        SetPedDiesWhenInjured(spawnedPed, false)
        SetPedCanPlayAmbientAnims(spawnedPed, true)
        SetPedCanRagdollFromPlayerImpact(spawnedPed, false)
        SetEntityInvincible(spawnedPed, true)
        FreezeEntityPosition(spawnedPed, true)
        SetEntityHeading(spawnedPed, coords.w)

        -- Creates a new target point on the ped
        exports.ox_target:addLocalEntity(spawnedPed, {
            {
                label = locale('talk_to_ped'),
                icon = 'fas fa-id-card',
                distance = 1.5,
                event = 'mtc-fakecards:client:openMenu',
                canInteract = function ()
                    -- Checks if the Player can interact if they are not a LEO
                    local player = QBX.PlayerData
                    if player.job.type == 'leo' then return false end
                    return true
                end
            }
        })

        SetModelAsNoLongerNeeded(pedHash)
    end

    --- On the player exiting the point it will delete the pedId
    function point:onExit()
        if not spawnedPed then return end
        DeleteEntity(spawnedPed)
        spawnedPed = nil
    end
end