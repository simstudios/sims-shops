
function Shop()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'badulaque', {
		title    = 'Shops',
		align    = Config.Align,
		elements = {
			{label = 'Ready Meal', value = 'comidalista'},
			{label = 'Drinks', value = 'bebidas'},
			{label = 'Snacks', value = 'snacks'},
			{label = 'Others', value = 'otros'}
	}}, function(data, menu)
		if data.current.value == 'otros' then
			Otros()
		elseif data.current.value == 'bebidas' then
			Bebidas()
	    elseif data.current.value == 'snacks' then
		    Snacks()
	    elseif data.current.value == 'comidalista' then
		    ComidaLista()
	    end
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

-- Categorias
function Otros(zone)
	local elements = {}
	ShopOpen = true

	for k,v in ipairs(Config.ItemsOthers) do
		table.insert(elements, {
			label = ('%s - <span style="color:green;">$%s</span>'):format(v.label, ESX.Math.GroupDigits(v.price)),
			name  = v.label,
			model = v.model,
			price = v.price,
			identifier = v.id
		})
	end

	ESX.UI.Menu.CloseAll()	
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title = "Others",
		align = Config.Align,
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('shops:ComprarOtros', function(bought)
		end, data.current.model,data.current.identifier)
	end, function(data, menu)
		ShopOpen = false
		menu.close()

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = 'Badulaque'
		CurrentActionData = { zone = zone }
	end, function(data, menu)
	end)
end

function Bebidas(zone)
	local elements = {}
	ShopOpen = true

	for k,v in ipairs(Config.ItemsDrinks) do
		table.insert(elements, {
			label = ('%s - <span style="color:green;">$%s</span>'):format(v.label, ESX.Math.GroupDigits(v.price)),
			name  = v.label,
			model = v.model,
			price = v.price,
			identifier = v.id
		})
	end

	ESX.UI.Menu.CloseAll()	
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title = "Drinks",
		align = Config.Align,
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('shops:ComprarBebidas', function(bought)
		end, data.current.model,data.current.identifier)
	end, function(data, menu)
		ShopOpen = false
		menu.close()

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = 'Badulaque'
		CurrentActionData = { zone = zone }
	end, function(data, menu)
	end)
end

function Snacks(zone)
	local elements = {}
	ShopOpen = true

	for k,v in ipairs(Config.ItemsSnacks) do
		table.insert(elements, {
			label = ('%s - <span style="color:green;">$%s</span>'):format(v.label, ESX.Math.GroupDigits(v.price)),
			name  = v.label,
			model = v.model,
			price = v.price,
			identifier = v.id
		})
	end

	ESX.UI.Menu.CloseAll()	
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title = "Snacks",
		align = Config.Align,
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('shops:ComprarSnacks', function(bought)
		end, data.current.model,data.current.identifier)
	end, function(data, menu)
		ShopOpen = false
		menu.close()

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = 'Badulaque'
		CurrentActionData = { zone = zone }
	end, function(data, menu)
	end)
end

function ComidaLista(zone)
	local elements = {}
	ShopOpen = true

	for k,v in ipairs(Config.ItemsReadyMeal) do
		table.insert(elements, {
			label = ('%s - <span style="color:green;">$%s</span>'):format(v.label, ESX.Math.GroupDigits(v.price)),
			name  = v.label,
			model = v.model,
			price = v.price,
			identifier = v.id
		})
	end

	ESX.UI.Menu.CloseAll()	
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title = "Ready Meals",
		align = Config.Align,
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('shops:ComprarComidaLista', function(bought)
		end, data.current.model,data.current.identifier)
	end, function(data, menu)
		ShopOpen = false
		menu.close()

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = 'Badulaque'
		CurrentActionData = { zone = zone }
	end, function(data, menu)
	end)
end

DrawText3D = function(x,y,z,textInput,fontId,scaleX,scaleY,opacity)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*8
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(250, 250, 250, opacity)
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
  end

  
  AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if ShopOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)
