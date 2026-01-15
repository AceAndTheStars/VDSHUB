-- Upgrades.lua
-- Modular upgrades tab for VDS Private Hub
-- 6 instant upgrade buttons: Strength, Durability, Chakra, Sword, Speed, Agility
-- Loaded via: loadstring(game:HttpGet("your-link/Upgrades.lua"))(Window, NebulaIcons)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local RemoteFunction = Remotes:WaitForChild("RemoteFunction")

-- Stat mapping (matches your Autofarm: 1=Strength, 2=Durability, 3=Chakra, 4=Sword, 5=Agility, 6=Speed)
local upgradeStats = {
    {name = "Strength",  id = 1},
    {name = "Durability", id = 2},
    {name = "Chakra",     id = 3},
    {name = "Sword",      id = 4},
    {name = "Agility",    id = 5},
    {name = "Speed",      id = 6},
}

return function(Window, NebulaIcons)
    local UpgradesTab = Window:CreateTab({
        Name = "Upgrades",
        Icon = NebulaIcons:GetIcon('upgrade', 'Material'),
        Columns = 2,
    }, "INDEX")

    local UpgradeGroup = UpgradesTab:CreateGroupbox({
        Name = "Instant Upgrades",
        Column = 1,
    }, "INDEX")

    -- Optional info label
    UpgradeGroup:CreateLabel({
        Name = "Click to upgrade once (costs Yen)",
    }, "INDEX")

    -- Create the 6 buttons with exact logic provided
    for _, stat in ipairs(upgradeStats) do
        UpgradeGroup:CreateButton({
            Name = "Upgrade " .. stat.name,
            Icon = NebulaIcons:GetIcon('fitness_center', 'Material'),
            Callback = function()
                pcall(function()
                    local args = {
                        "Upgrade",
                        stat.id
                    }
                    RemoteFunction:InvokeServer(unpack(args))
                end)
            end,
        }, "INDEX")
    end

    -- Right column: optional extras
    local InfoGroup = UpgradesTab:CreateGroupbox({
        Name = "Info",
        Column = 2,
    }, "INDEX")

    InfoGroup:CreateLabel({
        Name = "• One click = one upgrade",
    }, "INDEX")
    InfoGroup:CreateLabel({
        Name = "• Requires enough Yen",
    }, "INDEX")
end