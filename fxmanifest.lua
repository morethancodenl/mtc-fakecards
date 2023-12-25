fx_version 'cerulean'
game 'gta5'

author 'More Than Code'
decription 'A script where players can buy fake id-cards'
version '0.0.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'shared/*.lua',
    'locales/*.lua',
    'locales/*en.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

lua54 'yes'
