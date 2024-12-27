--[[ Need to figure out events better, it currently has an
issue where it immediately removes and adds new editions
on all cards at the same time, instead of going one by
one. Perfectly functional, just looks weird at the moment.]]

SMODS.Joker {
    key = "spinagogue",
    loc_txt = {
        name = "Spinagogue Champion",
        text = {
            "{C:green}#1# in #2#{} chance to add {C:dark_edition}Foil{},",
            "{C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{}",
            "to each card {C:attention}scored{} in",
            "the {C:attention}first hand{} of round",
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { add_odds = 4 } },
    rarity = 3,
    atlas = "JJPack",
    pos = { x = 6, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.add_odds}
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and context.full_hand and G.GAME.current_round.hands_played == 0 then
            for i, v in ipairs(context.scoring_hand) do
                if not v.edition then
                    if pseudorandom('jj_spinagogue_add') < G.GAME.probabilities.normal / card.ability.extra.add_odds then
                        local edition = poll_edition('jj_spinagogue_edition', nil, true, true, { "e_foil", "e_holo", "e_polychrome" })
                        -- G.E_MANAGER:add_event(Event({
                        --     trigger = 'immediate',
                        --     delay = 0.0,
                        --     blockable = true,
                        --     blocking = true,
                        --     func = function()
                        v.cosmos_hide_edition = true
                        v:set_edition(edition, true, true)
                        --        return true
                        --     end
                        --   }))
                        G.E_MANAGER:add_event(Event({
                            trigger = 'immediate',
                            delay = 0.0,
                            blockable = true,
                            blocking = true,
                            func = function()
                                v.cosmos_hide_edition = nil
                                return true
                            end
                        }))
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.0,
                            blockable = true,
                            func = function()
                                card:juice_up(1, 0.5)
                                v:juice_up(1, 0.5)
                                if v.edition.foil then play_sound('foil1', 1.2, 0.4) end
                                if v.edition.holo then play_sound('holo1', 1.2*1.58, 0.4) end
                                if v.edition.polychrome then play_sound('polychrome1', 1.2, 0.7) end
                                return true
                            end
                          }))
                        if edition == 'e_polychrome' then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = 'GIMEL!',
                                colour = G.C.GREEN
                            })
                        elseif edition == 'e_holo' then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = "HEY!",
                                colour = G.C.RED
                            })
                        else
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = "SHIN!",
                                colour = G.C.BLUE
                            })
                        end
                    else
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.0,
                            blockable = true,
                            func = function()
                                card:juice_up(1, 0.5)
                                v:juice_up(1, 0.5)
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.06*G.SETTINGS.GAMESPEED,
                                    blockable = false,
                                    blocking = false,
                                    func = function()
                                        play_sound('tarot2', 0.76, 0.4)
                                        return true
                                    end
                                }))
                                play_sound('tarot2', 1, 0.4)
                                return true
                            end
                          }))
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = 'NUN!',
                            colour = G.C.PURPLE
                        })
                    end
                end
            end
        end
    end
}