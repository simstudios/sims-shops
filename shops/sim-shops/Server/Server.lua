ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('shops:ComprarOtros', function(source, cb, weaponName,identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.ItemsOthers[identifier].price
		
			if xPlayer.getMoney() >= price then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(weaponName, 1)
				xPlayer.showNotification('You have bought 1x a '..weaponName..' for '..price..'$')
				cb(true)
			else
				xPlayer.showNotification('You dont have enough money')
				cb(false)
			end
			
end)

ESX.RegisterServerCallback('shops:ComprarBebidas', function(source, cb, weaponName,identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.ItemsDrinks[identifier].price
		
			if xPlayer.getMoney() >= price then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(weaponName, 1)
				xPlayer.showNotification('You have bought 1x a '..weaponName..' for '..price..'$')
				cb(true)
			else
				xPlayer.showNotification('You dont have enough money')
				cb(false)
			end
			
end)

ESX.RegisterServerCallback('shops:ComprarSnacks', function(source, cb, weaponName,identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.ItemsSnacks[identifier].price
		
			if xPlayer.getMoney() >= price then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(weaponName, 1)
				xPlayer.showNotification('You have bought 1x a '..weaponName..' for '..price..'$')
				cb(true)
			else
				xPlayer.showNotification('You dont have enough money')
				cb(false)
			end
			
end)

ESX.RegisterServerCallback('shops:ComprarComidaLista', function(source, cb, weaponName,identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
    local fullname = GetPlayerName(source)
	local price = Config.ItemsReadyMeal[identifier].price
		
			if xPlayer.getMoney() >= price then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(weaponName, 1)
				xPlayer.showNotification('You have bought 1x a '..weaponName..' for '..price..'$')
				cb(true)
			else
				xPlayer.showNotification('You dont have enough money')
				cb(false)
			end
			
end)
