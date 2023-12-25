Config = {
    Framework = 'qb-core', -- In case you've renamed your Framework
    CoreObject = 'QBCore', -- In case you've renamed your Framework

    Inventory = 'ox_inventory', -- 'ox_inventory' or 'qb'
    Menu = 'ox', -- 'ox' or 'qb'
    Progressbar = 'ox', -- 'ox' or 'qb'
    Input = 'ox', -- 'ox' or 'qb'

    Location = {
        Coords = vector4(-237.27, -989.43, 29.13, 211.71),
        Model = `g_m_y_armgoon_02`,
    },
    Price = {
        ID = 500,
        Driver = 1000,
    }
}

if Config.Framework == 'qb-core' then
    QBCore = exports['qb-core']:GetCoreObject()
end

-- QBox