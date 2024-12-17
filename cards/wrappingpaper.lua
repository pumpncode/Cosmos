SMODS.Joker {
    key = "wrappingpaper",
    loc_txt = {
        name = "Wrapping Paper",
        text = {},
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { },
    rarity = 1,
    atlas = "Orchid",
    pos = { x = 4, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { }
        }
    end,
    calculate = function(self, card, context)
       
    end
}
