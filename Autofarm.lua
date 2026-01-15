-- Autofarm.lua
return function(Window, NebulaIcons)
    local TabSection = Window:CreateTabSection("Main")  -- or however you want to group

    local AutofarmTab = TabSection:CreateTab({
        Name = "Autofarm",
        Icon = NebulaIcons:GetIcon('auto_awesome', 'Material'),
        Columns = 2,
    }, "INDEX")

    local AutofarmGroup = AutofarmTab:CreateGroupbox({
        Name = "Stat Autofarm",
        Column = 1,
    }, "INDEX")

    -- Your toggle variables
    local toggles = { strength = false, durability = false, ... }

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
                            game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("Train", id)
                            task.wait(0.1)
                        end
                    end)
                end
            end,
        }, "INDEX")
    end

    createStatToggle("Strength", 1, "strength")
    createStatToggle("Durability", 2, "durability")
    -- ... add the rest (Chakra=3, Sword=4, Agility=5, Speed=6)

    -- You can add more groups/toggles here later (e.g. auto-quest, auto-mobs)
end