SMODS.Joker {
    key = "santajoker",
    loc_txt = {
        name = "Santa",
        text = {
            "Creates {C:tarot}1 Tarot{} and {C:planet}1 Planet",
            "card at {C:attention}end of round{}, taking {C:money}$5"
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = { payment = -5 } },
    rarity = 3,
    atlas = "JollyJokers",
    pos = { x = 0, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.payment }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.consumeables:emplace(SMODS.create_card({ set = 'Tarot', soulable = true }))
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.consumeables:emplace(SMODS.create_card({ set = 'Planet', soulable = true }))
                end
                ease_dollars(card.ability.extra.payment)
                return {
                    message = 'Ho ho ho!',
                    colour = G.C.MULT
                }
            end
        end
    end
}
