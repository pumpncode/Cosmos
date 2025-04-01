SMODS.Joker {
    key = "ukulele",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "MusicAtlas",
    pos = { x = 3, y = 1 },
    cost = 5,
    config = { extra = 4 },
    in_pool = function(self, args)
        local check = G.cosmos.enabled.Music or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal or 1, card.ability.extra }
        }
    end,
    calculate = function(self, card, context)
    end
}