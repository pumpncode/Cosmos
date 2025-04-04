SMODS.Joker {
    key = "pianoroll",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "MusicAtlas",
    pos = { x = 1, y = 1 },
    cost = 5,
    config = { extra = { x_mult = 1, x_mult_mod = 0.5} },
    in_pool = function(self, args)
        local check = G.cosmos.enabled.Music or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.x_mult_mod, localize(G.GAME.current_round.mail_card.rank, 'ranks'), card.ability.extra.x_mult }
        }
    end,
    calculate = function(self, card, context)
    end
}