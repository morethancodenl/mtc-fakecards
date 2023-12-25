local function openMenu()
    lib.registerContext({
        id = 'mtc-fakecard:mainMenu',
        title = Lang:t('Menu.ContactPerson'),
        options = {
            {
                title = Lang:t('Menu.BuyIdCard'),
                description = Lang:t('Menu.Description', { price = Config.Price.ID}),
                icon = 'fa-solid fa-circle-info',
                onSelect = function()
                    if Config.Input == 'qb' then
                        local dialog = exports['qb-input']:ShowInput({
                            header = Lang:t('Input.PersonalInformation'),
                            submitText = Lang:t('Input.Submit'),
                            inputs = {
                                {
                                    text = Lang:t('Input.Firstname'),
                                    name = "firstname", 
                                    type = "text",
                                    isRequired = true,
                                    -- default = "CID-1234", -- Default text option, this is optional
                                },
                                {
                                    text = Lang:t('Input.Lastname'),
                                    name = "lastname", 
                                    type = "text",
                                    isRequired = true,
                                    -- default = "CID-1234", -- Default text option, this is optional
                                },
                                {
                                    text = Lang:t('Input.Country'),
                                    name = "country", 
                                    type = "text",
                                    isRequired = true,
                                    -- default = "CID-1234", -- Default text option, this is optional
                                },
                                {
                                    text = Lang:t('Input.TypeDateOfBirth'),
                                    name = "date", 
                                    type = "text",
                                    isRequired = true,
            
                                },
                            },
                        })

                        if dialog ~= nil then

                            local data = {
                                fakefirstname = dialog.firstname,
                                fakelastname = dialog.lastname,
                                fakebirthdate = dialog.date,
                                fakenationality = dialog.country,
                            }

                            if Config.Progressbar == 'qb' then
                                QBCore.Functions.Progressbar("forging", Lang:t('Progressbar.Forging'), 5000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = false,
                                    disableMouse = false,
                                    disableCombat = true,
                                 }, {}, {}, {}, function()
                                    TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'id_card')
                                 end, function()
                                    return
                                 end)
                            elseif Config.Progressbar == 'ox' then

                                if lib.progressCircle({
                                    duration = 5000,
                                    position = 'bottom',
                                    label = Lang:t('Progressbar.Forging'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        car = true,
                                        move = true,
                                    },
                                }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'id_card') else return end
                            end
                        end
                        return
                    elseif Config.Input == 'ox' then

                        local input = lib.inputDialog(Lang:t('Input.PersonalInformation'), {
                            {type = 'input', label = Lang:t('Input.Firstname'), required = true,},
                            {type = 'input', label = Lang:t('Input.Lastname'), required = true,},
                            {type = 'input', label = Lang:t('Input.Country'), required = true,},
                            {type = 'date', label = Lang:t('Input.DateOfBirth'), icon = {'far', 'calendar'}, default = true, format = Lang:t('Input.TypeDateOfBirth'), returnString = true}
                        })

                        if not input then return end

                        local data = {
                            fakefirstname = input[1],
                            fakelastname = input[2],
                            fakebirthdate = input[4],
                            fakenationality = input[3],
                        }

                        if Config.Progressbar == 'qb' then
                            QBCore.Functions.Progressbar("forging", Lang:t('Progressbar.Forging'), 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                             }, {}, {}, {}, function()
                                TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'id_card')
                             end, function()
                                return
                             end)
                        elseif Config.Progressbar == 'ox' then

                            if lib.progressCircle({
                                duration = 5000,
                                position = 'bottom',
                                label = Lang:t('Progressbar.Forging'),
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    car = true,
                                    move = true,
                                },
                            }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'id_card') else return end
                        end
                    end
                end
            },
            {
                title = Lang:t('Menu.BuyDriverLicense'),
                description = Lang:t('Menu.Description', { price = Config.Price.Driver}),
                icon = 'fa-solid fa-circle-info',
                onSelect = function()
                    if Config.Input == 'qb' then
                        local dialog = exports['qb-input']:ShowInput({
                            header = Lang:t('Input.PersonalInformation'),
                            submitText = Lang:t('Input.Confirm'),
                            inputs = {
                                {
                                    text = Lang:t('Input.Firstname'),
                                    name = "firstname", 
                                    type = "text",
                                    isRequired = true,
                                    -- default = "CID-1234", -- Default text option, this is optional
                                },
                                {
                                    text = Lang:t('Input.LastName'),
                                    name = "lastname", 
                                    type = "text",
                                    isRequired = true,
                                    -- default = "CID-1234", -- Default text option, this is optional
                                },
                                {
                                    text = Lang:t('Input.TypeDateOfBirth'),
                                    name = "date", 
                                    type = "text",
                                    isRequired = true,
                                },
                            },
                        })

                        if dialog ~= nil then

                            local data = {
                                fakefirstname = dialog.firstname,
                                fakelastname = dialog.lastname,
                                fakebirthdate = dialog.date,
                                fakenationality = dialog.country,
                            }

                            if Config.Progressbar == 'qb' then
                                QBCore.Functions.Progressbar("forging", Lang:t('Progressbar.Forging'), 5000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = false,
                                    disableMouse = false,
                                    disableCombat = true,
                                 }, {}, {}, {}, function()
                                    TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'driver_license')
                                 end, function()
                                    return
                                 end)
                            elseif Config.Progressbar == 'ox' then

                                if lib.progressCircle({
                                    duration = 5000,
                                    position = 'bottom',
                                    label = Lang:t('Progressbar.Forging'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        car = true,
                                        move = true,
                                    },
                                }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'driver_license') else return end
                            end
                        end
                        return
                    elseif Config.Input == 'ox' then

                    local input = lib.inputDialog(Lang:t('Input.PersonalInformation'), {
                        {type = 'input', label = Lang:t('Input.Firstname'),  required = true,},
                        {type = 'input', label = Lang:t('Input.Lastname'), required = true,},
                        {type = 'date', label = Lang:t('Input.DateOfBirth'), icon = {'far', 'calendar'}, default = true, format = Lang:t('Input.TypeDateOfBirth'), returnString = true}
                    })

                    if not input then return end

                    local data = {
                        fakefirstname = input[1],
                        fakelastname = input[2],
                        fakebirthdate = input[3],
                    }

                    if Config.Progressbar == 'qb' then
                        QBCore.Functions.Progressbar("forging", Lang:t('Progressbar.Forging'), 5000, false, true, {
                            disableMovement = true,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                         }, {}, {}, {}, function()
                            TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'driver_license')
                         end, function()
                            return
                         end)
                    elseif Config.Progressbar == 'ox' then

                        if lib.progressCircle({
                            duration = 5000,
                            position = 'bottom',
                            label = Lang:t('Progressbar.Forging'),
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                move = true,
                            },
                        }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, Config.Price.ID, 'driver_license') else return end
                    end
                end
            end
            }
        }
    })

    lib.showContext('mtc-fakecard:mainMenu')
end


CreateThread(function ()
    QBCore.Functions.LoadModel(Config.Location.Model)
        while not HasModelLoaded(Config.Location.Model) do
            Wait(0)
        end

        sellPed = CreatePed(0, Config.Location.Model, Config.Location.Coords.x, Config.Location.Coords.y, Config.Location.Coords.z - 1, Config.Location.Coords.w, false, false)
        ped = sellPed
        FreezeEntityPosition(sellPed, true)
        SetEntityInvincible(sellPed, true)
        TaskStartScenarioInPlace(sellPed, 'WORLD_HUMAN_HUMAN_STATUE', 0, true)
        SetBlockingOfNonTemporaryEvents(sellPed, true)
        exports['qb-target']:AddTargetEntity(sellPed, {
            options = {
                {
                    type = 'client',
                    icon = 'fa-solid fa-hand',
                    label = Lang:t('Target.Hello'),
                    action = function()
                       openMenu()
                    end,
                    duty = true,
                },
            },
            distance = 3.0
        })
end)
