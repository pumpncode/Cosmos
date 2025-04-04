SMODS.Joker {
    key = "bellpepper",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "MusicAtlas",
    pos = { x = 0, y = 0 },
    cost = 5,
    config = { extra = { chips = 50, chip_mod = 1 } },
    in_pool = function(self, args)
        local check = G.cosmos.enabled.Music or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { localize(G.GAME.current_round.ancient_card.suit, 'suits_singular'), card.ability.extra.chips, card.ability.extra.chip_mod, colours = {G.C.SUITS[G.GAME.current_round.ancient_card.suit]} }
        }
    end,
    calculate = function(self, card, context)
    end
}