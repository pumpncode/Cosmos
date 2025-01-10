SMODS.Joker {
    key = "santajoker",
    loc_txt = {
        name = "Santa",
        text = {
            "{C:green}#1# in #2#{} chance to",
            "create a {C:red}Coupon Tag",
            "at {C:attention}end of round"
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = { odds = 3 } },
    rarity = 2,
    atlas = "HolidayPackAtlas",
    pos = { x = 0, y = 0 },
    cost = 6,
    in_pool = function(self, args)
        local check = G.cosmos.enabled.HolidayPack or false
        return check
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS.tag_coupon
        return{vars = {G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and (pseudorandom('santa')<= G.GAME.probabilities.normal/card.ability.extra.odds ) then
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
