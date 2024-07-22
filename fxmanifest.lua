
fx_version "cerulean"
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

files {
	'config.lua',
	'frameworks/*/*.lua',
    'modules/*/*.lua',
}


shared_scripts {
	-- '@es_extended/imports.lua', --- Comment out if not using ESX 
 	"@ox_lib/init.lua"
}

client_scripts {
	--- '@qbx_core/modules/playerdata.lua', --- uncomment for qbox
	'data/client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'data/server/*.lua'
}

dependancy 'ox_lib'