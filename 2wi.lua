local QBCore = exports['qb-core']:GetCoreObject()
local function LoadModel(hash)
    RequestModel(hash)
 while not HasModelLoaded(hash) do
     Wait(1)
    end
 end
 local     PlayerData = QBCore.Functions.GetPlayerData()


Citizen.CreateThread(function ()


       local coords = Config.ped
      local coords1 = Config.ped2
      local hash = 1885233650
      LoadModel(hash)
      ped1 = CreatePed(2, hash, coords1.x, coords1.y, coords1.z-1, coords1.w, 0, 0)
      ped = CreatePed(2, hash, coords.x, coords.y, coords.z-1, coords.w, 0, 0)

end)
Citizen.CreateThread(function ()

    local playingAnimation = false

    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    SetPedComponentVariation(ped, 1, 0, 2, 2)
    SetPedComponentVariation(ped, 2, 42, 121, 3)
    SetPedComponentVariation(ped, 3, 3, 9, 2)
    SetPedComponentVariation(ped, 4, 1, 0, 2)
    SetPedComponentVariation(ped, 5, 55, 0, 2)
    SetPedComponentVariation(ped, 6, 0, 2, 2)
    SetPedComponentVariation(ped, 6, 35, 0, 2)
    SetPedComponentVariation(ped, 7, 0, 2, 2)
    SetPedComponentVariation(ped, 8, 35, 0, 2)
    SetPedComponentVariation(ped, 9, 43, 0, 2)
    SetPedComponentVariation(ped, 11, 19, 0, 2)
    SetPedPropIndex(ped, 0, 11, 0, true)
    SetPedHeadBlendData(ped, 5, 7, 1, 9, 0.0, false)
    



    FreezeEntityPosition(ped1, true)
    SetBlockingOfNonTemporaryEvents(ped1, true)
    SetEntityInvincible(ped1, true)
--ped 2
 
    SetPedComponentVariation(ped1, 1, 0, 2, 2)
    SetPedComponentVariation(ped1, 2, 121, 2, 2)
    SetPedComponentVariation(ped1, 3, 100, 9, 2)
    SetPedComponentVariation(ped1, 4, 116, 0, 2)
    SetPedComponentVariation(ped1, 5, 62, 0, 2)
    SetPedComponentVariation(ped1, 6, 0, 2, 2)
    SetPedComponentVariation(ped1, 6, 90, 0, 2)
    SetPedComponentVariation(ped1, 7, 0, 2, 2)
    SetPedComponentVariation(ped1, 8, 62, 0, 2)
    SetPedComponentVariation(ped1, 9, 29, 0, 2)
    SetPedComponentVariation(ped1, 11, 306, 0, 2)
    SetPedPropIndex(ped1, 0, 11, 0, true)
    SetPedHeadBlendData(ped1, 4, 4, 12, 1, 0.0, false)
    SetPedComponentVariation(ped1, 2, 144, 0, 0)
    SetPedHairColor(ped1, 61, 0)
    SetPedHeadOverlay(ped1, 1, 11, 1.0)
    SetPedHeadOverlayColor(ped1, 1, 1, 61, 0)



    SetPedEyeColor(ped, 1)
    SetPedEyeColor(ped1, 1)
end)


Citizen.CreateThread(function()


local policeZone1 = nil

policeZone1 = BoxZone:Create(Config.Boxzonecoords, Config.boxlength, Config.width, {
    name= Config.name,
    heading= Config.heading,
  
    minZ=  Config.minZ,
    maxZ= Config.maxZ
  })
  
  policeZone1:onPlayerInOut(function (isPointinside)

        if isPointinside then
            TriggerEvent("spawnpolicejob1")
        end
  
end)
end)

RegisterNetEvent('spawnpolicejob1', function()

if Config.policeonly == "true" then
    if PlayerData.job.name == "police" then

        TriggerEvent("spawnpolicejob")
    end
elseif Config.policeonly == "false" then
    TriggerEvent("spawnpolicejob")
   
    end
end)


RegisterNetEvent('spawnpolicejob', function()
local policeZone12 = nil

policeZone12 = BoxZone:Create(Config.Boxzonecoords, Config.boxlength, Config.width, {
    name= Config.name,
    heading= Config.heading,

    minZ=  Config.minZ,
    maxZ= Config.maxZ
  })
  
  policeZone12:onPlayerInOut(function (isPointinside, point)

    if isPointinside then

        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 0.5, "6al3mrk", 0.4)
        RequestAnimDict("anim@mp_player_intincarsalutestd@ds@")
        if (not HasAnimDictLoaded("anim@mp_player_intincarsalutestd@ds@")) then 
            Citizen.Wait(0) 
            PlayFacialAnim(ped1, 'mic_chatter', 'mp_facial')
            TaskPlayAnim(ped,"anim@mp_player_intincarsalutestd@ds@","idle_a", 1.0, -1.0, -1, 1, 1, true, true, true)
            TaskPlayAnim(ped1,"anim@mp_player_intincarsalutestd@ds@","idle_a", 1.0, -1.0, -1, 1, 1, true, true, true)
            playingAnimation = true
           
        else
            TaskPlayAnim(ped,"anim@mp_player_intincarsalutestd@ds@","idle_a", 1.0, -1.0, -1, 1, 1, true, true, true)
            TaskPlayAnim(ped1,"anim@mp_player_intincarsalutestd@ds@","idle_a", 1.0, -1.0, -1, 1, 1, true, true, true)
            PlayFacialAnim(ped1, 'mic_chatter', 'mp_facial')
            playingAnimation = true
        end
    elseif playingAnimation then
        ClearPedTasks(ped)
        ClearPedTasks(ped1)
        playingAnimation = false
    end
   
    
end)
end)




