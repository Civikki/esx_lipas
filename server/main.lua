ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_lipassyssy:vittu')
AddEventHandler('esx_lipassyssy:vittu', function(itemi, maara)
	local sourceXPlayer = ESX.GetPlayerFromId(source)

	if sourceXPlayer.getInventoryItem(itemi).count >= maara then
	  TriggerClientEvent('esx_lipassyssy:vittureload', source, itemi, maara)
	else
		TriggerClientEvent('esx:showNotification', source, ('Sinulla ei ole tarvittavia ammuksia/lippaita')) -- FIN
	end
end)

RegisterServerEvent('esx_lipassyssy:vittupois')
AddEventHandler('esx_lipassyssy:vittupois', function(itemi, maara)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	sourceXPlayer.removeInventoryItem(itemi, maara)
end)