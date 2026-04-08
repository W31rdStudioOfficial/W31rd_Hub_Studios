local supported_games = "https://raw.githubusercontent.com/W31rdStudioOfficial/W31rd_Hub_Studios/refs/heads/main/Supported-Games"

getgenv().loading = getgenv().loading or false

local execute_on_teleport = true

repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local placeId = game.PlaceId

local success, games = pcall(function()
    return loadstring(game:HttpGet(supported_games))()
end)

if not success or type(games) ~= "table" then
    return
end

local scriptUrl = games[placeId]

if scriptUrl then
    local s, result = pcall(function()
        return game:HttpGet(scriptUrl)
    end)
    if s then
        loadstring(result)()
    end
end

if execute_on_teleport and not getgenv().loading then
    getgenv().loading = true

    local autoLoadScript = syn and syn.queue_on_teleport or queueonteleport or queue_on_teleport
    if autoLoadScript then
        autoLoadScript([[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/W31rdStudioOfficial/W31rd_Hub_Studios/refs/heads/main/W31rd-Hub-Studios.luau"))()
        ]])
    end
end
