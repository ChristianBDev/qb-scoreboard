local QBCore = exports['qb-core']:GetCoreObject()
local scoreboardOpened = false

-- NUI Callbacks
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    scoreboardOpened = false
    cb('ok')
end)

-- Commands/Keybinds
RegisterCommand('scoreboard', function()
    if not scoreboardOpened then
        QBCore.Functions.TriggerCallback('qb-scoreboard:server:updateScoreboardData', function(players, ids, totalPlayers, policeCount, emsCount, mechanicCount)
            SendNUIMessage({
                action = 'updateScoreboardData',
                players = players,
                ids = ids,
                police_count = policeCount,
                ems_count = emsCount,
                mechanic_count = mechanicCount,
                total_players = totalPlayers,
            })
            SetNuiFocus(true, true)
            scoreboardOpened = true
        end)
    else
        scoreboardOpened = false
    end
end, false)

RegisterKeyMapping('scoreboard', 'Open Scoreboard', 'keyboard', Config.OpenKey)

-- Events
RegisterNetEvent('qb-scoreboard:client:SetActivityBusy', function(activity, busy)
    Config.IllegalActions[activity].busy = busy
end)
