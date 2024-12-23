local p = SMODS.current_mod
G.cosmos = {
    path = p,
    packs = {
        JollyJokers = {
            ticket = {
                name = 'Jolly Jokers'
            }
        },
        Test = {
            ticket = {
                name = 'Testing Stuff'
            }
        }
    }
}

local cosmos = G.cosmos.path

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
        key = pack,
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

local items = NFS.getDirectoryItems(cosmos.path..'ui')
for _, filename in pairs(items) do
    local file, exception = SMODS.load_file('ui/'..filename)
    if exception then
        error(exception)
    end
    file()
end