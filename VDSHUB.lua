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

-- VDS HUB - Key System (Pastebin-based)

local KeyListUrl = "https://pastebin.com/raw/b6AThZwL"  -- Your raw link

-- Fetch key list
local success, response = pcall(function()
    return game:HttpGet(KeyListUrl)
end)

if not success then
    game.Players.LocalPlayer:Kick("Failed to load key list. Try again later or check internet.")
    return
end

-- Parse keys (one per line, trimmed)
local validKeys = {}
for line in response:gmatch("[^\r\n]+") do
    local trimmed = line:match("^%s*(.-)%s*$")
    if trimmed ~= "" then
        table.insert(validKeys, trimmed)
    end
end

-- Check user's key
if _G.Key == nil or _G.Key == "" or not table.find(validKeys, _G.Key) then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "VDS HUB",
        Text = "Invalid or missing key. Get your key from Sorbei.",
        Duration = 10
    })
    -- Optional kick (uncomment if you want to force close)
    -- game.Players.LocalPlayer:Kick("Invalid key. Contact Sorbei.")
    return
end

-- Key is valid → load the hub
loadstring(game:HttpGet("https://raw.githubusercontent.com/VisualDoggyStudios/VDSHUB/refs/heads/main/Main.lua"))()