SMODS.Joker {
    key = "krampusjoker",
    loc_txt = {
        name = "Krampus",
        text = {
            "Cards cost {C:money}$#1#{} more",
            "When making a {C:attention}purchase{} in",
            "the shop, this gains {X:mult,C:white}X#2#{} Mult",
            "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = { x_mult = 1, mult_gain = 0.1, inflation = 1 } },
    rarity = 1,
    atlas = "JJPack",
    pos = { x = 1, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.inflation, card.ability.extra.mult_gain, card.ability.extra.x_mult }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.inflation = G.GAME.inflation + card.ability.extra.inflation
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.inflation = G.GAME.inflation - card.ability.extra.inflation
    end,
    calculate = function(self, card, context)
        if context.buying_card or context.open_booster then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.mult_gain
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            })
        end
        if context.joker_main then
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end
}
