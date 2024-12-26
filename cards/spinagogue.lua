--[[ Need to figure out events better, it currently has an
issue where it immediately removes and adds new editions
on all cards at the same time, instead of going one by
one. Perfectly functional, just looks weird at the moment.]]

SMODS.Joker {
    key = "spinagogue",
    loc_txt = {
        name = "Spinagogue Champion",
        text = {
            -- "{C:green}#1# in #2#{} chance to remove",
            -- "{C:dark_edition}Editions{} from {C:attention}scored cards",
            -- "{s:0.33} ",
            "When {C:attention}scoring{} a card",
            "in the {C:attention}first hand{} of round,",
            "{C:green}#1# in #2#{} chance to add {C:dark_edition}Foil{},",
            "{C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{} to it",
            -- "to {C:attention}scored cards",
            -- "{C:green}#3# in #4#{} chance for base {C:attention}scored cards",
            -- "to become {C:dark_edition}Foil, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome",
        },
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = { add_odds = 4 } },
    rarity = 1,
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
                        v:set_edition(edition, true, true)
                        --        return true
                        --     end
                        --   }))
                        if edition == 'e_polychrome' then
                            card_eval_status_text(v, 'extra', nil, nil, nil, {
                                message = 'GIMEL!',
                                colour = G.C.GREEN
                            })
                        elseif edition == 'e_holo' then
                            card_eval_status_text(v, 'extra', nil, nil, nil, {
                                message = "HEY!",
                                colour = G.C.RED
                            })
                        else
                            card_eval_status_text(v, 'extra', nil, nil, nil, {
                                message = "SHIN!",
                                colour = G.C.BLUE
                            })
                        end
                    else
                        card_eval_status_text(v, 'extra', nil, nil, nil, {
                            message = 'NUN!',
                            colour = G.C.PURPLE
                        })
                    end
                end
            end
        end
    end
}