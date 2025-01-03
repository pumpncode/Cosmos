local p = SMODS.current_mod
G.cosmos = {
    path = p,
    packs = {
        HolidayPack = {
            ticket = {
                name = 'Holiday Pack'
            }
        },
        Test = {
            ticket = {
                name = 'Testing Stuff'
            }
        }
    },
    C = {
        TRANSPARENT_DARK = HEX('11111133')
    }
}

local cosmos = G.cosmos.path

SMODS.Atlas{
    key = 'modicon',
    path = 'mod_icon.png',
    px = 32,
    py = 32
}

local packs_list = {}
sendDebugMessage('Loading in packs...', 'Cosmos')
for i, v in pairs(cosmos.config.packs) do
    if v.enabled then
        sendDebugMessage(i..' pack enabled, loading in...', 'Cosmos')
        table.insert(packs_list,i)
    else
        sendDebugMessage(i..' pack disabled, skipping...', 'Cosmos')
    end
end

for i, pack in ipairs(packs_list) do
    SMODS.Atlas {
        key = pack.."Atlas",
        path = pack..".png",
        px = 71,
        py = 95
    }

    local cards = NFS.getDirectoryItems(cosmos.path..'packs/'..pack)
    for _, filename in pairs(cards) do
        local file, exception = SMODS.load_file('packs/'..pack .. "/" .. filename)
        if exception then
            error(exception)
        end
        file()
    end
end

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