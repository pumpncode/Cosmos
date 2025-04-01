SMODS.Joker {
    key = "hrockhmetal",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "MusicAtlas",
    pos = { x = 4, y = 0 },
    cost = 5,
    config = { extra = { chips = 75, x_mult = 1.75 } },
    in_pool = function(self, args)
        local check = G.cosmos.enabled.Music or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return {
            vars = { card.ability.extra.chips, card.ability.extra.x_mult }
        }
    end,
    calculate = function(self, card, context)
    end
}