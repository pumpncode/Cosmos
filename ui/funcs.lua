local cosmos = G.cosmos.path or SMODS.current_mod
local config = cosmos.config

--G.FUNCS.whatever = function()
--Do Stuff
--end
function generate_cosmos_config_packs(args)
    local output = { n = G.UIT.C, config = { minw = 3, minh = 6, align = 'tm', padding = 0.3 }, nodes = {} }
    for i, v in pairs(G.cosmos.packs) do
        local t = v.ticket
        t.colour = t.colour or G.C.BLUE
        t.name = t.name or 'NO NAME PROVIDED'
        t.options = t.options or 'enabled'
        t.back_colour = t.back_colour or G.C.BLACK
        local node = {
            n = G.UIT.R,
            config = { minw = 2.5, minh = 1.2, maxw = 3, maxh = 2, colour = t.back_colour, padding = 0.2, r = 0.1 },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { minw = 2.8, colour = t.colour, r = 1, hover = true, can_collide = true, button = 'generate_cosmos_' .. i .. '_page', outline = 0.6, outline_colour = G.C.WHITE, emboss = 0.1, align = 'cm' },
                    nodes = {
                        { n = G.UIT.T, config = { text = t.name, scale = 1, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
                    }
                },
                {
                    n = G.UIT.C,
                    config = {},
                    nodes = {
                        create_toggle { label = '', active_colour = t.colour, scale = 1, w = 0, shadow = true, ref_table = config.packs[i], ref_value = 'enabled' }
                    }
                }
            }
        }
        table.insert(output.nodes, node)
    end
    return output
end

--[[ G.FUNCS.generate_cosmos_JollyJokers_page = function()

end ]]


G.FUNCS.generate_cosmos_JollyJokers_page = function(args)
    G.FUNCS.overlay_menu({
        definition = create_UIBox_generic_options({
            back_func = 'cosmos_page_exit',
            contents = {
                {
                    n = G.UIT.R,
                    config = { colour = G.C.BLACK, r = 1, padding = 0.3 },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { minh = 7, minw = 10, colour = G.C.RED, r = 1, align = 'cl' },
                            nodes = {
                                {n = G.UIT.C, config = {minh = 6, minw = 3, colour = G.C.GREEN, r = 1, align = 'tm', padding = 0.3}, nodes = {
                                    {n = G.UIT.R, config = {minh = 2, minw = 2.7, colour = G.C.RED}, nodes = {
                                        {n = G.UIT.R, config = {}, nodes = {
                                            {n = G.UIT.T, config = {text = 'Jolly', colour = G.C.UI.TEXT_LIGHT, scale = 1}}
                                        }},
                                        {n = G.UIT.R, config = {}, nodes = {
                                            {n = G.UIT.T, config = {text = 'Jokers', colour = G.C.UI.TEXT_LIGHT, scale = 1}}
                                        }}
                                    }}
                                }}
                            }
                        }
                    }
                }
            },
        })
    })
end

--[[ function create_UIBox_JollyJokers_Page()
    local tab = create_UIBox_generic_options({
      back_func = 'cosmos_page_exit',
      contents = {
        {
          n = G.UIT.R,
          config = { colour = TexturesIn, r = 0.3, align = 'cm', minw = 11, outline = 5, outline_colour = G.C.BLACK },
          nodes = { create_Balustro_misc_options() }
        }
      },
    })
    return tab
  end ]]


function G.FUNCS.cosmos_page_exit()
    G.SETTINGS.paused = true
    SMODS.save_mod_config(cosmos)
    SMODS.LAST_SELECTED_MOD_TAB = "config"
    G.FUNCS.overlay_menu({
        definition = create_UIBox_mods(cosmos)
    })
end

G.FUNCS.cosmos_save_and_apply = function(e)
    G.ACTIVE_MOD_UI = nil
    SMODS.save_all_config()
    SMODS.restart_game()
    SMODS.IN_MODS_TAB = nil
end
