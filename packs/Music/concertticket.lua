SMODS.Joker {
    key = "concertticket",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "MusicAtlas",
    pos = { x = 1, y = 0 },
    cost = 5,
    config = { extra = 5 },
    in_pool = function(self, args)
        local check = G.cosmos.enabled.Music or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra }
        }
    end,
    calculate = function(self, card, context)
    end
}