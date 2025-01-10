SMODS.Atlas {
    key = "cosmos_boosters",
    path = "cosmos_boosters.png",
    px = 71,
    py = 95
}

SMODS.Booster{
    key = 'holiday_booster',
    weight = 0,
    cost = 6,
    config = {choose = 1, extra = 4},
    atlas = "cosmos_boosters",
    pos = {x = 0, y = 0},
    discovered = true,
    group_key = 'k_cosmos_pack',
    kind = 'cosmos_pack',
    loc_vars = function(self, info_queue, card)
        return {vars = {(card and card.ability.choose or self.config.choose), (card and card.ability.extra or self.config.extra)}}
    end,
    create_card = function(self, card, i)
        return create_card("Joker",G.pack_cards, nil, nil, true, true, pseudorandom_element(cosmos_pool(), pseudoseed('holidaypack')),nil)
    end

--    G.cosmos.packs.HolidayPack.cards

}




function cosmos_pool(_type)
    --create the pool
    G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
    local _pool, _starting_pool, _pool_key, _pool_size = G.ARGS.TEMP_POOL, nil, '', 0

     _starting_pool, _pool_key = G.P_CENTER_POOLS['Joker'], 'cosmos_pool'
    

    --cull the pool
    for k, v in ipairs(_starting_pool) do
        local add = nil

        for k2, v2 in ipairs(G.cosmos.packs.HolidayPack.cards) do
            if v.key == v2 then
                add = true
            end
        end
        -- Remove cards that are already present
        if add and G.GAME.used_jokers[v.key] and not(next(SMODS.find_card('j_showman'))) then
            add = nil
        end

        if add and not G.GAME.banned_keys[v.key] then 
            _pool[#_pool + 1] = v.key
            _pool_size = _pool_size + 1
        end
    end

    --if pool is empty
    if _pool_size == 0 then
        _pool = EMPTY(G.ARGS.TEMP_POOL)
        _pool[#_pool + 1] = "j_joker"
    end

    return _pool, _pool_key..G.GAME.round_resets.ante
end
