Config.Logs = {
    WebHook = '', --Discord webhook

    ---@param playerSource number Server id of the player
    ---@param playerIdentifier string Player identifier (citizenid / identifier)
    ---@param itemsGiven { [tableIndex: number]: { item: string, amount: number, label: string } } Table of items given
    ---Rewards given to player on successful mine (stonewash disabled) or successful stone wash
    rewardsGiven = function(playerSource, playerIdentifier, itemsGiven)
        local rewards
        local next = next
        if itemsGiven and next(itemsGiven) ~= nil then
            for key, value in pairs(itemsGiven) do 
                if not rewards then 
                    rewards = '['..value.amount..'] '..value.label 
                else
                    rewards = rewards..', ['..value.amount..'] '..value.label
                end
            end
        end

        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Received mining awards: '..rewards
        utils:discordLog(Config.Logs.WebHook, 'Mining - Rewards', 5763719, logString)
    end,

    ---@param playerSource number Server id of the player
    ---@param playerIdentifier string Player identifier (citizenid / identifier)
    ---@param stoneAmount number Amount of stones given
    ---Stone amount given to player on successful mine with stonewash enabled
    stonesGiven = function(playerSource, playerIdentifier, stoneAmount)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Received ['..stoneAmount..'] '..Config.StoneWashing.StoneItemLabel
        utils:discordLog(Config.Logs.WebHook, 'Mining - Stones', 15105570, logString)
    end,

    ---@param playerSource number Server id of the player
    ---@param playerIdentifier string Player identifier (citizenid / identifier)
    ---@param gems { [itemname: string]: { name: string, amount: number, label: string } } Table of gem items sold
    ---@param saleAmount number Total money awarded for sale
    ---Gems successfully sold to pawn shop
    gemsSold = function(playerSource, playerIdentifier, gems, saleAmount)
        local rewards
        local next = next
        if gems and next(gems) ~= nil then
            for key, value in pairs(gems) do 
                if not rewards then 
                    rewards = '['..value.amount..'] '..value.label 
                else
                    rewards = rewards..', ['..value.amount..'] '..value.label
                end
            end
        end

        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Received $'..utils:formatThousand(saleAmount)..' for the sale of '..rewards
        utils:discordLog(Config.Logs.WebHook, 'Mining - Gem Sale', 5763719, logString)
    end,

    ---@param playerSource number Server id of the player
    ---@param playerIdentifier string Player identifier (citizenid / identifier)
    ---@param items { [itemname: string]: { name: string, amount: number, label: string } } Table of items sold
    ---@param saleAmount number Total money awarded for sale
    ---Items successfully sold to pawn shop
    itemsSold = function(playerSource, playerIdentifier, items, saleAmount)
        local rewards
        local next = next
        if items and next(items) ~= nil then
            for key, value in pairs(items) do 
                if not rewards then 
                    rewards = '['..value.amount..'] '..value.label 
                else
                    rewards = rewards..', ['..value.amount..'] '..value.label
                end
            end
        end

        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Received $'..utils:formatThousand(saleAmount)..' for the sale of '..rewards
        utils:discordLog(Config.Logs.WebHook, 'Mining - Pawn Shop Sale', 5763719, logString)
    end,

    ---@param playerSource number Server id of the player
    ---@param playerIdentifier string Player identifier (citizenid / identifier)
    ---@param item string Item name
    ---@param amount number Amount smelted
    ---Items successfully smelted
    smeltedItems = function(playerSource, playerIdentifier, item, amount)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Smelted ['..amount..'] '..item
        utils:discordLog(Config.Logs.WebHook, 'Mining - Smelter', 15844367, logString)
    end,

    ---@param playerSource number Server id of the player
    ---@param playerIdentifier string Player identifier (citizenid / identifier)
    ---@param item string Item name
    ---@param amount number Amount cut
    ---Gem items successfully cut
    gemsCut = function(playerSource, playerIdentifier, item, amount)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Cut ['..amount..'] '..item
        utils:discordLog(Config.Logs.WebHook, 'Mining - Gem Cutting', 15105570, logString)
    end,

    ---@param playerSource number Server id of the player
    ---@param playerIdentifier string Player identifier (citizenid / identifier)
    ---@param item string Item name
    ---@param amount number Amount crafted
    ---Items successfully crafted
    craftedItems = function(playerSource, playerIdentifier, item, amount)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Crafted ['..amount..'] '..item
        utils:discordLog(Config.Logs.WebHook, 'Mining - Crafting', 15548997, logString)
    end
}