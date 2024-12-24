SMODS.Joker {
    key = "magi",
    loc_txt = {
        name = "Magi",
        text = {
            "Create a {C:tarot}Charm Tag{} if final",
            "scored hand is {C:attention}Three of a Kind"
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = { hand = false } },
    rarity = 1,
    atlas = "JJPack",
    pos = { x = 8, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS.tag_charm
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if context.scoring_name == 'Three of a Kind' then
                card.ability.extra.hand = true
            else
                card.ability.extra.hand = false
            end
        end
        if context.end_of_round and not context.individual and not context.repetition and card.ability.extra.hand then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_charm'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return {
                message = localize('k_active_ex'),
                colour = G.C.PURPLE
            }
        end
    end
}
