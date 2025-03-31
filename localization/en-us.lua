return {
    descriptions = {
        Joker = {
            -- Holidays Pack
            j_cosmos_coalstocking = {
                name = "Coal Stocking",
                text = {
                    "This Joker gains {C:mult}+#2#{} Mult",
                    "when scoring a {C:attention}Stone{} Card",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                }
            },
            j_cosmos_krampusjoker = {
                name = "Krampus",
                text = {
                    "When {C:attention}purchasing{} from the Shop,",
                    "this Joker gains {X:mult,C:white}X#2#{} Mult",
                    "{s:0.33} ",
                    "{C:red,E:2}Items cost {C:money}$#1#{C:red,E:2} more",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
                }
            },
            j_cosmos_magi = {
                name = "Magi",
                text = {
                    "Creates a {C:tarot}Charm Tag{} if",
                    "winning hand of round",
                    "is {C:attention}Three of a Kind"
                }
            },
            j_cosmos_milkandcookies = {
                name = 'Milk & Cookies',
                text = {
                    "Sell this card to",
                    "create {C:attention}#1# {C:green}Tags{}",
                    "{s:0.33} ",
                    "When {C:attention}Boss Blind{} is defeated,",
                    "increase by {C:attention}+#2#{} {C:green}Tags",
                }
            },
            j_cosmos_pantomime = {
                name = 'Pantomime',
                text = {
                    "Retrigger {C:attention}played cards{} and",
                    "cards {C:attention}held in hand{} that",
                    "share the same rank"
                }
            },
            j_cosmos_santajoker = {
                name = "Santa",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "create a {C:red}Coupon Tag",
                    "at {C:attention}end of round"
                },
            },
            j_cosmos_snowman_gain = {
                name = 'Snowman',
                text = {
                    "Gains {C:chips}+#2#{} Chips per card scored",
                    "After Joker reaches {C:chips}#4#{} Chips,",
                    "{C:chips}-#3#{} Chips per card scored",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)"
                }
            },
            j_cosmos_snowman_melt = {
                name = 'Snowman',
                text = {
--                    "{C:inactive,s:0.7}The days are getting warmer...",
                    "{C:chips}-#3#{} Chips per card scored",
                    "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)"
                }
            },
            j_cosmos_snowstorm = {
                name = "Snowstorm",
                text = {
                    "Each {C:attention}Enhanced{} card",
                    "{C:attention}held in hand",
                    "gives {C:chips}+#1#{} Chips"
                },
            },
            j_cosmos_spinagogue = {
                name = "Spinagogue Champion",
                text = {
                    "{C:green}#1# in #2#{} chance to add {C:dark_edition}Foil{},",
                    "{C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{}",
                    "to each card {C:attention}scored{} in",
                    "the {C:attention}first hand{} of round",
                },
            },
            j_cosmos_wrappingpaper = {
                name = 'Wrapping Paper',
                text = {
                    "At the {C:attention}end of round{},",
                    "add this Joker's {C:attention}sell value",
                    "to the one to the right",
                    "{C:inactive}(Max of {C:money}$#1#{C:inactive})"
                }
            }
        },
        Other = {
            p_cosmos_Holiday_booster = {
                name = 'Holiday Booster Pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:purple} Holiday Pack{} cards to",
                    "be used immediately"
                }
            },
            p_cosmos_Music_booster = {
                name = 'Music Booster Pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:purple} Music Pack{} cards to",
                    "be used immediately"
                }
            }
        }
    },
    misc = {
        dictionary = {
            k_cosmos_pack = "Cosmos Pack"
        }
    }
}
