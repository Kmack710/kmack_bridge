
fx_version "cerulean"
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'
version '0.5.1'

files {
	'frameworks/**/*.lua',
    'modules/**/*.lua',
}


shared_scripts {
	-- '@es_extended/imports.lua', --- Comment out if not using ESX 
	'config.lua',
 	"@ox_lib/init.lua"
}

client_scripts {
	--- '@qbx_core/modules/playerdata.lua', --- uncomment for qbox
	'data/client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'data/server/main.lua'
}

dependancy 'ox_lib'