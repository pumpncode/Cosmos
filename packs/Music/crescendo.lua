SMODS.Joker {
    key = "crescendo",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "MusicAtlas",
    pos = { x = 2, y = 0 },
    cost = 5,
    config = { extra = { mult = 0, mult_mod = 3} },
    in_pool = function(self, args)
        local check = G.cosmos.enabled.Music or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult_mod, card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
    end
}