SMODS.Joker {
    key = "jpop",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "MusicAtlas",
    pos = { x = 0, y = 1 },
    cost = 5,
    config = {},
    in_pool = function(self, args)
        local check = G.cosmos.enabled.Music or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { localize(G.GAME.current_round.mail_card.rank, 'ranks') }
        }
    end,
    calculate = function(self, card, context)
    end
}