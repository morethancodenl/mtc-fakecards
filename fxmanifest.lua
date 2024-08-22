fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'MTC-Fakecards'
description 'A fake card scripts for qbox and ox_lib'
author 'More Than Code'
version '0.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

files {
    'config/*.lua',
    'locales/*.json'
}

dependencies {
    'ox_lib',
    'qbx_core',
    'qbx_idcard'
}