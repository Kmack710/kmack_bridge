
fx_version "cerulean"
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'
version '0.5.3'

files {
	'config.lua',
	'frameworks/**/*.lua',
    'modules/**/*.lua',
	'data/init.lua',
}


shared_scripts {
	-- '@es_extended/imports.lua', --- Comment out if not using ESX 
 	"@ox_lib/init.lua",
}

client_scripts {
	--- '@qbx_core/modules/playerdata.lua', --- uncomment for qbox
	'data/client/main.lua',
	'data/client/init.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'data/server/main.lua',
	'data/client/init.lua',
}

dependancy 'ox_lib'