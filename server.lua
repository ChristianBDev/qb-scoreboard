local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-scoreboard:server:updateScoreboardData', function(_, cb)
    local Players = QBCore.Functions.GetQBPlayers()
    local PlayerNames = {}
    local ids = {}
    local policeCount = 0
    local emsCount = 0
    local mechanicCount = 0
    local totalPlayers = 0

    for _, v in pairs(Players) do
        if v then
            totalPlayers += 1

            if v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
                policeCount += 1
            end

            if v.PlayerData.job.name == 'ambulance' and v.PlayerData.job.onduty then
                emsCount += 1
            end

            if v.PlayerData.job.name == 'mechanic' and v.PlayerData.job.onduty then
                mechanicCount += 1
            end

            PlayerNames = v.PlayerData.name
            ids = v.PlayerData.source
        else
            QBCore.Functions.Notify('No players found', 'error')
        end
    end
    cb(PlayerNames, ids, totalPlayers, policeCount, emsCount, mechanicCount)
end)

RegisterNetEvent('qb-scoreboard:server:SetActivityBusy', function(activity, bool)
    Config.IllegalActions[activity].busy = bool
    TriggerClientEvent('qb-scoreboard:client:SetActivityBusy', -1, activity, bool)
end)
