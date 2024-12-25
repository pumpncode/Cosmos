SMODS.Joker {
    key = 'milkandcookies',
    loc_txt = {
        name = 'Milk & Cookies',
        text = {
            "Sell to gain a {C:green}Tag{]} for",
            "every {C:attention}Boss Blind{} beaten,",
            "starting when picked up",
            "{C:inactive}(Currently #1#)"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    blueprint_compat = false,
    config = { extra = { tags = 0 } },
    rarity = 2,
    atlas = 'JJPack',
    pos = { x = 2, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tags } }
    end,
    calculate = function(self, card, context)
        if not context.blueprint then
            if context.end_of_round and not context.individual and not context.repetition and G.GAME.blind.boss then
                card.ability.extra.tags = card.ability.extra.tags + 1
                return {
                    message = "+1 Tag!",
                    colour = G.C.GREEN
                }
            end
            if context.selling_self == true then
                local tag_pool = get_current_pool('Tag')
                local give_tags = {}
                for i = 1, card.ability.extra.tags do
                    local tag = pseudorandom_element(tag_pool, pseudoseed('mnk'))
                    while tag == 'UNAVAILABLE' do
                        tag = pseudorandom_element(tag_pool, pseudoseed('mnk'))
                    end
                    give_tags[i] = tag
                end
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        for _, tag in pairs(give_tags) do
                            add_tag(Tag(tag, false, 'Big'))
                        end
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end)
                }))
            end
        end
    end
}
