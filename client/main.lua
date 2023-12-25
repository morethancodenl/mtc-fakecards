RegisterNetEvent('mtc-fakecards:Client:OpenInputQb', function (data)
    if Config.Input == 'ox' then
        local inputOptions = {}

        if data.vData.Info.Firstname then
            inputOptions[#inputOptions+1] = {
                type = 'input', 
                label = Lang:t('Input.Firstname'), 
                required = true,
            }
        end

        if data.vData.Info.Lastname then
            inputOptions[#inputOptions+1] = {
                type = 'input', 
                label = Lang:t('Input.Lastname'), 
                required = true,
            }
        end

        if data.vData.Info.Country then
            inputOptions[#inputOptions+1] = {
                type = 'input', 
                label = Lang:t('Input.Country'), 
                required = true,
            }
        end

        if data.vData.Info.DateofBirth then
            inputOptions[#inputOptions+1] = {
                type = 'date', 
                label = Lang:t('Input.DateOfBirth'), 
                icon = {'far', 'calendar'}, 
                default = true, 
                format = Lang:t('Input.TypeDateOfBirth'), 
                returnString = true
            }
        end

        local inputData = lib.inputDialog(Lang:t('Input.PersonalInformation'), inputOptions)

        if not inputData then return end

        local input = {
            fakefirstname = inputData[1],
            fakelastname = inputData[2],
            fakebirthdate = inputData[4],
            fakenationality = inputData[3],
        }

        if Config.Progressbar == 'qb' then
            QBCore.Functions.Progressbar("forging", Lang:t('Progressbar.Forging'), Config.ForgeTime * 1000, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerServerEvent('mtc-fakecard:Server:setIdentity', input, vData.Price, item)
            end, function()
                return
            end)
        elseif Config.Progressbar == 'ox' then

            if lib.progressCircle({
                duration = Config.ForgeTime * 1000,
                position = 'bottom',
                label = Lang:t('Progressbar.Forging'),
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
            }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', input, vData.Price, item) else return end
        end
    elseif Config.Input == 'qb' then

        local inputOptions = {}
        if data.vData.Info.Firstname then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.Firstname'),
                name = "firstname", 
                type = "text",
                isRequired = true,
            }
        end

        if data.vData.Info.Lastname then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.Lastname'),
                name = "lastname", 
                type = "text",
                isRequired = true,
            }
        end

        if data.vData.Info.Country then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.Country'),
                name = "country", 
                type = "text",
                isRequired = true,
            }
        end

        if data.vData.Info.DateofBirth then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.TypeDateOfBirth'),
                name = "date", 
                type = "text",
                isRequired = true,
            }
        end

        local dialog = exports['qb-input']:ShowInput({
            header = Lang:t('Input.PersonalInformation'),
            submitText = Lang:t('Input.Confirm'),
            inputs = inputOptions
        })

        local input = {
            fakefirstname = dialog.firstname,
            fakelastname = dialog.lastname,
            fakebirthdate = dialog.date,
            fakenationality = dialog.country,
        }

        if Config.Progressbar == 'qb' then
            QBCore.Functions.Progressbar("forging", Lang:t('Progressbar.Forging'), Config.ForgeTime * 1000, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
             }, {}, {}, {}, function()
                TriggerServerEvent('mtc-fakecard:Server:setIdentity', input, data.vData.Price, item)
             end, function()
                return
             end)
        elseif Config.Progressbar == 'ox' then

            if lib.progressCircle({
                duration = Config.ForgeTime * 1000,
                position = 'bottom',
                label = Lang:t('Progressbar.Forging'),
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
            }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', input, data.vData.Price, item) else return end
        end
    end
end)

RegisterNetEvent('mtc-fakecards:Client:OpenInputOx', function (item, vData)
    if Config.Input == 'ox' then
        local inputOptions = {}

        if vData.Info.Firstname then
            inputOptions[#inputOptions+1] = {
                type = 'input', 
                label = Lang:t('Input.Firstname'), 
                required = true,
            }
        end

        if vData.Info.Lastname then
            inputOptions[#inputOptions+1] = {
                type = 'input', 
                label = Lang:t('Input.Lastname'), 
                required = true,
            }
        end

        if vData.Info.Country then
            inputOptions[#inputOptions+1] = {
                type = 'input', 
                label = Lang:t('Input.Country'), 
                required = true,
            }
        end

        if vData.Info.DateofBirth then
            inputOptions[#inputOptions+1] = {
                type = 'date', 
                label = Lang:t('Input.DateOfBirth'), 
                icon = {'far', 'calendar'}, 
                default = true, 
                format = Lang:t('Input.TypeDateOfBirth'), 
                returnString = true
            }
        end

        local inputData = lib.inputDialog(Lang:t('Input.PersonalInformation'), inputOptions)

        if not inputData then return end

        local data = {
            fakefirstname = inputData[1],
            fakelastname = inputData[2],
            fakebirthdate = inputData[4],
            fakenationality = inputData[3],
        }

        if Config.Progressbar == 'qb' then
            QBCore.Functions.Progressbar("forging", Lang:t('Progressbar.Forging'), 5000, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, vData.Price, item)
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
            }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, vData.Price, item) else return end
        end
    elseif Config.Input == 'qb' then

        local inputOptions = {}
        if vData.Info.Firstname then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.Firstname'),
                name = "firstname", 
                type = "text",
                isRequired = true,
            }
        end

        if vData.Info.Lastname then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.Lastname'),
                name = "lastname", 
                type = "text",
                isRequired = true,
            }
        end

        if vData.Info.Country then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.Country'),
                name = "country", 
                type = "text",
                isRequired = true,
            }
        end

        if vData.Info.DateofBirth then
            inputOptions[#inputOptions+1] = {
                text = Lang:t('Input.TypeDateOfBirth'),
                name = "date", 
                type = "text",
                isRequired = true,
            }
        end

        local dialog = exports['qb-input']:ShowInput({
            header = Lang:t('Input.PersonalInformation'),
            submitText = Lang:t('Input.Confirm'),
            inputs = inputOptions
        })

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
                TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, vData.Price, item)
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
            }) then TriggerServerEvent('mtc-fakecard:Server:setIdentity', data, vData.Price, item) else return end
        end
    end
end)

local function openMenu()
    if Config.Menu == 'ox' then

        local options = {}

        for item, vData in pairs(Config.Items) do
            options[#options+1] = {
                title = Lang:t('Menu.BuyItem', { itemLabel = QBCore.Shared.Items[item].label }),
                description = Lang:t('Menu.ItemDescription', { itemLabel = QBCore.Shared.Items[item].label, price = vData.Price }),
                icon = 'fa-solid fa-circle-info',
                onSelect = function ()
                    TriggerEvent('mtc-fakecards:Client:OpenInputOx', item, vData)
                end
            }
        end

        lib.registerContext({
            id = 'mtc-fakecard:mainMenu',
            title = Lang:t('Menu.ContactPerson'),
            options = options
        })

        lib.showContext('mtc-fakecard:mainMenu')
    else if Config.Menu == 'qb' then
        local mainMenu = {
            {
                header = Lang:t('Menu.ContactPerson'),
                isMenuHeader = true
            }
        }

        for item, vData in pairs(Config.Items) do
            mainMenu[#mainMenu+1] = {
                header = Lang:t('Menu.BuyItem', { itemLabel = QBCore.Shared.Items[item].label }),
                txt = Lang:t('Menu.ItemDescription', { itemLabel = QBCore.Shared.Items[item].label, price = vData.Price }),
                icon = 'fa-solid fa-circle-info',
                params = {
                    event = 'mtc-fakecards:Client:OpenInputQb',
                    args = {
                        item = item,
                        vData = vData
                    }
                }
            }
        end



        exports['qb-menu']:openMenu(mainMenu)
    else
        print('[ERROR] Config Error. Menu chosen not available')
    end
end
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
                    canInteract = function ()
                        local player = QBCore.Functions.GetPlayerData()

                        for _,v in pairs(Config.BlacklistedJobs) do
                            if not player.job.name == v then return true end
                            return false
                        end
                    end,
                    duty = true,
                },
            },
            distance = 3.0
        })
end)