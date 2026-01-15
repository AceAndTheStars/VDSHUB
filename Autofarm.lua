-- Autofarm.lua (fixed version – upload this to GitHub)
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

    local function createStatToggle(name, id, varName)
        AutofarmGroup:CreateToggle({
            Name = "Auto " .. name,
            CurrentValue = false,
            Style = 2,
            Callback = function(Value)
                toggles[varName] = Value
                if Value then
                    task.spawn(function()
                        while toggles[varName] do
                            local rem = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent")
                            rem:FireServer("Train", id)
                            task.wait(0.1)
                        end
                    end)
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