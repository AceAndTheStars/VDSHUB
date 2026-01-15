-- Autofarm.lua – Updated to remove non-existent CreateTabSection
return function(Window, NebulaIcons)
    local AutofarmTab = Window:CreateTab({
        Name = "Autofarm",
        Icon = NebulaIcons:GetIcon('auto_awesome', 'Material'),
        Columns = 2,
    }, "INDEX")

    local AutofarmGroup = AutofarmTab:CreateGroupbox({
        Name = "Stat Autofarm",
        Column = 1,
    }, "INDEX")

    local toggles = {
        strength = false,
        durability = false,
        chakra = false,
        sword = false,
        agility = false,
        speed = false
    }

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Remotes = ReplicatedStorage:WaitForChild("Remotes", 10)  -- timeout safety
    local RemoteEvent = Remotes and Remotes:WaitForChild("RemoteEvent", 5)

    local function createStatToggle(name, id, varName)
        AutofarmGroup:CreateToggle({
            Name = "Auto " .. name,
            CurrentValue = false,
            Style = 2,
            Callback = function(Value)
                toggles[varName] = Value
                if Value and RemoteEvent then
                    task.spawn(function()
                        while toggles[varName] do
                            pcall(function()
                                RemoteEvent:FireServer("Train", id)
                            end)
                            task.wait(0.1)
                        end
                    end)
                elseif Value then
                    warn("RemoteEvent not found for Auto " .. name)
                end
            end,
        }, "INDEX")
    end

    createStatToggle("Strength",   1, "strength")
    createStatToggle("Durability", 2, "durability")
    createStatToggle("Chakra",     3, "chakra")
    createStatToggle("Sword",      4, "sword")
    createStatToggle("Agility",    5, "agility")
    createStatToggle("Speed",      6, "speed")
end