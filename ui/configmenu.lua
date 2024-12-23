local cosmos = G.cosmos.path or SMODS.current_mod
local config = cosmos.config

-- Pack Selection toggle instructor
for i, v in pairs(config.packs) do
    sendDebugMessage(i, 'UI STUFF')
    
end


SMODS.current_mod.config_tab = function()
    return {n = G.UIT.ROOT, config = {
        colour = G.C.BLACK,
        padding = 0.3,
        r = 0.2,
    }, nodes = {
        {n = G.UIT.R, config = {minh = 8, minw = 15, colour = G.C.BLUE, r = 0.5, align = 'cl', padding = 0.5}, nodes = {
            {n = G.UIT.C, config = {minh = 7, minw = 4, colour = G.C.PURPLE, r = 0.5, align = 'tm', padding = 0.3}, nodes = {
                {n = G.UIT.R, config = {minh = 1.5, minw = 3.5, colour = G.C.GREEN, r = 0.5, emboss = 0.1, align = 'cm'}, nodes = {
                    {n = G.UIT.T, config = {text = 'Cosmos', colour = G.C.UI.TEXT_LIGHT, scale = 1.1}}
                }},
                {n = G.UIT.R, config = {minh = 0.5}},
                {n = G.UIT.R, config = {minw = 3, padding = -0.05}, nodes = {
                    {n = G.UIT.T, config = {text = 'Pack', colour = G.C.UI.TEXT_LIGHT, scale = 0.8}}
                }},
                {n = G.UIT.R, config = {minw = 3, padding = -0.05}, nodes = {
                    {n = G.UIT.T, config = {text = 'Selection', colour = G.C.UI.TEXT_LIGHT, scale = 0.8}}
                }}
            }},
            {n = G.UIT.C, config = {minw = 9.5, minh = 7, colour = G.C.UI.TRANSPARENT_DARK, r = 1, padding = 0.2, align = 'cl'}, nodes = {
                generate_cosmos_config_packs()
            }}
        }}
    }}
end