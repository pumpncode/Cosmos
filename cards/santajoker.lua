SMODS.Joker {
    key = "santajoker",
    loc_txt = {
        name = "Santa",
        text = {
            "When {C:attention}Boss Blind{} is defeated,",
            "create a {C:red}Coupon Tag"
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = { odds = 4 } },
    rarity = 3,
    atlas = "JJPack",
    pos = { x = 0, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS.tag_coupon
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and G.GAME.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_coupon'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return {
                message = "Ho ho ho!",
                colour = G.C.MULT
            }
        end
    end
}
