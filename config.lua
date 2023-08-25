Config = {
    ------------------------------------------------------PROGRESS BAR------------------------------------------------------------
    ProgressCircle = false, --true = circle progress bar from ox_lib / false = rectangle progress bar from ox_lib
    ProgressCirclePosition = 'middle', --position of the progress circle. can be either 'middle' or 'bottom'
    ------------------------------------------------------------------------------------------------------------------------------

    ------------------------------------------------------NOTIFICATIONS-----------------------------------------------------------
    Notify = { 
        UseCustom = false, --FALSE = DEFAULT NOTIFY WILL BE YOUR FRAMEWORKS NOTIFY SYSTEM (QBCore:Notify / esx:showNotification) / TRUE = CUSTOM NOTIFY SCRIPT (OX_LIB / T-NOTIFY / ECT)
        CustomClientNotifyFunction = function(Data) --**CLIENT SIDE CODE**
            ---@param Data table: { Message string, Type string, Duration number }

            --TriggerEvent('QBCore:Notify', Data.Message, Data.Type, Data.Duration) --QBCORE EXAMPLE
        end,
        CustomServerNotifyFunction = function(PlayerSource, Data) --**SERVER SIDE CODE** SAME AS ABOVE EXCEPT PASSES THE SOURCE TO SEND THE NOTIFICATION TO FROM THE SERVER
            ---@param PlayerSource number Server id of the player
            ---@param Data table: { Message string, Type string, Duration number }

            --TriggerClientEvent('QBCore:Notify', PlayerSource, Data.Message, Data.Type, Data.Duration) --QBCORE EXAMPLE
        end,
    },
    ------------------------------------------------------------------------------------------------------------------------------

    ------------------------------------------------------BLIP--------------------------------------------------------------------
    Blips = {
        {
            Coords = {x = 2953.97, y = 2784.22}, 
            Name = "Quarry", 
            Sprite = 527, 
            Color = 5,
            ShortRange = true, --true = only see blip while close / false = see blip at all times (minimap)
        },
        {
            Coords = {x = -595.58, y = 2086.83},
            Name = "Mineshaft", 
            Sprite = 527, 
            Color = 5,
            ShortRange = true, --true = only see blip while close / false = see blip at all times (minimap)
        },
    },
    ------------------------------------------------------------------------------------------------------------------------------

    ------------------------------------------------------MINING CONFIG-----------------------------------------------------------
    NodeTypes = { --Spawnable mining node props
        --set Inside = true if you want this object to spawn inside (example inside of a cave or mineshaft)
        --works best for smaller objects to spawn inside
        {Model = 1887007857, Inside = false}, --`prop_rock_3_a`,
        {Model = 4218128975, Inside = false}, --`prop_rock_3_j`, 
        {Model = 232075042, Inside = false}, --`prop_rock_3_i`,  
        {Model = 4030919682, Inside = false}, --`prop_rock_3_h`, 
        {Model = 351714669, Inside = true}, --`prop_rock_3_f`,
        {Model = 1308766083, Inside = true}, --`prop_rock_3_b`,
        {Model = 52435392, Inside = true}, --`prop_rock_3_e`,
        {Model = 694838868, Inside = true} --`prop_rock_3_d`,
    },

    NodeMinQuality = 15, --Min "health" a node is spawned with
    NodeMaxQuality = 100, --Max "health" a node is spawned with

    NodeQualityReductionMin = 10, --Min "health" to remove from a node each time it is mined
    NodeQualityReductionMax = 20, --Max "health" to remove from a node each time it is mined

    CooldownMin = 60, --Minimum minutes a node is on cooldown before respawning
    CooldownMax = 90, --Maximum minutes a node is on cooldown before respawning

    Rewards = { --Items rewarded from stone washing (or mining if stone washing is disabled)
        ---@param item string Item name used with inventory
        ---@param label string Item Label used for menu and notification display
        ---@param minRoll number Minimum number for random roll chance
        ---@param maxRoll number Maximum number for random roll chance
        ---@param rewardChance number Reward item if rewardChance <= math.random(minRoll, maxRoll)
        ---@param minAmount number Minimum reward amount (not calculated for gems)
        ---@param maxAmount number Maximum reward amount (not calculated for gems)
        ---@param minQuality number Minimum gemQuality metadata (only use for gems)
        ---@param maxQuality number Maximum gemQuality metadata (only use for gems)
        ---@param uncutItem string Item name used with inventory for uncut version of gem (if gem cutting is enabled)
        ---@param uncutItemLabel string Item Label used ofr menu and notification display for uncut version of gem (if gem cutting is enabled)

        {
            item = 'ironore', 
            label = 'Iron Ore', 
            minRoll = 1, 
            maxRoll = 100, 
            rewardChance = 100, 
            minAmount = 5, 
            maxAmount = 10
        },
        {
            item = 'copperore', 
            label = 'Copper Ore', 
            minRoll = 1, 
            maxRoll = 100, 
            rewardChance = 100, 
            minAmount = 5, 
            maxAmount = 10
        },
        {
            item = 'goldore', 
            label = 'Gold Ore', 
            minRoll = 1, 
            maxRoll = 100, 
            rewardChance = 15, 
            minAmount = 1, 
            maxAmount = 5
        },
        {
            item = 'silverore', 
            label = 'Silver Ore', 
            minRoll = 1, 
            maxRoll = 100, 
            rewardChance = 15, 
            minAmount = 1, 
            maxAmount = 5
        },
        {
            item = 'diamond', 
            label = 'Diamond', 
            minRoll = 1, 
            maxRoll = 100, 
            rewardChance = 2,
            minQuality = 5, 
            maxQuality = 100,
            uncutItem = 'uncut_diamond',
            uncutItemLabel = 'Uncut Diamond'
        },
        {
            item = 'emerald', 
            label = 'Emerald', 
            minRoll = 1, 
            maxRoll = 100, 
            rewardChance = 2,
            minQuality = 5, 
            maxQuality = 100,
            uncutItem = 'uncut_emerald',
            uncutItemLabel = 'Uncut Emerald'
        },
        {
            item = 'sapphire', 
            label = 'Sapphire', 
            minRoll = 1, 
            maxRoll = 100, 
            rewardChance = 2,
            minQuality = 5, 
            maxQuality = 100,
            uncutItem = 'uncut_sapphire',
            uncutItemLabel = 'Uncut Sapphire'
        },
        {
            item = 'ruby', 
            label = 'Ruby', 
            minRoll = 1, 
            maxRoll = 1000, 
            rewardChance = 2,
            minQuality = 100, 
            maxQuality = 100,
            uncutItem = 'uncut_ruby',
            uncutItemLabel = 'Uncut Ruby'
        },
    },

    StoneWashing = {
        Enabled = true, --if enabled mining nodes will only produce the 'StoneItem' which will be required to be washed to obtain Rewards. If disabled mining nodes will produce items inside the Rewards table instead
        StoneItem = 'stone',
        StoneItemLabel = 'Stone',
        WashTimeMin = 8, --Min progress timer seconds to wash a stone
        WashTimeMax = 11, --Max progress timer seconds to wash a stone
        WashAreas = {
            {
                Blip = {
                    Coords = {x = 1916.02, y = 272.66},
                    Name = "Stone Washing", 
                    Sprite = 467, 
                    Color = 5,
                    ShortRange = true,
                },
                PolyZone = {
                    Coords = { --Generate coords using PolyZone script /pzcreate poly
                        vector2(1913.1564941406, 274.35092163086),
                        vector2(1915.7126464844, 276.74142456055),
                        vector2(1915.5225830078, 285.93060302734),
                        vector2(1921.2001953125, 292.74890136719),
                        vector2(1924.4348144531, 297.17456054688),
                        vector2(1932.4332275391, 296.29217529297),
                        vector2(1925.1940917969, 272.35278320312),
                        vector2(1919.5678710938, 258.75881958008),
                        vector2(1907.7584228516, 259.38516235352),
                        vector2(1909.9947509766, 267.11120605469),
                        vector2(1910.9241943359, 269.34817504883),
                        vector2(1913.3861083984, 272.96292114258)
                    },
                    MinZ = 150,
                    MaxZ = 165,
                }
            },
        },
    },

    RequirePickaxe = true, --true requires the PickaxeItem / false no item required
    PickaxeItem = 'pickaxe',
    PickaxeBreakChance = 10, --chance to break out of a random 1-100 roll. set to 0 if you do not want the item to ever break
    PickaxeShops = {
        Enabled = true,
        {
            Blip = {
                Coords = {x = 2966.57, y = 2755.72},
                Name = "Mining Shop",
                Sprite = 402,
                Color = 5,
                ShortRange = true
            },
            Ped = {
                Coords = vector4(2966.57, 2755.72, 43.27, 202.1),
                Model = 3621428889,
            },
            Items = {
                {
                    name = 'pickaxe',
                    label = 'Pickaxe',
                    price = 25
                },
            }
        },
        {
            Blip = {
                Coords = {x = -594.17, y = 2091.85},
                Name = "Mining Shop",
                Sprite = 402,
                Color = 5,
                ShortRange = true
            },
            Ped = {
                Coords = vector4(-594.17, 2091.85, 131.62, 80.16),
                Model = 3621428889,
            },
            Items = {
                {
                    name = 'pickaxe',
                    label = 'Pickaxe',
                    price = 25
                },
            }
        }
    },

    PawnshopPeds = {
        Enabled = true, --true spawns pawn shop peds to sell items and gems to / false to disable
        SellTimeMin = 10, --Min progress timer seconds to sell pawn items
        SellTimeMax = 15, --Max progress timer seconds to sell pawn items
        {
            Ped = {
                Coords = vector4(-1459.52, -413.92, 35.74, 161.84),
                Model = 3835149295,
            },
            Blip = {
                Enabled = true, --true to enable blip / false to hide
                Coords = {x = -1459.52, y = -413.92},
                Name = "Pawn Shop",
                Sprite = 605,
                Color = 5,
                ShortRange = true
            },
            Gems = {
                {
                    name = 'diamond',
                    label = 'Diamond',
                    priceMin = 250,
                    priceMax = 300,
                },
                {
                    name = 'emerald',
                    label = 'Emerald',
                    priceMin = 250,
                    priceMax = 300,
                },
                {
                    name = 'sapphire',
                    label = 'Sapphire',
                    priceMin = 250,
                    priceMax = 300,
                },
                {
                    name = 'ruby',
                    label = 'Ruby',
                    priceMin = 1000,
                    priceMax = 1500,
                },
            },
            Items = {
                {
                    name = 'goldbar',
                    label = 'Gold Bar',
                    priceMin = 100,
                    priceMax = 150,
                },
                {
                    name = 'silverbar',
                    label = 'Silver Bar',
                    priceMin = 100,
                    priceMax = 150,
                },

                {
                    name = 'gold_ring',
                    label = 'Gold Ring',
                    priceMin = 125,
                    priceMax = 188,
                },
                {
                    name = 'gold_earring',
                    label = 'Gold Earring',
                    priceMin = 250,
                    priceMax = 375,
                },
                {
                    name = 'gold_chain',
                    label = 'Gold Chain',
                    priceMin = 375,
                    priceMax = 563,
                },
                {
                    name = 'silver_ring',
                    label = 'Silver Ring',
                    priceMin = 125,
                    priceMax = 188,
                },
                {
                    name = 'silver_earring',
                    label = 'Silver Earring',
                    priceMin = 250,
                    priceMax = 375,
                },
                {
                    name = 'silver_chain',
                    label = 'Silver Chain',
                    priceMin = 375,
                    priceMax = 563,
                },
                {
                    name = 'diamond_ring',
                    label = 'Diamond Ring',
                    priceMin = 750,
                    priceMax = 938,
                },
                {
                    name = 'diamond_ring_silver',
                    label = 'Silver Diamond Ring',
                    priceMin = 750,
                    priceMax = 938,
                },
                {
                    name = 'diamond_earring',
                    label = 'Diamond Earring',
                    priceMin = 1125,
                    priceMax = 1500,
                },
                {
                    name = 'diamond_earring_silver',
                    label = 'Silver Diamond Earring',
                    priceMin = 1125,
                    priceMax = 1500,
                },
                {
                    name = 'diamond_necklace',
                    label = 'Diamond Necklace',
                    priceMin = 1750,
                    priceMax = 2438,
                },
                {
                    name = 'diamond_necklace_silver',
                    label = 'Silver Diamond Necklace',
                    priceMin = 1750,
                    priceMax = 2438,
                },
                {
                    name = 'emerald_ring',
                    label = 'Emerald Ring',
                    priceMin = 750,
                    priceMax = 938,
                },
                {
                    name = 'emerald_ring_silver',
                    label = 'Silver Emerald Ring',
                    priceMin = 750,
                    priceMax = 938,
                },
                {
                    name = 'emerald_earring',
                    label = 'Emerald Earring',
                    priceMin = 1125,
                    priceMax = 1500,
                },
                {
                    name = 'emerald_earring_silver',
                    label = 'Silver Emerald Earring',
                    priceMin = 1125,
                    priceMax = 1500,
                },
                {
                    name = 'emerald_necklace',
                    label = 'Emerald Necklace',
                    priceMin = 1750,
                    priceMax = 2438,
                },
                {
                    name = 'emerald_necklace_silver',
                    label = 'Silver Emerald Necklace',
                    priceMin = 1750,
                    priceMax = 2438,
                },
                {
                    name = 'sapphire_ring',
                    label = 'Sapphire Ring',
                    priceMin = 750,
                    priceMax = 938,
                },
                {
                    name = 'sapphire_ring_silver',
                    label = 'Silver Sapphire Ring',
                    priceMin = 750,
                    priceMax = 938,
                },
                {
                    name = 'sapphire_earring',
                    label = 'Sapphire Earring',
                    priceMin = 1125,
                    priceMax = 1500,
                },
                {
                    name = 'sapphire_earring_silver',
                    label = 'Silver Sapphire Earring',
                    priceMin = 1125,
                    priceMax = 1500,
                },
                {
                    name = 'sapphire_necklace',
                    label = 'Sapphire Necklace',
                    priceMin = 1750,
                    priceMax = 2438,
                },
                {
                    name = 'sapphire_necklace_silver',
                    label = 'Silver Sapphire Necklace',
                    priceMin = 1750,
                    priceMax = 2438,
                },
                {
                    name = 'ruby_ring',
                    label = 'Ruby Ring',
                    priceMin = 1875,
                    priceMax = 2813,
                },
                {
                    name = 'ruby_ring_silver',
                    label = 'Silver Ruby Ring',
                    priceMin = 1875,
                    priceMax = 2813,
                },
                {
                    name = 'ruby_earring',
                    label = 'Ruby Earring',
                    priceMin = 3000,
                    priceMax = 4500,
                },
                {
                    name = 'ruby_earring_silver',
                    label = 'Silver Ruby Earring',
                    priceMin = 3000,
                    priceMax = 4500,
                },
                {
                    name = 'ruby_necklace',
                    label = 'Ruby Necklace',
                    priceMin = 5000,
                    priceMax = 6875,
                },
                {
                    name = 'ruby_necklace_silver',
                    label = 'Silver Ruby Necklace',
                    priceMin = 5000,
                    priceMax = 6875,
                }
            }
        },
    },

    Smelting = {
        Enabled = true, --true enables smelting ore / false to disable
        SmeltTimeMin = 25, --Min progress timer seconds to smelt items
        SmeltTimeMax = 35, --Max progress timer seconds to smelt items
        {
            Coords = vector4(1109.59, -2008.0, 31.05, 231.56),
            TextUI = { --ox_lib text ui for using the smelter
                Position = 'left-center', --left-center / right-center / top-center
                Icon = {
                    Icon = 'fa-solid fa-bolt', --FONT AWESOME ICON
                    Color = 'white', --ICON COLOR
                },
                Style = { --REACT.CSS PROPERTIES STYLING
                    borderRadius = 0,
                    backgroundColor = '#1A626B', --BACKGROUND
                    color = 'white' --TEXT COLOR
                }
            },
            Blip = {
                Coords = {x = 1109.59, y = -2008.0},
                Name = "Smelter",
                Sprite = 618,
                Color = 5,
                ShortRange = true
            },
            Items = {
                {
                    item = 'goldbar',
                    label = 'Gold Bar',
                    costs = {
                        {item = 'goldore', amount = 10, label = 'Gold Ore'},
                        {item = 'ironore', amount = 100, label = 'Iron Ore'},
                        {item = 'copperore', amount = 100, label = 'Copper Ore'},
                    }
                },
                {
                    item = 'silverbar',
                    label = 'Silver Bar',
                    costs = {
                        {item = 'silverore', amount = 10, label = 'Silver Ore'},
                        {item = 'ironore', amount = 100, label = 'Iron Ore'},
                        {item = 'copperore', amount = 100, label = 'Copper Ore'},
                    }
                },
            }
        },
    },

    GemCutting = {
        Enabled = true, --true enables gem cutting menu / false to disable
        CutTimeMin = 25, --Min progress timer seconds to cut gems
        CutTimeMax = 35, --Max progress timer seconds to cut gems
        {
            Coords = vector4(232.11, 365.09, 106.02, 166.53),
            TextUI = { --ox_lib text ui for using the gem cutting table
                Position = 'left-center', --left-center / right-center / top-center
                Icon = {
                    Icon = 'fa-solid fa-bolt', --FONT AWESOME ICON
                    Color = 'white', --ICON COLOR
                },
                Style = { --REACT.CSS PROPERTIES STYLING
                    borderRadius = 0,
                    backgroundColor = '#1A626B', --BACKGROUND
                    color = 'white' --TEXT COLOR
                }
            },
            Blip = {
                Enabled = true, --true to enable blip / false to hide
                Coords = {x = 232.11, y = 365.09},
                Name = "Gem Cutting",
                Sprite = 617,
                Color = 5,
                ShortRange = true
            },
            Items = {
                {
                    item = 'diamond',
                    label = 'Diamond',
                    costs = {
                        {item = 'uncut_diamond', amount = 1, label = 'Uncut Diamond'},
                    }
                },
                {
                    item = 'emerald',
                    label = 'Emerald',
                    costs = {
                        {item = 'uncut_emerald', amount = 1, label = 'Uncut Emerald'},
                    }
                },
                {
                    item = 'sapphire',
                    label = 'Sapphire',
                    costs = {
                        {item = 'uncut_sapphire', amount = 1, label = 'Uncut Sapphire'},
                    }
                },
                {
                    item = 'ruby',
                    label = 'Ruby',
                    costs = {
                        {item = 'uncut_ruby', amount = 1, label = 'Uncut Ruby'},
                    }
                },
            }
        }
    },

    JewelryCrafting = {
        Enabled = true, --true enables jewelry crafting menu / false to disable
        CraftTimeMin = 25, --Min progress timer seconds to craft jewelry
        CraftTimeMax = 35, --Max progress timer seconds to craft jewelry
        {
            Coords = vector4(131.27, -1772.02, 29.71, 141.06),
            TextUI = { --ox_lib text ui for using the jewelry crafting table
                Position = 'left-center', --left-center / right-center / top-center
                Icon = {
                    Icon = 'fa-solid fa-bolt', --FONT AWESOME ICON
                    Color = 'white', --ICON COLOR
                },
                Style = { --REACT.CSS PROPERTIES STYLING
                    borderRadius = 0,
                    backgroundColor = '#1A626B', --BACKGROUND
                    color = 'white' --TEXT COLOR
                }
            },
            Blip = {
                Enabled = true, --true to enable blip / false to hide
                Coords = {x = 131.27, y = -1772.02},
                Name = "Jewelry Crafting",
                Sprite = 617,
                Color = 5,
                ShortRange = true
            },
            BaseItems = { --shown on the main context menu
                {
                    item = 'gold_ring',
                    label = 'Gold Ring',
                    costs = {
                        {item = 'goldbar', amount = 1, label = 'Gold Bar'}
                    }
                },
                {
                    item = 'gold_earring',
                    label = 'Gold Earring',
                    costs = {
                        {item = 'goldbar', amount = 2, label = 'Gold Bar'}
                    }
                },
                {
                    item = 'gold_chain',
                    label = 'Gold Chain',
                    costs = {
                        {item = 'goldbar', amount = 3, label = 'Gold Bar'}
                    }
                },
                {
                    item = 'silver_ring',
                    label = 'Silver Ring',
                    costs = {
                        {item = 'silverbar', amount = 1, label = 'Silver Bar'}
                    }
                },
                {
                    item = 'silver_earring',
                    label = 'Silver Earring',
                    costs = {
                        {item = 'silverbar', amount = 2, label = 'Silver Bar'}
                    }
                },
                {
                    item = 'silver_chain',
                    label = 'Silver Chain',
                    costs = {
                        {item = 'silverbar', amount = 3, label = 'Silver Bar'}
                    }
                },
            },
            Categories = {
                {
                    name = 'diamond',
                    label = 'Diamond Jewelry',
                    {
                        item = 'diamond_ring',
                        label = 'Diamond Ring',
                        costs = {
                            {item = 'gold_ring', amount = 1, label = 'Gold Ring'},
                            {item = 'diamond', amount = 2, label = 'Diamond'},
                        }
                    },
                    {
                        item = 'diamond_ring_silver',
                        label = 'Silver Diamond Ring',
                        costs = {
                            {item = 'silver_ring', amount = 1, label = 'Silver Ring'},
                            {item = 'diamond', amount = 2, label = 'Diamond'},
                        }
                    },
                    {
                        item = 'diamond_earring',
                        label = 'Diamond Earring',
                        costs = {
                            {item = 'gold_earring', amount = 2, label = 'Gold Earring'},
                            {item = 'diamond', amount = 2, label = 'Diamond'},

                        }
                    },
                    {
                        item = 'diamond_earring_silver',
                        label = 'Silver Diamond Earring',
                        costs = {
                            {item = 'silver_earring', amount = 2, label = 'Silver Earring'},
                            {item = 'diamond', amount = 2, label = 'Diamond'},
                        }
                    },
                    {
                        item = 'diamond_necklace',
                        label = 'Diamond Necklace',
                        costs = {
                            {item = 'gold_chain', amount = 3, label = 'Gold Chain'},
                            {item = 'diamond', amount = 2, label = 'Diamond'},
                        }
                    },
                    {
                        item = 'diamond_necklace_silver',
                        label = 'Silver Diamond Necklace',
                        costs = {
                            {item = 'silver_chain', amount = 3, label = 'Silver Chain'},
                            {item = 'diamond', amount = 2, label = 'Diamond'},
                        }
                    },
                },
                {
                    name = 'emerald',
                    label = 'Emerald Jewelry',
                    {
                        item = 'emerald_ring',
                        label = 'Emerald Ring',
                        costs = {
                            {item = 'gold_ring', amount = 1, label = 'Gold Ring'},
                            {item = 'emerald', amount = 2, label = 'Emerald'},
                        }
                    },
                    {
                        item = 'emerald_ring_silver',
                        label = 'Silver Emerald Ring',
                        costs = {
                            {item = 'silver_ring', amount = 1, label = 'Silver Ring'},
                            {item = 'emerald', amount = 2, label = 'Emerald'},
                        }
                    },
                    {
                        item = 'emerald_earring',
                        label = 'Emerald Earring',
                        costs = {
                            {item = 'gold_earring', amount = 2, label = 'Gold Earring'},
                            {item = 'emerald', amount = 2, label = 'Emerald'},

                        }
                    },
                    {
                        item = 'emerald_earring_silver',
                        label = 'Silver Emerald Earring',
                        costs = {
                            {item = 'silver_earring', amount = 2, label = 'Silver Earring'},
                            {item = 'emerald', amount = 2, label = 'Emerald'},
                        }
                    },
                    {
                        item = 'emerald_necklace',
                        label = 'Emerald Necklace',
                        costs = {
                            {item = 'gold_chain', amount = 3, label = 'Gold Chain'},
                            {item = 'emerald', amount = 2, label = 'Emerald'},
                        }
                    },
                    {
                        item = 'emerald_necklace_silver',
                        label = 'Silver Emerald Necklace',
                        costs = {
                            {item = 'silver_chain', amount = 3, label = 'Silver Chain'},
                            {item = 'emerald', amount = 2, label = 'Emerald'},
                        }
                    },
                },
                {
                    name = 'sapphire',
                    label = 'Sapphire Jewelry',
                    {
                        item = 'sapphire_ring',
                        label = 'Sapphire Ring',
                        costs = {
                            {item = 'gold_ring', amount = 1, label = 'Gold Ring'},
                            {item = 'sapphire', amount = 2, label = 'Sapphire'},
                        }
                    },
                    {
                        item = 'sapphire_ring_silver',
                        label = 'Silver Sapphire Ring',
                        costs = {
                            {item = 'silver_ring', amount = 1, label = 'Silver Ring'},
                            {item = 'sapphire', amount = 2, label = 'Sapphire'},
                        }
                    },
                    {
                        item = 'sapphire_earring',
                        label = 'Sapphire Earring',
                        costs = {
                            {item = 'gold_earring', amount = 2, label = 'Gold Earring'},
                            {item = 'sapphire', amount = 2, label = 'Sapphire'},

                        }
                    },
                    {
                        item = 'sapphire_earring_silver', 
                        label = 'Silver Sapphire Earring',
                        costs = {
                            {item = 'silver_earring', amount = 2, label = 'Silver Earring'},
                            {item = 'sapphire', amount = 2, label = 'Sapphire'},
                        }
                    },
                    {
                        item = 'sapphire_necklace', 
                        label = 'Sapphire Necklace',
                        costs = {
                            {item = 'gold_chain', amount = 3, label = 'Gold Chain'},
                            {item = 'sapphire', amount = 2, label = 'Sapphire'},
                        }
                    },
                    {
                        item = 'sapphire_necklace_silver', 
                        label = 'Silver Sapphire Necklace',
                        costs = {
                            {item = 'silver_chain', amount = 3, label = 'Silver Chain'},
                            {item = 'sapphire', amount = 2, label = 'Sapphire'},
                        }
                    },
                },
                {
                    name = 'ruby',
                    label = 'Ruby Jewelry',
                    {
                        item = 'ruby_ring', 
                        label = 'Ruby Ring',
                        costs = {
                            {item = 'gold_ring', amount = 5, label = 'Gold Ring'},
                            {item = 'ruby', amount = 1, label = 'Ruby'},
                        }
                    },
                    {
                        item = 'ruby_ring_silver', 
                        label = 'Silver Ruby Ring',
                        costs = {
                            {item = 'silver_ring', amount = 5, label = 'Silver Ring'},
                            {item = 'ruby', amount = 1, label = 'Ruby'},
                        }
                    },
                    {
                        item = 'ruby_earring',
                        label = 'Ruby Earring',
                        costs = {
                            {item = 'gold_earring', amount = 7, label = 'Gold Earring'},
                            {item = 'ruby', amount = 1, label = 'Ruby'},

                        }
                    },
                    {
                        item = 'ruby_earring_silver',
                        label = 'Silver Ruby Earring',
                        costs = {
                            {item = 'silver_earring', amount = 7, label = 'Silver Earring'},
                            {item = 'ruby', amount = 1, label = 'Ruby'},
                        }
                    },
                    {
                        item = 'ruby_necklace',
                        label = 'Ruby Necklace',
                        costs = {
                            {item = 'gold_chain', amount = 10, label = 'Gold Chain'},
                            {item = 'ruby', amount = 1, label = 'Ruby'},
                        }
                    },
                    {
                        item = 'ruby_necklace_silver',
                        label = 'Silver Ruby Necklace',
                        costs = {
                            {item = 'silver_chain', amount = 10, label = 'Silver Chain'},
                            {item = 'ruby', amount = 1, label = 'Ruby'},
                        }
                    },
                }
            }
        }
    },

    Logs = { --all the below functions are server sided
        rewardsGiven = function(playerSource, itemsGiven)
            ---Rewards given to player on successful mine (stonewash disabled) or successful stone wash
            ---@param playerSource number Server id of the player
            ---@param itemsGiven table: { [number]: { item string, amount number, label string } } Table of items given

        end,
        stonesGiven = function(playerSource, stoneAmount)
            ---Stone amount given to player on successful mine with stonewash enabled
            ---@param playerSource number Server id of the player
            ---@param stoneAmount number Amount of stones given

        end,
        gemsSold = function(playerSource, gems, saleAmount)
            ---Gems successfully sold to pawn shop
            ---@param playerSource number Server id of the player
            ---@param gems table: { [string]: { name string, amount number, label string } } Table of gem items sold
            ---@param saleAmount number Total money awarded for sale

        end,
        itemsSold = function(playerSource, items, saleAmount)
            ---Items successfully sold to pawn shop
            ---@param playerSource number Server id of the player
            ---@param items table: { [string]: { name string, amount number, label string } } Table of items sold
            ---@param saleAmount number Total money awarded for sale

        end,
        smeltedItems = function(playerSource, item, amount)
            ---Items successfully smelted
            ---@param playerSource number Server id of the player
            ---@param item string Item name
            ---@param amount number Amount smelted

        end,
        gemsCut = function(playerSource, item, amount)
            ---Gem items successfully cut
            ---@param playerSource number Server id of the player
            ---@param item string Item name
            ---@param amount number Amount cut

        end,
        craftedItems = function(playerSource, item, amount)
            ---Items successfully crafted
            ---@param playerSource number Server id of the player
            ---@param item string Item name
            ---@param amount number Amount crafted

        end
    },

    Nodes = {
        --You can add nodes anywhere on the map just use the following format. If you are spawning nodes in a small area like a cave set Inside = true (see Mineshaft nodes below for an example)
        --this will only pull from the node objects that have the Inside parameter set above. This lets you spawn smaller nodes inside and still get random objects pulled from the list

        --Quarry 
        {Coords = vector4(2758.1274414062, 2972.5915527344, 40.314937591553, 289.39797973633)},
        {Coords = vector4(2743.4609375, 2953.4504394531, 39.238830566406, 256.47344970703)},
        {Coords = vector4(2758.3181152344, 2945.203125, 41.537391662598, 247.58383178711)},
        {Coords = vector4(2779.5183105469, 2952.6418457031, 41.758941650391, 241.98620605469)},
        {Coords = vector4(2795.7727050781, 2913.2687988281, 44.457714080811, 245.36880493164)},
        {Coords = vector4(2800.1926269531, 2955.1884765625, 55.304649353027, 335.20050048828)},
        {Coords = vector4(2822.4765625, 2969.4750976562, 61.374565124512, 295.38543701172)},
        {Coords = vector4(2791.0922851562, 2974.3254394531, 50.959892272949, 85.102325439453)},
        {Coords = vector4(2795.3581542969, 2881.7719726562, 39.550899505615, 117.61763763428)},
        {Coords = vector4(2762.3703613281, 2912.1345214844, 36.149353027344, 340.73281860352)},
        {Coords = vector4(2807.1645507812, 2852.1408691406, 41.7209815979, 157.09924316406)},
        {Coords = vector4(2830.67578125, 2894.9128417969, 48.232406616211, 190.34632873535)},
        {Coords = vector4(2818.7893066406, 2884.8984375, 46.314239501953, 355.91293334961)},
        {Coords = vector4(2825.6291503906, 2863.5505371094, 50.041046142578, 278.40274047852)},
        {Coords = vector4(2884.0942382812, 2800.6997070312, 55.074951171875, 300.37860107422)},
        {Coords = vector4(2845.9841308594, 2823.7824707031, 52.855129241943, 200.87670898438)},
        {Coords = vector4(2857.4282226562, 2789.8376464844, 63.313823699951, 195.01763916016)},
        {Coords = vector4(2861.759765625, 2808.7905273438, 54.313510894775, 43.510257720947)},
        {Coords = vector4(2884.7661132812, 2819.189453125, 55.673988342285, 261.1828918457)},
        {Coords = vector4(2882.6364746094, 2780.4343261719, 58.595821380615, 185.22822570801)},
        {Coords = vector4(2950.2214355469, 2796.3308105469, 40.843402862549, 266.54251098633)},
        {Coords = vector4(2917.82421875, 2820.8381347656, 53.831924438476, 295.73580932617)},
        {Coords = vector4(2943.033203125, 2830.8364257812, 48.816242218018, 270.513671875)},
        {Coords = vector4(2969.6838378906, 2841.5852050781, 45.727130889893, 204.2791595459)},
        {Coords = vector4(2954.6381835938, 2815.0502929688, 42.284755706787, 248.05586242676)},
        {Coords = vector4(2925.9636230469, 2806.0158691406, 42.548725128174, 267.13415527344)},
        {Coords = vector4(2912.9309082031, 2785.1005859375, 44.604354858398, 250.83195495605)},
        {Coords = vector4(2937.478515625, 2778.3454589844, 39.236518859863, 296.88555908203)},
        {Coords = vector4(2964.5913085938, 2770.6481933594, 39.531028747559, 276.93804931641)},
        {Coords = vector4(2979.3806152344, 2802.427734375, 43.860500335693, 280.09332275391)},
        {Coords = vector4(2989.2639160156, 2772.5046386719, 42.943309783936, 180.12454223633)},
        {Coords = vector4(2975.1196289062, 2761.9406738281, 43.093185424805, 115.27169036865)},
        {Coords = vector4(2968.9880371094, 2738.9909667969, 43.610088348389, 209.19384765625)},
        {Coords = vector4(2912.8251953125, 2691.7734375, 73.372573852539, 127.48315429688)},
        {Coords = vector4(2945.2724609375, 2717.6882324219, 54.412986755371, 342.29837036133)},
        {Coords = vector4(2919.2043457031, 2741.9350585938, 53.840740203857, 334.74374389648)},
        {Coords = vector4(2906.6926269531, 2773.9792480469, 53.983123779297, 48.191017150879)},
        {Coords = vector4(2907.0407714844, 2751.767578125, 62.541439056396, 254.60061645508)},
        {Coords = vector4(2927.2153320312, 2717.7653808594, 64.574005126953, 210.49673461914)},
        {Coords = vector4(2946.2998046875, 2673.2941894531, 76.049751281738, 94.466590881348)},
        {Coords = vector4(2951.3706054688, 2691.1711425781, 66.03547668457, 252.61827087402)},
        {Coords = vector4(2959.3864746094, 2675.6965332031, 64.015670776367, 271.29879760742)},
        {Coords = vector4(2985.9709472656, 2687.70703125, 65.167381286621, 311.92724609375)},
        {Coords = vector4(2986.6474609375, 2705.2678222656, 64.480857849121, 20.348051071167)},
        {Coords = vector4(3011.6513671875, 2760.0693359375, 54.3073387146, 46.634929656982)},
        {Coords = vector4(3013.046875, 2712.6936035156, 63.889656066895, 251.96057128906)},
        {Coords = vector4(3031.1499023438, 2728.1782226562, 63.209064483643, 90.628265380859)},
        {Coords = vector4(3018.7138671875, 2737.8962402344, 60.691131591797, 114.98987579346)},
        {Coords = vector4(2977.9377441406, 2700.9172363281, 54.660758972168, 341.37896728516)},
        {Coords = vector4(2959.552734375, 2718.3605957031, 54.634132385254, 23.382497787476)},
        {Coords = vector4(2982.7150878906, 2747.8371582031, 56.693656921387, 224.03265380859)},
        {Coords = vector4(3062.248046875, 2745.0356445312, 64.163795471191, 141.3681640625)},
        {Coords = vector4(3057.7802734375, 2729.6362304688, 64.605369567871, 18.707117080688)},
        {Coords = vector4(3060.4060058594, 2775.1997070312, 76.273590087891, 139.47143554688)},
        {Coords = vector4(3070.0051269531, 2740.2233886719, 73.628356933594, 162.50923156738)},
        {Coords = vector4(3017.8425292969, 2692.4270019531, 74.647819519043, 110.06153869629)},
        {Coords = vector4(3033.3527832031, 2845.0744628906, 81.085807800293, 354.88705444336)},
        {Coords = vector4(3068.6740722656, 2820.7272949219, 82.405830383301, 150.43501281738)},
        {Coords = vector4(3052.7751464844, 2863.7141113281, 85.982666015625, 59.217510223389)},
        {Coords = vector4(3034.8950195312, 2778.0954589844, 69.260162353516, 178.71640014648)},
        {Coords = vector4(3005.7709960938, 2824.1723632812, 63.650672912598, 100.29598236084)},
        {Coords = vector4(3002.8659667969, 2855.4399414062, 62.632171630859, 11.816142082214)},
        {Coords = vector4(2988.4680175781, 2819.4584960938, 55.809940338135, 194.62477111816)},
        {Coords = vector4(3069.5502929688, 2919.7507324219, 92.076126098633, 350.04205322266)},
        {Coords = vector4(3053.8605957031, 2881.6882324219, 85.957107543945, 14.036372184753)},
        {Coords = vector4(3077.9318847656, 2892.4431152344, 88.910034179688, 333.19787597656)},
        {Coords = vector4(3067.8249511719, 2978.0876464844, 92.154281616211, 48.656623840332)},
        {Coords = vector4(3048.8205566406, 3025.9272460938, 90.561141967773, 53.297847747803)},
        {Coords = vector4(3050.8493652344, 2996.4382324219, 83.171844482422, 297.46655273438)},
        {Coords = vector4(3056.5883789062, 2950.130859375, 80.39624786377, 107.19609069824)},
        {Coords = vector4(3026.0717773438, 2874.5524902344, 85.191513061523, 313.81970214844)},
        {Coords = vector4(2983.7626953125, 2889.0087890625, 59.960395812988, 108.84399414062)},
        {Coords = vector4(3011.880859375, 2885.2497558594, 72.768447875976, 73.14493560791)},
        {Coords = vector4(3043.6125488281, 2919.0556640625, 70.914070129395, 93.317359924316)},
        {Coords = vector4(3024.0830078125, 2955.6259765625, 66.752738952637, 134.27679443359)},
        {Coords = vector4(2978.2937011719, 2907.8054199219, 71.872756958008, 205.72779846191)},
        {Coords = vector4(3006.0891113281, 2928.0810546875, 64.326469421387, 357.12557983398)},
        {Coords = vector4(3003.7055664062, 2898.2119140625, 60.752967834473, 197.66603088379)},
        {Coords = vector4(2954.115234375, 2929.6235351562, 89.678726196289, 63.653861999512)},
        {Coords = vector4(3005.1911621094, 3027.4489746094, 89.293022155762, 102.47431182861)},
        {Coords = vector4(2992.4487304688, 2986.6296386719, 86.388473510742, 204.39524841308)},
        {Coords = vector4(2976.8115234375, 2960.986328125, 88.475448608398, 223.63499450684)},
        {Coords = vector4(3006.7316894531, 2989.1008300781, 84.558891296387, 76.357398986816)},
        {Coords = vector4(3018.9821777344, 2991.7553710938, 72.191337585449, 209.09492492676)},
        {Coords = vector4(3014.6943359375, 2961.6555175781, 75.196846008301, 12.077410697937)},
        {Coords = vector4(2977.6440429688, 2930.4462890625, 78.442481994629, 214.11064147949)},
        {Coords = vector4(2880.6701660156, 2883.5874023438, 86.004943847656, 315.13040161133)},
        {Coords = vector4(2919.4182128906, 2901.8420410156, 87.255577087402, 204.8540802002)},
        {Coords = vector4(2858.2888183594, 2918.697265625, 74.613052368164, 79.004554748535)},
        {Coords = vector4(2838.4462890625, 2959.7194824219, 65.37809753418, 333.23886108398)},
        {Coords = vector4(2857.2084960938, 2854.2795410156, 58.799404144287, 72.797752380371)},
        {Coords = vector4(2897.8266601562, 2847.7712402344, 63.798629760742, 214.74729919434)},
        {Coords = vector4(2931.95703125, 2870.5881347656, 62.175067901611, 237.51718139648)},
        {Coords = vector4(2973.83984375, 2873.1572265625, 58.291511535645, 268.36450195312)},
        {Coords = vector4(2942.1455078125, 2867.0822753906, 57.824207305908, 23.738882064819)},
        {Coords = vector4(2905.1606445312, 2829.4970703125, 54.258167266846, 186.59587097168)},

        --Mineshaft
        {Coords = vector4(-587.54, 2058.22, 130.54, 210.33), Inside = true},
        {Coords = vector4(-583.88, 2039.09, 129.23, 189.85), Inside = true},
        {Coords = vector4(-568.94, 2022.08, 127.83, 316.46), Inside = true},
        {Coords = vector4(-556.24, 2003.49, 127.3, 179.33), Inside = true},
        {Coords = vector4(-546.12, 1989.64, 127.21, 320.81), Inside = true},
        {Coords = vector4(-545.28, 1982.07, 127.03, 139.51), Inside = true},
        {Coords = vector4(-531.98, 1979.89, 127.16, 197.96), Inside = true},
        {Coords = vector4(-511.75, 1979.9, 126.45, 331.71), Inside = true},
        {Coords = vector4(-487.35, 1984.21, 124.41, 236.24), Inside = true},
        {Coords = vector4(-463.5, 1997.52, 123.55, 10.39), Inside = true},
        {Coords = vector4(-445.58, 2012.46, 123.57, 280.7), Inside = true},
        {Coords = vector4(-450.75, 2022.47, 123.52, 65.09), Inside = true},
        {Coords = vector4(-454.44, 2044.37, 122.74, 354.27), Inside = true},
        {Coords = vector4(-469.07, 2069.92, 120.62, 95.17), Inside = true},
        {Coords = vector4(-470.75, 2086.81, 120.09, 321.94), Inside = true},
        {Coords = vector4(-451.94, 2054.17, 122.22, 260.39), Inside = true},
        {Coords = vector4(-427.37, 2064.8, 120.63, 359.14), Inside = true},
        {Coords = vector4(-541.07, 1966.74, 126.86, 268.43), Inside = true},
        {Coords = vector4(-537.4, 1937.28, 125.36, 155.52), Inside = true},
        {Coords = vector4(-534.31, 1920.12, 124.02, 252.12), Inside = true},
        {Coords = vector4(-550.56, 1896.65, 123.04, 104.04), Inside = true},
        {Coords = vector4(-562.24, 1886.21, 123.02, 207.84), Inside = true},
        {Coords = vector4(-516.25, 1895.87, 122.08, 270.65), Inside = true},
        {Coords = vector4(-500.28, 1892.09, 121.0, 225.76), Inside = true},
        {Coords = vector4(-485.54, 1896.02, 119.96, 95.64), Inside = true},
    }
}