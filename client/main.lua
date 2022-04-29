ESX = nil
lataus = false


local pyssyt = {
  [GetHashKey('weapon_flaregun')] = {clip = "merkkipatruuna", juuh = 1},
  [GetHashKey('weapon_musket')] = {clip = "muskettipatruuna", juuh = 1},
  [GetHashKey('weapon_rpg')] = {clip = "rpgpatruuna", juuh = 1},
  [GetHashKey('weapon_gusenberg')] = {clip = "gusclip", juuh = 1},
  --PistolClipillä olevat\/
  [GetHashKey('WEAPON_PISTOL')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('WEAPON_PISTOL_MK2')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_combatpistol')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_appistol')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_pistol50')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_snspistol')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_snspistol_mk2')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_heavypistol')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_vintagepistol')] = {clip = "pistolclip", juuh = 1},
  [GetHashKey('weapon_machinepistol')] = {clip = "pistolclip", juuh = 1},
  --PistolClipillä olevat/\
  --Rellut \/
  [GetHashKey('weapon_revolver')] = {clip = "rellupanos", juuh = 6},
  [GetHashKey('weapon_revolver_mk2')] = {clip = "rellupanos", juuh = 6},
  [GetHashKey('weapon_doubleaction')] = {clip = "rellupanos", juuh = 6},
  --Rellut /\
  --SMG:t \/
  [GetHashKey('weapon_microsmg')] = {clip = "smgclip", juuh = 1},
  [GetHashKey('weapon_smg')] = {clip = "smgclip", juuh = 1},
  [GetHashKey('weapon_smg_mk2')] = {clip = "smgclip", juuh = 1},
  [GetHashKey('weapon_assaultsmg')] = {clip = "smgclip", juuh = 1},
  [GetHashKey('weapon_combatpdw')] = {clip = "smgclip", juuh = 1},
  [GetHashKey('weapon_minismg')] = {clip = "smgclip", juuh = 1},
  --SMG:t /\
  --Haulikot \/
  [GetHashKey('weapon_pumpshotgun')] = {clip = "ssgclip", juuh = 1},
  [GetHashKey('weapon_pumpshotgun_mk2')] = {clip = "sgclip", juuh = 1},
  [GetHashKey('weapon_sawnoffshotgun')] = {clip = "sgclip", juuh = 1},
  [GetHashKey('weapon_assaultshotgun')] = {clip = "sgclip", juuh = 1},
  [GetHashKey('weapon_bullpupshotgun')] = {clip = "sgclip", juuh = 1},
  [GetHashKey('weapon_heavyshotgun')] = {clip = "sgclip", juuh = 1},
  [GetHashKey('weapon_autoshotgun')] = {clip = "sgclip", juuh = 1},
  [GetHashKey('weapon_dbshotgun')] = {clip = "sgpanos", juuh = 2},
  --Haulikot /\
  --Riflet \/
  [GetHashKey('weapon_assaultrifle')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_assaultrifle_mk2')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_carbinerifle')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_carbinerifle_mk2')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_advancedrifle')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_specialcarbine')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_specialcarbine_mk2')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_bullpuprifle')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_bullpuprifle_mk2')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_compactrifle')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_militaryrifle')] = {clip = "arclip", juuh = 1},
  [GetHashKey('weapon_heavyrifle')] = {clip = "arclip", juuh = 1},
  --Riflet /\
  --LMG:t \/
  [GetHashKey('weapon_mg')] = {clip = "lmgclip", juuh = 1},
  [GetHashKey('weapon_combatmg')] = {clip = "lmgclip", juuh = 1},
  [GetHashKey('weapon_combatmg_mk2')] = {clip = "lmgclip", juuh = 1},
  --LMG:t /\
  --Sniput \/
  [GetHashKey('weapon_sniperrifle')] = {clip = "sniperclip", juuh = 1},
  [GetHashKey('weapon_heavysniper')] = {clip = "sniperclip", juuh = 1},
  [GetHashKey('weapon_heavysniper_mk2')] = {clip = "sniperclip", juuh = 1},
  [GetHashKey('weapon_marksmanrifle')] = {clip = "sniperclip", juuh = 1},
  [GetHashKey('weapon_marksmanrifle_mk2')] = {clip = "sniperclip", juuh = 1},
  --Sniput /\

}









Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()

  while true do
    Wait(0)
    ped = GetPlayerPed(-1)
    hash = GetSelectedPedWeapon(GetPlayerPed(-1))

    
    local MaksimiAmmot = GetMaxAmmoInClip(ped, hash, 1)
    local VittuAmmoaSaatana = GetAmmoInPedWeapon(ped, hash)

    if VittuAmmoaSaatana >= MaksimiAmmot then
      SetPedAmmo(GetPlayerPed(-1), hash, MaksimiAmmot)
    end
    if not lataus then
      if IsControlJustReleased(1, 45) then
        if IsPedArmed(ped, 4) then
          if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_STUNGUN") then
            ESX.ShowNotification('Miks sä sähköpyssyy yrität ladata :D WTF HAHAA PASKA')
          else
            if hash~=nil then
              if VittuAmmoaSaatana >= MaksimiAmmot then
                  ESX.ShowNotification('Sinulla on täysi lipas asesaasi')
                elseif VittuAmmoaSaatana < MaksimiAmmot then
                  for k,v in pairs(pyssyt) do
                    if GetSelectedPedWeapon(PlayerPedId()) == k then
                      TriggerServerEvent('esx_lipassyssy:vittu', v.clip, v.juuh)
                      DisablePlayerFiring(GetPlayerPed(-1), true)
                    end
                  end
                end
            end
          end
        end
      end
    end
  end
end)

RegisterNetEvent('esx_lipassyssy:vittureload')
AddEventHandler('esx_lipassyssy:vittureload', function(itemi, maara)
  lataus = true
  ped = GetPlayerPed(-1)
  hash = GetSelectedPedWeapon(GetPlayerPed(-1))
  local MaksimiAmmot = GetMaxAmmoInClip(ped, hash, 1)
  	TriggerEvent("mythic_progbar:client:progress", {
	  name = "Lataus_paska",
	  duration = 2000,
	  label = "LADATAAN ASETTA!",
	  useWhileDead = false,
	  canCancel = false,
	  controlDisables = {
		  disableMovement = false,
		  disableCarMovement = false,
		  disableMouse = false,
		  disableCombat = true,
	  },
	  animation = {
		  animDict = "mp_arresting",
		  anim = "a_uncuff",
		  flags = 49,
	  },
  }, function(canceled)
    TriggerServerEvent('esx_lipassyssy:vittupois', itemi, maara)
    SetPedAmmo(GetPlayerPed(-1), hash, MaksimiAmmot)
    ESX.ShowNotification("~r~Käytit lippaan aseen")
    MakePedReload(GetPlayerPed(-1))
    SetPedCanSwitchWeapon(GetPlayerPed(-1), true)
    lataus = false
	end)
end)
