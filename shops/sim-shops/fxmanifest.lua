fx_version 'cerulean'
games {'gta5'}

author 'simstudios'
description 'Basic Shops System'

client_scripts {
	'@es_extended/locale.lua',
	"Client/Modules/*.lua",
	"Config.lua",
	"Client/*.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    	'@es_extended/locale.lua',
	"Config.lua",
	"Server/*.lua"
}
