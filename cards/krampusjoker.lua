SMODS.Joker {
    key = "krampusjoker",
    loc_txt = {
        name = "Krampus",
        text = {
            "Gain {C:money}$#1#{} at {C:attention}end of round",
            "if you have at least",
            "{C:tarot}1 Tarot{} and {C:planet}1 Planet"
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = { moneygain = 10 } },
    rarity = 1,
    atlas = "JJPack",
    pos = { x = 1, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.moneygain }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            local tarot = false
            local planet = false
            for i, v in ipairs(G.consumeables.cards) do
                if v.ability.set == 'Tarot' then
                    tarot = true
                elseif v.ability.set == 'Planet' then
                    planet = true
                end
            end
            if tarot and planet then
                ease_dollars(card.ability.extra.moneygain)
                return {
                    message = "+$" .. card.ability.extra.moneygain,
                    colour = G.C.MONEY
                }
            end
        end
    end
}
