RegisterNetEvent('mtc-fakecard:Server:setIdentity', function(data, price, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if #(GetEntityCoords(GetPlayerPed(source)).xyz - Config.Location.Coords.xyz) > 6 then print('Testing') return end
    
    if Player.Functions.RemoveMoney('bank', price) then
        local info = {}
        if item == 'id_card' then
            info.citizenid = QBCore.Player.CreateCitizenId()
            info.firstname = data.fakefirstname
            info.lastname = data.fakelastname
            info.birthdate = data.fakebirthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = data.fakenationality
        elseif item == 'driver_license' then
            info.firstname = data.fakefirstname
            info.lastname = data.fakelastname
            info.birthdate = data.fakebirthdate
            info.type = 'Class C Driver License'
        end

        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(item, 1, false, info)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        else
            exports.ox_inventory:AddItem(src, item, 1, info)
        end
    end
end)