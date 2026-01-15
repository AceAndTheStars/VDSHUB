-- Teleports.lua
-- Modular teleport tab for VDS Private Hub
-- Expects to be loaded via: loadstring(...)(Window, NebulaIcons)

local function teleportToArea(position)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(position)
    end
end

return function(Window, NebulaIcons)
    local TeleportsTab = Window:CreateTab({
        Name = "Teleports",
        Icon = NebulaIcons:GetIcon('place', 'Material'),
        Columns = 2,
    }, "INDEX")

    -- Main groupbox for training zones
    local TrainingGroup = TeleportsTab:CreateGroupbox({
        Name = "Training Zones",
        Column = 1,
    }, "INDEX")

    -- Helper to create a section header (optional visual separation)
    local function addSectionHeader(name)
        TrainingGroup:CreateLabel({
            Name = "——— " .. name .. " ———",
        }, "INDEX")
    end

    -- ========================================================================
    -- Strength Areas
    -- ========================================================================
    addSectionHeader("Strength Areas")

    local strengthZones = {
        {name = "[100 Strength]",      pos = Vector3.new(-6.535,    65.000,  127.964)},
        {name = "[10K Strength]",      pos = Vector3.new(1341.183,  153.963, -134.552)},
        {name = "[100K Strength]",     pos = Vector3.new(-1247.836, 59.000,  481.151)},
        {name = "[1M Strength]",       pos = Vector3.new(-905.422,  84.882,  170.033)},
        {name = "[10M Strength]",      pos = Vector3.new(-2257.115, 617.105, 546.753)},
        {name = "[100M Strength]",     pos = Vector3.new(-51.014,   63.736, -1302.732)},
        {name = "[1B Strength]",       pos = Vector3.new(714.433,   151.732, 926.474)},
        {name = "[100B Strength]",     pos = Vector3.new(1846.153,  141.200, 90.468)},
        {name = "[5T Strength]",       pos = Vector3.new(604.720,   653.458, 413.728)},
        {name = "[250T Strength]",     pos = Vector3.new(4284.651,  60.000, -534.592)},
        {name = "[75qd Strength]",     pos = Vector3.new(797.981,   232.382, -1002.742)},
        {name = "[2.5QN Strength]",    pos = Vector3.new(3873.921,  136.388, 855.103)},
        {name = "[1sx Strength]",      pos = Vector3.new(3933.355,  724.772, -1197.858)},
    }

    for _, zone in ipairs(strengthZones) do
        TrainingGroup:CreateButton({
            Name = zone.name,
            Callback = function()
                teleportToArea(zone.pos)
            end,
        }, "INDEX")
    end

    -- ========================================================================
    -- Durability Areas
    -- ========================================================================
    addSectionHeader("Durability Areas")

    local durabilityZones = {
        {name = "[100 Durability]",    pos = Vector3.new(72.340,    69.263,  877.353)},
        {name = "[10K Durability]",    pos = Vector3.new(-1602.088, 61.502, -532.064)},
        {name = "[100K Durability]",   pos = Vector3.new(-77.845,   61.008, 2037.284)},
        {name = "[1M Durability]",     pos = Vector3.new(-621.543,  179.000, 741.890)},
        {name = "[10M Durability]",    pos = Vector3.new(-1102.311, 212.630, -946.145)},
        {name = "[100M Durability]",   pos = Vector3.new(-341.295,  72.620, -1653.579)},
        {name = "[1B Durability]",     pos = Vector3.new(2495.276,  1540.875,-356.906)},
        {name = "[100B Durability]",   pos = Vector3.new(-2171.543, 617.517, 525.640)},
        {name = "[5T Durability]",     pos = Vector3.new(2188.043,  518.649, 576.627)},
        {name = "[250T Durability]",   pos = Vector3.new(1671.975,  423.930,-1291.617)},
        {name = "[75QD Durability]",   pos = Vector3.new(165.322,   773.591, -716.061)},
        {name = "[2.5QN Durability]",  pos = Vector3.new(2590.823,  63.229, 1697.295)},
        {name = "[1sx Durability]",    pos = Vector3.new(1726.687,  2305.067,61.937)},
    }

    for _, zone in ipairs(durabilityZones) do
        TrainingGroup:CreateButton({
            Name = zone.name,
            Callback = function()
                teleportToArea(zone.pos)
            end,
        }, "INDEX")
    end

    -- ========================================================================
    -- Chakra Areas
    -- ========================================================================
    addSectionHeader("Chakra Areas")

    local chakraZones = {
        {name = "[100 Chakra]",        pos = Vector3.new(-3.768,    65.000, -117.034)},
        {name = "[10K Chakra]",        pos = Vector3.new(1423.010,  147.000, -582.122)},
        {name = "[100K Chakra]",       pos = Vector3.new(917.247,   141.000, 781.455)},
        {name = "[1M Chakra]",         pos = Vector3.new(1576.373,  388.750, 675.160)},
        {name = "[10M Chakra]",        pos = Vector3.new(334.134,  -129.590,-1840.660)},
        {name = "[100M Chakra]",       pos = Vector3.new(1028.428,  251.000, -627.812)},
        {name = "[1B Chakra]",         pos = Vector3.new(3053.941,  110.900,1105.880)},
        {name = "[100B Chakra]",       pos = Vector3.new(1552.188,  88.724, 1717.498)},
        {name = "[5T Chakra]",         pos = Vector3.new(-17.094,   62.073, -478.995)},
        {name = "[250T Chakra]",       pos = Vector3.new(-396.257, 1237.356, 670.550)},
        {name = "[75qd Chakra]",       pos = Vector3.new(-737.839, 2792.597, 567.334)},
        {name = "[2.5QN Chakra]",      pos = Vector3.new(3151.687,  163.000, -102.653)},
        {name = "[1sx Chakra]",        pos = Vector3.new(358.822,   292.742,1864.116)},
    }

    for _, zone in ipairs(chakraZones) do
        TrainingGroup:CreateButton({
            Name = zone.name,
            Callback = function()
                teleportToArea(zone.pos)
            end,
        }, "INDEX")
    end

    -- ========================================================================
    -- Speed & Agility + Misc
    -- ========================================================================
    addSectionHeader("Speed / Agility / Misc")

    local miscZones = {
        {name = "[100 Speed]",              pos = Vector3.new(-104.639, 61.000, -508.363)},
        {name = "[100 Agility]",            pos = Vector3.new(39.896,   69.183, 462.580)},
        {name = "[10K Speed & Agility]",    pos = Vector3.new(-386.277, 105.000,-47.382)},
        {name = "[100K Speed & Agility]",   pos = Vector3.new(3484.517, 60.000, 144.701)},
        {name = "[5M Speed & Agility]",     pos = Vector3.new(4111.812, 60.922, 849.557)},
        {name = "Boom",                     pos = Vector3.new(-33.801,  80.224,  3.453)},
        {name = "Ghoul",                    pos = Vector3.new(1695.234, 142.400,-172.643)},
        {name = "Giovanni",                 pos = Vector3.new(151.815,  62.400, -231.939)},
        {name = "Happi",                    pos = Vector3.new(23.235,  105.143, 36.597)},
        {name = "Reindeer",                 pos = Vector3.new(-31.839, 105.146, 35.543)},
        {name = "Sword Master",             pos = Vector3.new(325.219,  69.576,-1990.182)},
    }

    for _, zone in ipairs(miscZones) do
        TrainingGroup:CreateButton({
            Name = zone.name,
            Callback = function()
                teleportToArea(zone.pos)
            end,
        }, "INDEX")
    end

    -- Optional: You can add another groupbox on Column 2 later (e.g. for favorite teleports, recent, or search)
end