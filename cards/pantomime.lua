SMODS.Joker {
    key = 'pantomime',
    loc_txt = {
        name = 'Pantomime',
        text = {
            "Retrigger each rank you",
            "both {C:attention}play{} and {C:attention}hold in hand"
        }
    },
    unlocked = true,
    discovered = true,
    config = { extra = { retrigger = 1 } },
    rarity = 3,
    atlas = 'JJPack',
    pos = { x = 3, y = 0 },
    cost = 8,
    calculate = function(self, card, context)
        if context.other_card and context.repetition then
            local playranks = {}
            local handranks = {}
            local cardrank = context.other_card:get_id()

            for i, v in ipairs(G.hand.cards) do
                table.insert(handranks, G.hand.cards[i]:get_id())
            end
            for i, v in ipairs(G.play.cards) do
                table.insert(playranks, G.play.cards[i]:get_id())
            end
            local match = false
            for i, v in ipairs(handranks) do
                if cardrank == handranks[i] and context.cardarea == G.play then
                    match = true
                end
            end
            for i, v in ipairs(playranks) do
                if cardrank == playranks[i] and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
                    match = true
                end
            end
            if match then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = context.other_card,
                    }
                else
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.retrigger,
                        card = context.other_card
                    }
                end
            end
        end
    end
}
