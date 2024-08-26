Config = Config or {}

Config.OpenKey = 'HOME'

-- Minimum Police for Actions
Config.IllegalActions = {
    ['storerobbery'] = {
        busy = false,
        label = 'Store Robbery',
    },
    ['bankrobbery'] = {
        busy = false,
        label = 'Bank Robbery'
    },
    ['jewellery'] = {
        busy = false,
        label = 'Jewellery'
    },
    ['pacific'] = {
        busy = false,
        label = 'Pacific Bank'
    },
    ['paleto'] = {
        busy = false,
        label = 'Paleto Bay Bank'
    }
}
