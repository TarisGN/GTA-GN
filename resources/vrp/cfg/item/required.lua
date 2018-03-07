
local items = {}

items["medkit"] = {"Medical Kit","Used to reanimate unconscious people.",nil,0.4}
items["dirty_money"] = {"Dirty money","Illegally earned money.",nil,0}
items["repairkit"] = {"Repair Kit","Utilisé pour réparer les véhicules.",nil,0.4}
items["chalumeau"] = {"Chalumeau","Utilisé pour ouvrir les véhicules.",nil,0.4}
items["metal"] = {"Métal","",nil,0.8}
items["plastique"] = {"Plastique","",nil,0.3}
items["colis"] = {"Colis Postal","",nil,0.1}
items["lettres"] = {"Lettre Postale","",nil,0.1}
items["foin"] = {"Foin","",nil,0.1}
items["jeton"] = {"Jeton de casino","",nil,0.1}
items["caisse"] = {"Caisse de médicaments usagés","",nil,0.1}
items["caissearme"] = {"Caisse de pièces d'armement","",nil,0.3}
items["cube"] = {"Bagnole comprimée","Cube de ferraille",nil,30}
--TRESOR
items["diamant"] = {"Diamant","",nil,15}
items["meteorite"] = {"Meteorite","",nil,15}
items["sel"] = {"Sel","",nil,10}
items["tresor"] = {"Tresor","",nil,50}
items["pneu"] = {"Pneu Rechappé","",nil,1}
items["lingot"] = {"lingot inerte","",nil,1}
items["raisin"] = {"raisin","",nil,0.2}
items["vin"] = {"vin","",nil,0.2}
items["champagne"] = {"champagne","",nil,0.2}



-- money
items["money"] = {"Money","Argent emballé.",function(args)
  local choices = {}
  local idname = args[1]

  choices["Unpack"] = {function(player,choice,mod)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      local amount = vRP.getInventoryItemAmount(user_id, idname)
      vRP.prompt(player, "Combien déballer ? (max "..amount..")", "", function(player,ramount)
        ramount = parseInt(ramount)
        if vRP.tryGetInventoryItem(user_id, idname, ramount, true) then -- unpack the money
          vRP.giveMoney(user_id, ramount)
          vRP.closeMenu(player)
        end
      end)
    end
  end}

  return choices
end,0}

-- money binder
items["money_binder"] = {"Money binder","utilisé pour attacher l'argent.",function(args)
  local choices = {}
  local idname = args[1]

  choices["Bind money"] = {function(player,choice,mod) -- bind the money
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      local money = vRP.getMoney(user_id)
      if money >= 1000 then
        if vRP.tryGetInventoryItem(user_id, idname, 1, true) and vRP.tryPayment(user_id,1000) then
          vRP.giveInventoryItem(user_id, "money", 1000, true)
          vRP.closeMenu(player)
        end
      else
        vRPclient.notify(player,{vRP.lang.money.not_enough()})
      end
    end
  end}

  return choices
end,0}

-- parametric weapon items
-- give "wbody|WEAPON_PISTOL" and "wammo|WEAPON_PISTOL" to have pistol body and pistol bullets

local get_wname = function(weapon_id)
  local name = string.gsub(weapon_id,"WEAPON_","")
  name = string.upper(string.sub(name,1,1))..string.lower(string.sub(name,2))
  return name
end

--- weapon body
local wbody_name = function(args)
  return get_wname(args[2]).." body"
end

local wbody_desc = function(args)
  return ""
end

local wbody_choices = function(args)
  local choices = {}
  local fullidname = joinStrings(args,"|")

  choices["Equip"] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      if vRP.tryGetInventoryItem(user_id, fullidname, 1, true) then -- give weapon body
        local weapons = {}
        weapons[args[2]] = {ammo = 0}
        vRPclient.giveWeapons(player, {weapons})

        vRP.closeMenu(player)
      end
    end
  end}

  return choices
end

local wbody_weight = function(args)
  return 0.75
end

items["wbody"] = {wbody_name,wbody_desc,wbody_choices,wbody_weight}

--- weapon ammo
local wammo_name = function(args)
  return get_wname(args[2]).." ammo"
end

local wammo_desc = function(args)
  return ""
end

local wammo_choices = function(args)
  local choices = {}
  local fullidname = joinStrings(args,"|")

  choices["Load"] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      local amount = vRP.getInventoryItemAmount(user_id, fullidname)
      vRP.prompt(player, "Quandtité à charger ? (max "..amount..")", "", function(player,ramount)
        ramount = parseInt(ramount)

        vRPclient.getWeapons(player, {}, function(uweapons)
          if uweapons[args[2]] ~= nil then -- check if the weapon is equiped
            if vRP.tryGetInventoryItem(user_id, fullidname, ramount, true) then -- give weapon ammo
              local weapons = {}
              weapons[args[2]] = {ammo = ramount}
              vRPclient.giveWeapons(player, {weapons,false})
              vRP.closeMenu(player)
            end
          end
        end)
      end)
    end
  end}

  return choices
end

local wammo_weight = function(args)
  return 0.01
end

items["wammo"] = {wammo_name,wammo_desc,wammo_choices,wammo_weight}

return items
