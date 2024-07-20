
fx_version "cerulean"
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

files {
	'config.lua',
	'frameworks/*/*.lua',
    'modules/*/*.lua',
}


shared_script "@ox_lib/init.lua"

client_scripts {
	'data/client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'data/server/*.lua'
}

dependancy 'ox_lib'