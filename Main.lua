if not run_on_actor then return end

local getactors = getactors or function()
  local Actors = {}
  for i, v in game:QueryDescendants("Actor") do
    table.insert(Actors, v)
  end
  return Actors
end

local Source = [=[
  for i, v in getgc(true) do
    if type(v) == "function" then
      local Info = debug.getinfo(v)
      if Info and Info.source and Info.source:find("ReplicatedFirst") then
        pcall(hookfunction, v, function()
          return coroutine.running(coroutine.yield())
        end)
      end
    end
  end
]=]

local State = getactors()
if #State < 1 then return end
pcall(run_on_actor, State[1], Source)

local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()  

local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

local Window = Starlight:CreateWindow({
    Name = "VDS | Private hub",
    Subtitle = "v1.0",
    Icon = 117893888659479,

    LoadingSettings = {
        Title = "VDS HUB [PRIVATE]",
        Subtitle = "Welcome to the #1 script hub [private]",
    },

    FileSettings = {
        ConfigFolder = "VDS_HUB"
    },
})

Window:CreateHomeTab({
    SupportedExecutors = {},
    UnsupportedExecutors = {},
    DiscordInvite = "mRYabVfEQS",
    Backdrop = nil,
    IconStyle = 1,
    Changelog = {
        {
            Title = "Latest Update",
            Date = "January 13, 2026",
            Description = "[+] Anti-Cheat bypassed"
        }
    }
})

local TabSection = Window:CreateTabSection("Main")

local AutofarmTab = TabSection:CreateTab({
    Name = "Autofarm",
    Icon = NebulaIcons:GetIcon('auto_awesome', 'Material'),
    Columns = 2,
}, "INDEX")

local AutofarmGroup = AutofarmTab:CreateGroupbox({
    Name = "Stat Autofarm",
    Column = 1,
}, "INDEX")

local strengthRunning = false
local durabilityRunning = false
local chakraRunning = false
local swordRunning = false
local agilityRunning = false
local speedRunning = false

AutofarmGroup:CreateToggle({
    Name = "Auto Strength",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        strengthRunning = Value
        if Value then
            task.spawn(function()
                while strengthRunning do
                    local args = {"Train", 1}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end,
}, "INDEX")

AutofarmGroup:CreateToggle({
    Name = "Auto Durability",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        durabilityRunning = Value
        if Value then
            task.spawn(function()
                while durabilityRunning do
                    local args = {"Train", 2}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end,
}, "INDEX")

AutofarmGroup:CreateToggle({
    Name = "Auto Chakra",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        chakraRunning = Value
        if Value then
            task.spawn(function()
                while chakraRunning do
                    local args = {"Train", 3}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end,
}, "INDEX")

AutofarmGroup:CreateToggle({
    Name = "Auto Sword",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        swordRunning = Value
        if Value then
            task.spawn(function()
                while swordRunning do
                    local args = {"Train", 4}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end,
}, "INDEX")

AutofarmGroup:CreateToggle({
    Name = "Auto Agility",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        agilityRunning = Value
        if Value then
            task.spawn(function()
                while agilityRunning do
                    local args = {"Train", 5}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end,
}, "INDEX")

AutofarmGroup:CreateToggle({
    Name = "Auto Speed",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        speedRunning = Value
        if Value then
            task.spawn(function()
                while speedRunning do
                    local args = {"Train", 6}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end,
}, "INDEX")

local CurrencyTab = TabSection:CreateTab({
    Name = "Currency",
    Icon = NebulaIcons:GetIcon('trending_up', 'Material'),
    Columns = 2,
}, "INDEX")

local CurrencyGroup = CurrencyTab:CreateGroupbox({
    Name = "Currency Farm",
    Column = 1,
}, "INDEX")

CurrencyGroup:CreateButton({
    Name = "Infinite Yen",
    Icon = NebulaIcons:GetIcon('money', 'Material'),
    Callback = function()
        local player1 = game:GetService("Players").LocalPlayer
        local yen = player1.OtherData.Yen
        local amountPerTick = 10000
        local delayTime = 0
        
        task.spawn(function()
            while true do
                yen.Value += amountPerTick
                task.wait(delayTime)
            end
        end)
    end,
}, "INDEX")

CurrencyGroup:CreateButton({
    Name = "Infinite Chikara",
    Icon = NebulaIcons:GetIcon('star', 'Material'),
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local chikara = player.OtherData.Chikara
        local amountPerTick = 10000
        local delayTime = 0
        
        task.spawn(function()
            while true do
                chikara.Value += amountPerTick
                task.wait(delayTime)
            end
        end)
    end,
}, "INDEX")

-- Teleports tab
local TeleportsTab = TabSection:CreateTab({
    Name = "Teleports",
    Icon = NebulaIcons:GetIcon('place', 'Material'),
    Columns = 2,
}, "INDEX")

local function teleportToArea(position)
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = character.HumanoidRootPart
    hrp.CFrame = CFrame.new(position)
end

local TeleportsGroup = TeleportsTab:CreateGroupbox({
    Name = "Teleport Locations",
    Column = 1,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100 Strength]",
    Callback = function() teleportToArea(Vector3.new(-6.535, 65.000, 127.964)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[10K Strength]",
    Callback = function() teleportToArea(Vector3.new(1341.183, 153.963, -134.552)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100K Strength]",
    Callback = function() teleportToArea(Vector3.new(-1247.836, 59.000, 481.151)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1M Strength]",
    Callback = function() teleportToArea(Vector3.new(-905.422, 84.882, 170.033)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[10M Strength]",
    Callback = function() teleportToArea(Vector3.new(-2257.115, 617.105, 546.753)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100M Strength]",
    Callback = function() teleportToArea(Vector3.new(-51.014, 63.736, -1302.732)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1B Strength]",
    Callback = function() teleportToArea(Vector3.new(714.433, 151.732, 926.474)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100B Strength]",
    Callback = function() teleportToArea(Vector3.new(1846.153, 141.200, 90.468)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[5T Strength]",
    Callback = function() teleportToArea(Vector3.new(604.720, 653.458, 413.728)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[250T Strength]",
    Callback = function() teleportToArea(Vector3.new(4284.651, 60.000, -534.592)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[75qd Strength]",
    Callback = function() teleportToArea(Vector3.new(797.981, 232.382, -1002.742)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[2.5QN Strength]",
    Callback = function() teleportToArea(Vector3.new(3873.921, 136.388, 855.103)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1sx Strength]",
    Callback = function() teleportToArea(Vector3.new(3933.355, 724.772, -1197.858)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100 Durability]",
    Callback = function() teleportToArea(Vector3.new(72.340, 69.263, 877.353)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[10K Durability]",
    Callback = function() teleportToArea(Vector3.new(-1602.088, 61.502, -532.064)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100K Durability]",
    Callback = function() teleportToArea(Vector3.new(-77.845, 61.008, 2037.284)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1M Durability]",
    Callback = function() teleportToArea(Vector3.new(-621.543, 179.000, 741.890)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[10M Durability]",
    Callback = function() teleportToArea(Vector3.new(-1102.311, 212.630, -946.145)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100M Durability]",
    Callback = function() teleportToArea(Vector3.new(-341.295, 72.620, -1653.579)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1B Durability]",
    Callback = function() teleportToArea(Vector3.new(2495.276, 1540.875, -356.906)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100B Durability]",
    Callback = function() teleportToArea(Vector3.new(-2171.543, 617.517, 525.640)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[5T Durability]",
    Callback = function() teleportToArea(Vector3.new(2188.043, 518.649, 576.627)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[250T Durability]",
    Callback = function() teleportToArea(Vector3.new(1671.975, 423.930, -1291.617)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[75QD Durability]",
    Callback = function() teleportToArea(Vector3.new(165.322, 773.591, -716.061)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[2.5QN Durability]",
    Callback = function() teleportToArea(Vector3.new(2590.823, 63.229, 1697.295)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1sx Durability]",
    Callback = function() teleportToArea(Vector3.new(1726.687, 2305.067, 61.937)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100 Chakra]",
    Callback = function() teleportToArea(Vector3.new(-3.768, 65.000, -117.034)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[10K Chakra]",
    Callback = function() teleportToArea(Vector3.new(1423.010, 147.000, -582.122)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100K Chakra]",
    Callback = function() teleportToArea(Vector3.new(917.247, 141.000, 781.455)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1M Chakra]",
    Callback = function() teleportToArea(Vector3.new(1576.373, 388.750, 675.160)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[10M Chakra]",
    Callback = function() teleportToArea(Vector3.new(334.134, -129.590, -1840.660)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100M Chakra]",
    Callback = function() teleportToArea(Vector3.new(1028.428, 251.000, -627.812)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1B Chakra]",
    Callback = function() teleportToArea(Vector3.new(3053.941, 110.900, 1105.880)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100B Chakra]",
    Callback = function() teleportToArea(Vector3.new(1552.188, 88.724, 1717.498)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[5T Chakra]",
    Callback = function() teleportToArea(Vector3.new(-17.094, 62.073, -478.995)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[250T Chakra]",
    Callback = function() teleportToArea(Vector3.new(-396.257, 1237.356, 670.550)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[75qd Chakra]",
    Callback = function() teleportToArea(Vector3.new(-737.839, 2792.597, 567.334)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[2.5QN Chakra]",
    Callback = function() teleportToArea(Vector3.new(3151.687, 163.000, -102.653)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[1sx Chakra]",
    Callback = function() teleportToArea(Vector3.new(358.822, 292.742, 1864.116)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100 Speed]",
    Callback = function() teleportToArea(Vector3.new(-104.639, 61.000, -508.363)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100 Agility]",
    Callback = function() teleportToArea(Vector3.new(39.896, 69.183, 462.580)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[10K Speed & Agility]",
    Callback = function() teleportToArea(Vector3.new(-386.277, 105.000, -47.382)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[100K Speed & Agility]",
    Callback = function() teleportToArea(Vector3.new(3484.517, 60.000, 144.701)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "[5M Speed & Agility]",
    Callback = function() teleportToArea(Vector3.new(4111.812, 60.922, 849.557)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "Boom",
    Callback = function() teleportToArea(Vector3.new(-33.801, 80.224, 3.453)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "Ghoul",
    Callback = function() teleportToArea(Vector3.new(1695.234, 142.400, -172.643)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "Giovanni",
    Callback = function() teleportToArea(Vector3.new(151.815, 62.400, -231.939)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "Happi",
    Callback = function() teleportToArea(Vector3.new(23.235, 105.143, 36.597)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "Reindeer",
    Callback = function() teleportToArea(Vector3.new(-31.839, 105.146, 35.543)) end,
}, "INDEX")

TeleportsGroup:CreateButton({
    Name = "Sword Master",
    Callback = function() teleportToArea(Vector3.new(325.219, 69.576, -1990.182)) end,
}, "INDEX")