SMODS.Joker {
    key = "snowman",
    loc_txt = {
        name = "Snowman",
        text = {
            "This string should get replaced by loc_vars"
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = {
        chips = 0,
        chip_gain = 5,
        chip_lose = 10,
        melt_state = false,
        chip_threshold = 150
    } },
    rarity = 1,
    atlas = "JJPack",
    pos = { x = 9, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local key = "cosmos_j_snowman_gain"
        if card.ability.extra.melt_state then
            key = 'cosmos_j_snowman_melt'
        end
        return {
            key = key,
            vars = { card.ability.extra.chips, card.ability.extra.chip_gain, card.ability.extra.chip_lose, card.ability.extra.chip_threshold }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.chips <= 0 and card.ability.extra.melt_state and not context.blueprint then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = "Melted away...",
                    colour = G.C.CHIPS
                }
            elseif card.ability.extra.chips > 0 then
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                    chip_mod = card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card then
            if card.ability.extra.chips >= card.ability.extra.chip_threshold then
                card.ability.extra.melt_state = true
            end
            if card.ability.extra.melt_state then
                if card.ability.extra.chips >= card.ability.extra.chip_threshold then
                    card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_lose
                    return {
                        extra = {
                            message = 'Melting...',
                            colour = G.C.CHIPS,
                            focus = card
                        },
                        card = card
                    }
                end
                card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_lose
                return {
                    extra = {
                        message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chip_lose } },
                        colour = G.C.CHIPS,
                        focus = card
                    },
                    card = card
                }
            else
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                return {
                    extra = {
                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_gain } },
                        colour = G.C.CHIPS,
                        focus = card,
                    },
                    card = card
                }
            end
        end
    end
}
