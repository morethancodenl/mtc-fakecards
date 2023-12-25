Config = {
    Framework = 'qb-core', -- In case you've renamed your Framework
    CoreObject = 'QBCore', -- In case you've renamed your Framework

    Inventory = 'qb', -- 'ox' or 'qb'
    Menu = 'ox', -- 'ox' or 'qb'
    Progressbar = 'ox', -- 'ox' or 'qb'
    Input = 'ox', -- 'ox' or 'qb'

    Items = {
        ['id_card'] = {
            Info = {
                Firstname = true, -- enable or disable
                Lastname = true, -- enable or disable
                Country = true, -- enable or disable 
                DateofBirth = true, -- enable or disable
            },
            Price = 500
        },
        ['driver_license'] = {
            Info = {
                Firstname = true, -- enable or disable
                Lastname = true, -- enable or disable
                Country = false, -- enable or disable
                DateofBirth = true, -- enable or disable
            },
            Price = 500
        },
    },

    ForgeTime = 10, -- in Seconds
    BlacklistedJobs = {
        'police',
        'ambulance'
    },
    Location = {
        Coords = vector4(-237.27, -989.43, 29.13, 211.71),
        Model = `g_m_y_armgoon_02`,
    },
}

if Config.Framework == 'qb-core' then
    QBCore = exports['qb-core']:GetCoreObject()
end