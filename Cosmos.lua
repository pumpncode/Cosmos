G.cosmos = {
    path = SMODS.current_mod,
    config = SMODS.current_mod.config,
    packs = {
        Test = {
            ticket = {
                name = 'Testing Stuff'
            },
            cards = {}
        },
        HolidayPack = {
            ticket = {
                name = 'Holiday Pack'
            },
            cards = {}
        }
    },
    C = {
        TRANSPARENT_DARK = HEX('11111133')
    },
    enabled = {},
    disabled = {}
}

local cosmos = G.cosmos.path

SMODS.Atlas{
    key = 'modicon',
    path = 'mod_icon.png',
    px = 32,
    py = 32
}

sendInfoMessage('Loading in packs...', 'Cosmos')
for pack, packtable in pairs(cosmos.config.packs) do
    sendInfoMessage('Loading in '..G.cosmos.packs[pack].ticket.name..'...', 'Cosmos')
    if packtable.enabled then
        sendInfoMessage(G.cosmos.packs[pack].ticket.name..' is enabled.', 'Cosmos')
        G.cosmos.enabled[pack] = true
    else
        sendInfoMessage(G.cosmos.packs[pack].ticket.name..' is disabled, re-enable through the config menu if desired.', 'Cosmos')
        G.cosmos.enabled[pack] = false
    end
    SMODS.Atlas {
        key = pack.."Atlas",
        path = pack..".png",
        px = 71,
        py = 95
    }

    local packs = NFS.getDirectoryItems(cosmos.path..'packs/'..pack)
    for _, filename in pairs(packs) do
        local file, exception = SMODS.load_file('packs/'..pack .. "/" .. filename)
        if exception then
            error(exception)
        end
        file()
        table.insert(G.cosmos.packs[pack].cards, "j_cosmos_"..filename:gsub(".lua",""))
    end
end
sendInfoMessage('All packs loaded.', 'Cosmos')

local file, exception = SMODS.load_file('packs/booster.lua')
    if exception then
        error(exception)
    end
file()

SMODS.Atlas {
    key = 'cosmos_logo_h',
    path = 'cosmos_logo_horizontal.png',
    px = 178,
    py = 49,
    prefix_config = { key = false }
}

local items = NFS.getDirectoryItems(cosmos.path..'ui')
for _, filename in pairs(items) do
    local file, exception = SMODS.load_file('ui/'..filename)
    if exception then
        error(exception)
    end
    file()
end